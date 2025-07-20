#!/bin/bash
# Context Engineering System v2.0 - Script de Instalación Simplificado
# Instala el sistema de ingeniería de contexto en un proyecto

set -e  # Exit on any error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Directorio fuente (donde está este script)
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║       Context Engineering System v2.0 - Instalación          ║"
    echo "║     Advanced Token Economy & Intelligent Workflow Management ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

show_help() {
    echo "Context Engineering System - Instalación"
    echo ""
    echo "Uso: $0 [DIRECTORIO_PROYECTO]"
    echo ""
    echo "Argumentos:"
    echo "  DIRECTORIO_PROYECTO  Directorio del proyecto donde instalar"
    echo ""
    echo "Ejemplos:"
    echo "  $0 .                        # Instalar en directorio actual"
    echo "  $0 /ruta/a/mi-proyecto      # Instalar en ruta específica"
    echo ""
}

# Verificar si se proporcionó un argumento de ayuda
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Verificar si se proporcionó un directorio de proyecto
if [[ -z "$1" ]]; then
    print_error "Debes especificar un directorio de proyecto"
    echo ""
    show_help
    exit 1
fi

# Directorio de destino
PROJECT_DIR="$1"

# Convertir a ruta absoluta si es relativa
if [[ ! "$PROJECT_DIR" = /* ]]; then
    PROJECT_DIR="$(pwd)/$PROJECT_DIR"
fi

print_header

print_info "Instalando Context Engineering System en: $PROJECT_DIR"

# Verificar si el directorio existe
if [[ ! -d "$PROJECT_DIR" ]]; then
    print_info "El directorio no existe. Creándolo..."
    mkdir -p "$PROJECT_DIR" || { 
        print_error "No se pudo crear el directorio de proyecto"
        exit 1
    }
fi

# Crear estructura de directorios en el proyecto
print_info "Creando estructura de directorios..."

# Estructura de workflow
mkdir -p "$PROJECT_DIR/workflow/planned" || true
mkdir -p "$PROJECT_DIR/workflow/in-progress/active" || true
mkdir -p "$PROJECT_DIR/workflow/in-progress/paused" || true
mkdir -p "$PROJECT_DIR/workflow/completed/successful" || true
mkdir -p "$PROJECT_DIR/workflow/completed/archived" || true

# Crear directorio .claude
mkdir -p "$PROJECT_DIR/.claude/commands" || true
mkdir -p "$PROJECT_DIR/.claude/shared" || true

print_success "Estructura de directorios creada"

# Copiar archivos de comandos
print_info "Copiando archivos de comandos..."

# Copiar archivos principales
if [[ -d "$SOURCE_DIR/commands" ]]; then
    # Comandos principales
    for cmd in "$SOURCE_DIR/commands"/*.md; do
        if [[ -f "$cmd" ]]; then
            cp "$cmd" "$PROJECT_DIR/.claude/commands/" || true
            print_success "Copiado: $(basename "$cmd")"
        fi
    done
    
    # Archivos compartidos
    if [[ -d "$SOURCE_DIR/commands/shared" ]]; then
        for shared in "$SOURCE_DIR/commands/shared"/*.yml; do
            if [[ -f "$shared" ]]; then
                cp "$shared" "$PROJECT_DIR/.claude/shared/" || true
                print_success "Copiado: shared/$(basename "$shared")"
            fi
        done
    fi
else
    print_warning "No se encontró el directorio de comandos en el código fuente"
    
    # Si no hay directorio de comandos, copiar desde el directorio .claude si existe
    if [[ -d "$SOURCE_DIR/.claude/commands" ]]; then
        cp -r "$SOURCE_DIR/.claude/commands"/* "$PROJECT_DIR/.claude/commands/" || true
        print_success "Copiados comandos desde .claude/commands"
    fi
    
    # Copiar archivos compartidos
    if [[ -d "$SOURCE_DIR/.claude/shared" ]]; then
        cp -r "$SOURCE_DIR/.claude/shared"/* "$PROJECT_DIR/.claude/shared/" || true
        print_success "Copiados archivos compartidos desde .claude/shared"
    elif [[ -d "$SOURCE_DIR/.claude/commands/shared" ]]; then
        cp -r "$SOURCE_DIR/.claude/commands/shared"/* "$PROJECT_DIR/.claude/shared/" || true
        print_success "Copiados archivos compartidos desde .claude/commands/shared"
    fi
fi

# Copiar CLAUDE.md si existe
if [[ -f "$SOURCE_DIR/CLAUDE.md" ]]; then
    cp "$SOURCE_DIR/CLAUDE.md" "$PROJECT_DIR/.claude/" || true
    print_success "Copiado: CLAUDE.md"
elif [[ -f "$SOURCE_DIR/.claude/CLAUDE.md" ]]; then
    cp "$SOURCE_DIR/.claude/CLAUDE.md" "$PROJECT_DIR/.claude/" || true
    print_success "Copiado: CLAUDE.md desde .claude/"
fi

# Copiar templates
if [[ -d "$SOURCE_DIR/workflow/templates" ]]; then
    mkdir -p "$PROJECT_DIR/workflow/templates"
    cp -r "$SOURCE_DIR/workflow/templates"/* "$PROJECT_DIR/workflow/templates/" 2>/dev/null || true
    print_success "Copiadas plantillas de características"
fi

# Copiar documentación principal
if [[ -d "$SOURCE_DIR/docs" ]]; then
    mkdir -p "$PROJECT_DIR/.claude/docs"
    cp "$SOURCE_DIR/docs/context-engine-guide.md" "$PROJECT_DIR/.claude/docs/" 2>/dev/null || true
    cp "$SOURCE_DIR/docs/installation-guide.md" "$PROJECT_DIR/.claude/docs/" 2>/dev/null || true
    print_success "Copiada documentación principal"
fi

# Crear un archivo README.md en workflow si no existe
if [[ ! -f "$PROJECT_DIR/workflow/README.md" ]]; then
    cat > "$PROJECT_DIR/workflow/README.md" << 'EOF'
# Directorio de Características

Este directorio gestiona el flujo de trabajo de desarrollo dirigido por características usando principios de Ingeniería de Contexto.

## Estructura de directorios

```
workflow/
├── planned/          # Características listas para implementar
├── in-progress/      # Características en desarrollo
│   ├── active/       # En desarrollo activo
│   └── paused/       # Pausadas temporalmente
├── completed/        # Características implementadas
│   ├── successful/   # Implementaciones exitosas
│   └── archived/     # Características obsoletas
├── templates/        # Plantillas de características por tipo
└── dependencies.md   # Mapeo de dependencias entre características
```

## Ciclo de vida de características

### 1. Fase de planificación (`/planned/`)
- Las características comienzan aquí después del comando `@context-engineer.md`
- Contiene el PRP (Product Requirements Prompt) completo
- Incluye investigación, contexto y plan de implementación

### 2. Fase de desarrollo (`/in-progress/`)
- Las características se mueven aquí durante el comando `@execute-context.md`
- Contiene seguimiento de progreso y actualizaciones en tiempo real
- Incluye puntos de validación y puertas de calidad

### 3. Fase de finalización (`/completed/`)
- Las características se mueven aquí tras implementación exitosa
- Contiene documentación final y lecciones aprendidas
- Sirve como base de conocimiento para futuras características similares

## Uso de comandos

- `@context-engineer.md "[descripción de característica]"` - Crear nuevo plan
- `@execute-context.md "[nombre-característica]"` - Implementar característica planificada
- `@context-status.md "[nombre-característica]"` - Verificar estado de característica
EOF
    print_success "Creado README.md en workflow/"
fi

# Crear archivo de dependencias si no existe
if [[ ! -f "$PROJECT_DIR/workflow/dependencies.md" ]]; then
    cat > "$PROJECT_DIR/workflow/dependencies.md" << 'EOF'
# Dependencias de características

Este archivo rastrea las dependencias entre características.

*Este archivo es actualizado automáticamente por Context Engineering System.*

## Características

EOF
    print_success "Creado archivo de dependencias"
fi

print_success "¡Instalación completada!"
print_info "El sistema Context Engineering está ahora disponible en: $PROJECT_DIR"
echo ""
echo "Para usar el sistema:"
echo "1. Abre Claude Desktop"
echo "2. Navega al directorio de tu proyecto"
echo "3. Usa los comandos como:"
echo "   @context-engineer.md \"Implementar autenticación de usuarios\""
echo ""
echo "Documentación disponible en .claude/docs/" 