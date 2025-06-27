# Claude Code React Native System 🚀

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Powered by Claude](https://img.shields.io/badge/Powered%20by-Claude-blueviolet)](https://www.anthropic.com/claude)

Un sistema de desarrollo para crear aplicaciones React Native con Claude, diseñado para transformar a Claude en un asistente de gestión de proyectos que automatiza tareas, mantiene el contexto y asegura la calidad del código.

## 🤔 ¿Qué problema resuelve?

El desarrollo con LLMs como Claude a menudo sufre de pérdida de contexto entre sesiones. Los desarrolladores gastan tiempo valioso repitiendo objetivos, recordando el estado del proyecto y decidiendo qué hacer a continuación.

Este sistema soluciona eso al proporcionar una estructura y un conjunto de herramientas que permiten a Claude:
- **Recordar el estado exacto** de tu proyecto.
- **Gestionar un backlog de tareas** de forma automática.
- **Dividir tareas complejas** en subtareas manejables.
- **Aprender y aplicar patrones** de tu proyecto para mantener la consistencia.

En resumen, convierte a Claude en un compañero de equipo que nunca olvida el contexto y siempre sabe cuál es el siguiente paso.

## ✨ Características

- **Setup Automatizado**: Un script interactivo (`setup-project.sh`) que configura un nuevo proyecto en minutos.
- **Gestión de Tareas Inteligente**: Genera, analiza, y desglosa tareas a partir de un simple archivo de requisitos (`PRD.md`).
- **Memoria Persistente**: A través de comandos como `/emergency-context`, Claude recupera instantáneamente todo el conocimiento del proyecto.
- **Flujo de Desarrollo Guiado**: Un conjunto de comandos (`/start-task`, `/complete-task`, etc.) que estructuran el ciclo de desarrollo diario.
- **Filosofía de "Frontend Primero"**: Asegura que la UI/UX se construya de forma aislada con datos de prueba antes de la integración con el backend.

## 🏁 Instalación Rápida (2 minutos)

### ⚠️ IMPORTANTE: Este sistema debe instalarse DENTRO de tu proyecto existente

**NO clones este repo por separado**. El sistema Claude Code debe estar integrado en tu proyecto React Native.

### Opción 1: Proyecto Nuevo (Recomendado)

1. **Clona este repositorio donde quieres tu proyecto:**
   ```bash
   git clone https://github.com/ernestoespinosajr/claude-code-react-native-system.git mi-proyecto-app
   cd mi-proyecto-app
   ```

2. **Ejecuta el setup automático:**
   ```bash
   ./scripts/setup-project.sh
   ```

3. **El script hará todo automáticamente:**
   - ✅ Configurará la estructura del proyecto
   - ✅ Inicializará Expo/React Native (opcional)
   - ✅ Configurará Git con commit inicial
   - ✅ Te dará instrucciones finales

### Opción 2: Proyecto Existente

1. **Ve a tu proyecto React Native existente:**
   ```bash
   cd mi-proyecto-existente
   ```

2. **Clona el sistema dentro de tu proyecto:**
   ```bash
   git clone https://github.com/ernestoespinosajr/claude-code-react-native-system.git .claude-system
   cd .claude-system
   ./scripts/setup-project.sh
   ```

### 🎯 Próximos Pasos

1. **Completa tu documentación:**
   - Edita `project-docs/PRD.md` con los requisitos de tu app
   - Personaliza `project-docs/functional-requirements.md`

2. **Inicia el flujo de desarrollo:**
   ```bash
   /parse-prd        # Genera tu backlog
   /task-status      # Ve el estado actual  
   /start-task       # ¡Comienza a desarrollar!
   ```

## 📚 Documentación

- **[Guía de Inicio Rápido](./help-docs/quick-start.md)**: ¿Ya terminaste la instalación? Lee esta guía para entender el flujo de trabajo diario y los comandos principales.
- **[Referencia de Comandos](./help-docs/commands-reference.md)**: Una lista detallada de todos los comandos slash disponibles y su uso.
- **[Resolución de Problemas](./help-docs/troubleshooting.md)**: Soluciones para los problemas más comunes.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si tienes ideas para mejorar el sistema, por favor abre un *issue* o un *pull request*.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.