# 🚀 Sistema de Desarrollo React Native con Claude Code

> **Guía completa para desarrollo de aplicaciones React Native usando Claude Code con gestión automática de tareas, análisis de complejidad y enforcement de mejores prácticas.**

## 📋 Tabla de Contenidos

- [🎯 Introducción](#-introducción)
- [📁 Estructura de Archivos](#-estructura-de-archivos)
- [⚙️ Configuración Inicial](#️-configuración-inicial)
- [🔧 Comandos Disponibles](#-comandos-disponibles)
- [📊 Flujo de Trabajo Completo](#-flujo-de-trabajo-completo)
- [💡 Ejemplos Prácticos](#-ejemplos-prácticos)
- [🎯 Filosofía de Desarrollo](#-filosofía-de-desarrollo)
- [📚 Documentation](#-documentation)
- [🆘 Need Help?](#-need-help)
- [🔍 Troubleshooting](#-troubleshooting)

---

## 🎯 Introducción

Este sistema transforma Claude Code en un asistente especializado para React Native que:

✅ **Gestiona automáticamente** el progreso de tareas
✅ **Analiza complejidad** con investigación web
✅ **Divide tareas complejas** en subtareas manejables (1-4h)
✅ **Documenta automáticamente** patrones y lecciones aprendidas
✅ **Mantiene compliance** con mejores prácticas de React Native
✅ **Respeta fases** de desarrollo (Frontend → Backend)

## 📁 Estructura de Archivos

### 📂 Estructura Requerida del Proyecto

```
mi-proyecto-react-native/
├── CLAUDE.md                        # 🔧 Configuración principal de Claude Code
├── PRD.md                          # 📋 Product Requirements Document
├── functional-requirements.md       # 📝 Requisitos funcionales detallados
├── ui-ux-specifications.md         # 🎨 Especificaciones de UI/UX
├── claude_tasks.md                 # 📊 Gestión automática de tareas
├── claude_self_improve.md          # 🧠 Auto-documentación de aprendizajes
├── package.json                    # 📦 Dependencias del proyecto
├── src/                           # 💻 Código fuente
│   ├── components/                # 🧩 Componentes reutilizables
│   ├── screens/                   # 📱 Pantallas de la app
│   ├── utils/                     # 🔧 Utilidades
│   └── types/                     # 📝 Tipos de TypeScript
├── assets/
│   └── images/                    # 🖼️ Imágenes del proyecto
└── .claude/
    └── commands/                  # ⚡ Comandos slash personalizados
        ├── parse-prd.md          # 📋 Generar tareas desde PRD
        ├── analyze-complexity.md # 🔍 Análisis de complejidad
        ├── expand-task.md        # ⚡ Dividir en subtareas
        ├── expand-all.md         # 📈 Expandir todas las tareas
        ├── start-task.md         # 🎯 Iniciar nueva tarea
        ├── task-progress.md      # 📊 Actualizar progreso
        ├── complete-task.md      # ✅ Completar tarea
        ├── add-discovered-task.md # 🆕 Agregar tarea descubierta
        ├── sync-tasks.md         # 🔄 Sincronizar tareas
        └── emergency-context.md  # 🚨 Recuperar contexto
```

## ⚙️ Configuración Inicial

### 📋 Paso 1: Crear Archivos de Documentación

```bash
# Crear archivos de documentación en la raíz
touch CLAUDE.md
touch PRD.md
touch functional-requirements.md
touch ui-ux-specifications.md
touch claude_tasks.md
touch claude_self_improve.md
```

### 📂 Paso 2: Crear Estructura de Comandos

```bash
# Crear directorio de comandos Claude
mkdir -p .claude/commands

# Crear archivos de comandos
touch .claude/commands/parse-prd.md
touch .claude/commands/analyze-complexity.md
touch .claude/commands/expand-task.md
touch .claude/commands/expand-all.md
touch .claude/commands/start-task.md
touch .claude/commands/task-progress.md
touch .claude/commands/complete-task.md
touch .claude/commands/add-discovered-task.md
touch .claude/commands/sync-tasks.md
touch .claude/commands/emergency-context.md
```

### 📝 Paso 3: Configurar CLAUDE.md

Copia el contenido del **CLAUDE.md mejorado** (con enforcement XML) en la raíz del proyecto.

### 📋 Paso 4: Crear PRD.md

Documenta tu proyecto en `PRD.md`:

### ⚠️ Paso 5: Reiniciar Claude Code

**IMPORTANTE**: Después de crear todos los archivos de comandos, **reinicia Claude Code completamente** para que detecte los nuevos comandos slash.

```bash
# 1. Cerrar Claude Code
# 2. Reabrir Claude Code  
# 3. Los comandos /parse-prd, /start-task, etc. ya funcionarán
```

## 🔧 Comandos Disponibles

### 📋 **Gestión de Proyecto**

| Comando | Descripción | Cuándo Usar |
|---------|-------------|-------------|
| `/parse-prd` | 📋 Genera backlog inicial desde PRD.md | **Solo 1 vez** - Inicio del proyecto |
| `/analyze-complexity` | 🔍 Investiga complejidad con web research | Después de parse-prd o tareas nuevas |
| `/expand-task [nombre]` | ⚡ Divide tarea específica en subtareas | Para tareas complejas (score ≥6) |
| `/expand-all` | 📈 Expande todas las tareas complejas | Después de análisis de complejidad |

### 📊 **Desarrollo Diario**

| Comando | Descripción | Cuándo Usar |
|---------|-------------|-------------|
| `/emergency-context` | 🚨 Recupera contexto completo rápidamente | Al empezar cada sesión |
| `/start-task` | 🎯 Inicia trabajo en nueva subtarea | Al empezar nueva tarea |
| `/task-progress` | 📊 Actualiza progreso actual | Durante desarrollo (cada avance) |
| `/add-discovered-task` | 🆕 Agrega tarea descubierta | Cuando encuentras nueva necesidad |
| `/complete-task` | ✅ Documenta logros y recomienda siguiente | Al terminar subtarea |

### 🔧 **Mantenimiento**

| Comando | Descripción | Cuándo Usar |
|---------|-------------|-------------|
| `/sync-tasks` | 🔄 Reorganiza y limpia lista de tareas | Semanalmente o según necesidad |

## 📊 Flujo de Trabajo Completo

### 🚀 **Inicio de Proyecto (Solo primera vez)**

```bash
# 1. Configuración inicial
/parse-prd              # Genera backlog desde PRD → 15 tareas principales

# 2. Análisis y refinamiento
/analyze-complexity     # Investiga cada tarea → Identifica 6 complejas
/expand-all            # Divide tareas complejas → 45 subtareas (1-4h cada una)

# 3. Verificación y arranque
/emergency-context     # Carga contexto del proyecto
/start-task           # Selecciona primera subtarea específica
```

### 📅 **Desarrollo Diario**

```bash
# Al empezar sesión
/emergency-context     # Recupera contexto donde quedaste

# Durante desarrollo
/task-progress        # Cada avance significativo
/add-discovered-task  # Si descubres nueva necesidad

# Al completar trabajo
/complete-task        # Documenta logros + recomienda siguiente
/start-task          # Empieza nueva subtarea recomendada
```

### 🔧 **Mantenimiento Periódico**

```bash
# Cada semana o cuando sea necesario
/sync-tasks           # Reorganiza backlog y actualiza prioridades
```

## 💡 Ejemplos Prácticos

### 🎯 **Ejemplo: Primer día de proyecto**

```bash
Usuario: "Empiezo proyecto de e-commerce React Native"

# 1. Configurar PRD.md con requisitos del e-commerce
# 2. Ejecutar comandos:

/parse-prd
# → Claude genera:
# ✅ 12 tareas principales identificadas
# ✅ Categorizado por: Setup, Auth, Products, Cart, Orders, UI
# ✅ Separado en Phase 1 (Frontend) y Phase 2 (Backend)

/analyze-complexity
# → Claude investiga cada tarea:
# 🔍 "Setup Expo + TypeScript" → Complexity: 4/10 (Medium)
# 🔍 "Product Catalog with Search" → Complexity: 8/10 (High - needs expansion)
# 🔍 "Payment Integration" → Complexity: 9/10 (Very High - needs expansion)

/expand-all
# → Claude divide tareas complejas:
# ⚡ "Product Catalog" → 6 subtareas específicas
# ⚡ "Payment Integration" → 8 subtareas específicas
# ✅ Total: 28 subtareas manejables

/start-task
# → Claude selecciona: "Setup Expo Project Base - Install dependencies (2h)"
```

### 📊 **Ejemplo: Desarrollo diario**

```bash
# Mañana - Empezar sesión
/emergency-context
# → Claude muestra:
# 📋 Proyecto: E-commerce React Native
# 🎯 Fase actual: Phase 1 (Frontend only)
# 📊 Progreso: 6/28 subtareas completadas
# 🔄 Tarea activa: "Create ProductCard Component (1.5h)"
# ✅ Último logro: Login screen implementado
# 📝 Siguiente prioridad: Finalizar ProductCard → ProductList → Search

# Durante desarrollo
/task-progress
# → Claude actualiza automáticamente:
# ✅ ProductCard design completed
# 🔄 Working on product image loading
# 📁 Files: src/components/ProductCard.tsx
# ⏰ Time: 1h invested of 1.5h estimated

# Al completar
/complete-task
# → Claude documenta:
# ✅ ProductCard component completed
# 📊 Performance: Image lazy loading implemented
# 🧠 Lesson: expo-image better than Image for caching
# 📝 Next recommended: "Create ProductList with scroll optimization (2h)"
```

### 🆕 **Ejemplo: Descubrir nueva tarea**

```bash
# Durante desarrollo del ProductCard, descubres:
"Necesito un componente de Rating con estrellas"

/add-discovered-task
# → Claude analiza y agrega:
# 🆕 Create StarRating Component - MEDIUM - Phase 1
# 📂 Category: UI_COMPONENTS
# 🔗 Discovered during: ProductCard implementation
# ⏰ Estimated effort: Small (1h)
# 📋 Dependencies: ProductCard completion
# 🎯 Auto-categorized and prioritized in backlog
```

## 🎯 Filosofía de Desarrollo

### 🔄 **Desarrollo en Dos Fases (OBLIGATORIO)**

#### **Phase 1: Frontend con Dummy Data**
- ✅ **PRIORIDAD ABSOLUTA**: Completar 100% del frontend antes de backend
- ✅ **DATOS**: Solo dummy/mock data durante toda esta fase
- ✅ **OBJETIVO**: UI/UX completamente funcional con navegación
- ✅ **CRITERIO**: App funciona perfectamente sin conexión a internet

#### **Phase 2: Backend y Conexión**
- ✅ **PREREQUISITO**: Phase 1 debe estar 100% terminada
- ✅ **OBJETIVO**: Reemplazar dummy data con APIs reales
- ✅ **PROCESO**: Conectar componente por componente

### 📋 **Gestión Automática de Tareas**

#### **Generación Inteligente**
1. **Parse PRD** → Identifica todas las funcionalidades
2. **Analyze Complexity** → Investiga con web research
3. **Expand Tasks** → Divide en subtareas de 1-4 horas
4. **Smart Categorization** → Organiza automáticamente

#### **Seguimiento Continuo**
- **Progress Updates** → Documenta automáticamente avances
- **Discovery Integration** → Agrega nuevas tareas sobre la marcha
- **Context Persistence** → Mantiene memoria entre sesiones
- **Learning Documentation** → Actualiza patrones y mejores prácticas

### 🔧 **Enforcement de Calidad**

#### **Reglas Automáticas**
- ✅ Verificación de environment antes de empezar
- ✅ Analysis de PRD obligatorio
- ✅ Compliance de fases automático
- ✅ Consulta antes de cambios importantes

#### **Estándares de Código**
- ✅ TypeScript obligatorio
- ✅ Design system consistente
- ✅ Patrones de estado establecidos
- ✅ Testing integrado

## 📚 Documentation

- **[⚡ Quick Start](QUICK_START.md)** - Get started in 5 minutes
- **[🔧 Setup Guide](docs/setup-guide.md)** - Comprehensive configuration
- **[📋 Commands Reference](docs/commands-reference.md)** - Complete command documentation
- **[🚨 Troubleshooting](docs/troubleshooting.md)** - Problem solving guide

## 🆘 Need Help?

1. **Quick Issue?** → Check [Troubleshooting Guide](docs/troubleshooting.md)
2. **Command Questions?** → See [Commands Reference](docs/commands-reference.md)
3. **Setup Problems?** → Follow [Setup Guide](docs/setup-guide.md)
4. **New to System?** → Start with [Quick Start](QUICK_START.md)

## 🔍 Troubleshooting

### ❓ **Problemas Comunes**

#### **Claude no lee CLAUDE.md**
```bash
# Verificar ubicación
ls -la CLAUDE.md  # Debe estar en raíz del proyecto

# Si está en subcarpeta, mover:
mv .claude/CLAUDE.md ./CLAUDE.md
```

#### **Comandos slash no funcionan**
```bash
# Verificar estructura:
ls -la .claude/commands/

# Debe mostrar:
# parse-prd.md
# analyze-complexity.md
# start-task.md
# (etc...)

# ⚠️ SOLUCIÓN MÁS COMÚN: Reiniciar Claude Code
# Claude Code necesita reiniciarse después de crear nuevos archivos de comandos
# 1. Cerrar Claude Code completamente
# 2. Reabrir Claude Code
# 3. Intentar comando slash nuevamente
```

#### **No encuentra PRD.md**
```bash
# Crear PRD básico:
echo "# PRD - Mi Proyecto\n## Descripción\n[Agregar descripción]" > PRD.md
```

#### **Environment incompleto**
```bash
# Verificar estructura mínima:
ls -la package.json     # ✅ Debe existir
ls -la src/            # ✅ Debe existir
ls -la assets/images/  # ✅ Debe existir

# Si faltan, crear:
mkdir -p src/components src/screens src/utils
mkdir -p assets/images
```

### 🚨 **Debugging de Comandos**

#### **Comando no responde correctamente**
1. Verificar que el archivo `.claude/commands/[comando].md` existe
2. Revisar sintaxis del archivo de comando
3. Intentar `/emergency-context` para recargar

#### **Context perdido**
```bash
# Recuperar contexto completo:
/emergency-context

# Si sigue perdido, ejecutar secuencia:
/parse-prd
/analyze-complexity
/emergency-context
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### What this means:
✅ **Use freely** in personal and commercial projects  
✅ **Modify** templates and scripts for your needs  
✅ **Share** improvements with the community  
✅ **No warranty** - use at your own risk  

### Attribution:
While not required, attribution is appreciated:

---

## 🎉 ¡Listo para Desarrollar!

Con este sistema tendrás:

✅ **Gestión automática** de tareas y progreso
✅ **Investigación automatizada** de complejidad
✅ **División inteligente** en subtareas manejables
✅ **Documentación continua** de patrones y decisiones
✅ **Compliance automático** con mejores prácticas
✅ **Desarrollo predecible** y escalable

### 🚀 **Primer Comando para Empezar:**

```bash
/parse-prd
```

**¡Que disfrutes desarrollando con Claude Code!** 🎯