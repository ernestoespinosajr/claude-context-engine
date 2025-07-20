# Context Engineering System

![Version](https://img.shields.io/badge/version-2.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

> Sistema avanzado para ingeniería de contexto basado en arquitectura de 11 capas, optimización de tokens y flujo de trabajo para desarrollo dirigido por características.

<p align="center">
  <img src="https://via.placeholder.com/800x400?text=Context+Engineering+System" alt="Context Engineering System" width="600">
</p>

## 🚀 Características principales

- **Arquitectura de 11 capas de contexto** para gestión óptima de información
- **Sistema avanzado de personas** con especialistas en seguridad, rendimiento, etc.
- **Integración MCP** con módulos Context7, Sequential, Magic y Puppeteer
- **Optimización de tokens** con modo UltraCompressed (70% de reducción)
- **Gestión automatizada de flujo de trabajo** desde planificación hasta completitud
- **Validación de calidad** con puertas de calidad multinivel

## 📋 Requisitos previos

- Claude Desktop o Claude Code CLI
- Git
- Bash 3.0+

## 💻 Instalación

```bash
# Clonar el repositorio
git clone https://github.com/usuario/context-engineering-system.git

# Navegar al directorio
cd context-engineering-system

# Instalar en tu proyecto
./install.sh /ruta/a/tu-proyecto
```

El instalador:
1. Crea la estructura de directorios necesaria en tu proyecto
2. Configura los comandos para Claude Code CLI
3. Instala las plantillas de características
4. Configura el sistema de flujo de trabajo

## 🔧 Uso

El Context Engineering System está diseñado para funcionar dentro del ecosistema de Claude Code CLI mediante comandos:

### Comandos principales

```
@context-engineer.md "[descripción de la característica]"
```
Analiza y crea un plan de implementación completo utilizando los principios de ingeniería de contexto. Guarda el plan en `workflow/planned/`.

```
@execute-context.md "[nombre-característica]"
```
Implementa una característica planificada con validación continua y desarrollo aislado. Mueve el archivo de `workflow/planned/` a `workflow/in-progress/active/`.

```
@context-status.md "[nombre-característica]"
```
Monitorea la salud de características, dependencias y calidad del contexto.

### Uso con flags

Los comandos admiten flags para funcionalidades adicionales:

```
@context-engineer.md "Implementar autenticación de usuarios" --persona-security --mcp-context7
```

Esto activará la persona de seguridad y utilizará el módulo MCP Context7 para mejor gestión de contexto.

### Personas disponibles

- `--persona-security`: Especialista en seguridad y autenticación
- `--persona-performance`: Especialista en optimización y rendimiento
- `--persona-frontend`: Especialista en interfaces de usuario y UX
- `--persona-backend`: Especialista en APIs y servicios
- `--persona-architect`: Especialista en arquitectura de sistemas
- `--persona-data`: Especialista en bases de datos y modelado
- `--persona-mobile`: Especialista en desarrollo móvil
- `--persona-deployment`: Especialista en DevOps y despliegue
- `--persona-testing`: Especialista en pruebas y QA

### Módulos MCP

- `--mcp-context7`: Mejora la gestión de contexto con Context7
- `--mcp-sequential`: Habilita pensamiento secuencial para problemas complejos
- `--mcp-magic`: Activa capacidades avanzadas de generación de código
- `--mcp-puppeteer`: Permite automatización y interacción web

## 📁 Flujo de trabajo de archivos

1. **Planificación**: `@context-engineer.md` crea un archivo en `workflow/planned/[nombre-característica].md`
2. **Implementación**: `@execute-context.md` MUEVE (no duplica) el archivo a `workflow/in-progress/active/[nombre-característica].md`
3. **Finalización**: Al completar, el sistema MUEVE el archivo a `workflow/completed/successful/[nombre-característica].md`

La característica clave de este sistema es que los archivos se MUEVEN entre directorios, nunca se duplican. Esto mantiene una estructura limpia y evita inconsistencias.

## 📂 Estructura del proyecto

```
proyecto/
├── .claude/                 # Configuración para Claude Code CLI
│   ├── commands/            # Comandos disponibles
│   └── shared/              # Archivos compartidos de configuración
├── workflow/                # Directorio de flujo de trabajo
│   ├── planned/             # Características planificadas
│   ├── in-progress/         # Características en desarrollo
│   │   ├── active/          # En desarrollo activo
│   │   └── paused/          # Pausadas temporalmente
│   ├── completed/           # Características implementadas
│   │   ├── successful/      # Implementaciones exitosas
│   │   └── archived/        # Características obsoletas
│   ├── templates/           # Plantillas de características
│   └── dependencies.md      # Registro de dependencias
└── ...                      # Archivos del proyecto
```

## 🤝 Contribuir

Para contribuir al desarrollo de este sistema:

1. Haz un fork del repositorio
2. Crea una rama para tu característica (`git checkout -b feature/amazing-feature`)
3. Haz commit de tus cambios (`git commit -m 'Add some amazing feature'`)
4. Haz push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## 📚 Documentación adicional

- [Guía de arquitectura de 11 capas](docs/context-engine-glossary.md)
- [Referencia de comandos](docs/commands-reference.md)
- [Matriz de flags](docs/flags-matrix.md)
- [Guía de métricas de tokens](docs/token-metrics.md)
