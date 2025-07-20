# Context Engineering System v2.0 - Implementation Notes

Este documento describe la implementación actual del Context Engineering System y cómo utilizarlo correctamente.

## Estructura General

El sistema está estructurado en los siguientes componentes:

```
project/
├── .claude-context-engine/  # Directorio oculto con implementación
│   ├── bin/                # Scripts de comandos
│   │   ├── lib/           # Bibliotecas de soporte
│   │   └── ...           # Scripts principales
│   └── docs/             # Documentación
├── workflow/              # Directorio de trabajo visible
│   ├── planned/           # Características planificadas
│   ├── in-progress/       # Características en progreso
│   │   ├── active/        # Activas actualmente
│   │   └── paused/        # En pausa temporalmente
│   ├── completed/         # Características completadas
│   │   └── successful/    # Implementadas exitosamente
│   └── dependencies.md    # Registro de dependencias
├── context-engineer       # Comando para planificar características
├── execute-context        # Comando para implementar características
└── context-status         # Comando para verificar estado
```

## Comandos Principales

### `context-engineer`

Crea un plan de implementación para una nueva característica.

```bash
./context-engineer "Descripción de la característica" [flags]
```

Flags soportados:
- `--uc`: Modo UltraCompressed (70% reducción)
- `--plan`: Muestra plan de ejecución
- `--think`: Muestra proceso de razonamiento
- `--persona-X`: Activa persona especialista (ej. `--persona-security`)
- `--mcp-X`: Activa integración MCP (ej. `--mcp-context7`)
- `--mc7`: Alias para --mcp-context7
- `--mseq`: Alias para --mcp-sequential
- `--mmag`: Alias para --mcp-magic
- `--mpup`: Alias para --mcp-puppeteer

### `execute-context`

Implementa una característica previamente planificada.

```bash
./execute-context nombre-característica [flags]
```

Flags soportados:
- `--validate`: Modo validación estricta
- `--test`: Incluye generación de pruebas
- `--incremental`: Implementación paso a paso
- `--parallel`: Procesamiento paralelo
- `--uc`: Modo UltraCompressed
- `--mc7`, `--mseq`, `--mmag`, `--mpup`: Alias para integraciones MCP

### `context-status`

Monitorea el estado de las características o del proyecto.

```bash
./context-status [nombre-característica] [flags]
```

Flags soportados:
- `--deep`: Análisis exhaustivo
- `--metrics`: Métricas de rendimiento
- `--recommendations`: Sugerencias de optimización
- `--health`: Verificación de salud del sistema
- `--workflow-overview`: Muestra todos los workflows

## Sistemas Integrados

### Sistema de Personas

Las personas son especialistas que se activan para tareas específicas:

- `architect`: 🏗️ Diseño de sistemas y arquitectura
- `security`: 🔒 Análisis de seguridad y autenticación
- `performance`: ⚡ Optimización de rendimiento
- `testing`: 🧪 Estrategia de pruebas y calidad
- `devops`: 🚀 Despliegue e infraestructura
- `frontend`: 🎨 UI/UX e interfaces de usuario
- `backend`: ⚙️ Lógica de servidor y APIs
- `mobile`: 📱 Desarrollo móvil
- `ai`: 🤖 Integración de IA/ML
- `data`: 📊 Análisis de datos

Las personas pueden activarse manualmente con flags `--persona-X` o detectarse automáticamente basado en el contexto de la característica.

### Integración MCP

MCP (Model Context Protocol) proporciona capacidades avanzadas a través de la integración con Claude. El sistema indica a Claude cuándo debe activar estos módulos MCP, pero es Claude quien realmente los gestiona.

Módulos MCP disponibles:

- `context7` (--mcp-context7, --mc7): Optimización de contexto y reducción de tokens
- `sequential` (--mcp-sequential, --mseq): Pensamiento paso a paso para problemas complejos
- `magic` (--mcp-magic, --mmag): Automatización de workflow y reconocimiento de patrones
- `puppeteer` (--mcp-puppeteer, --mpup): Pruebas de UI y validación

> **Nota importante:** La integración actual con MCP es una interfaz que indica a Claude cuándo y cómo usar estos módulos. El procesamiento real ocurre en Claude, no en el sistema local.

## Flujo de Trabajo Automático

El sistema gestiona automáticamente el flujo de trabajo de las características:

1. `context-engineer` crea la característica en `workflow/planned/`
2. `execute-context` mueve la característica a `workflow/in-progress/active/`
3. Al completar, se mueve a `workflow/completed/successful/`

Los archivos de características contienen toda la información necesaria y se actualizan automáticamente con timestamps y estados.

## Instalación

### Instalación de Proyecto

La instalación de proyecto es el método recomendado:

```bash
./install.sh [--project /ruta/proyecto]
```

Esto instala el sistema en el directorio del proyecto y crea los comandos necesarios.

## Limitaciones Actuales

- No hay gestión de permisos de usuario
- El procesamiento es síncrono (sin operaciones en paralelo real)
- Los nombres de archivo sanitizados pueden variar en el manejo de caracteres especiales y acentos

## Ejemplos de Uso

### Crear una nueva característica con MCP

```bash
./context-engineer "Implementar servicio de caché distribuida" --mc7
```

### Implementar una característica con pruebas

```bash
./execute-context sistema-de-autenticacin --validate --test
```

### Verificar el estado del proyecto

```bash
./context-status --health --workflow-overview
```

### Crear una característica con persona específica

```bash
./context-engineer "Optimizar consultas de base de datos" --persona-performance
``` 