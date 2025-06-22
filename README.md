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

## 🏁 Cómo Empezar (En 2 minutos)

La única forma de empezar es usando el script de configuración. No copies los archivos manualmente.

1.  **Clona este repositorio:**
    ```bash
    git clone https://github.com/ernestoespinosajr/claude-code-react-native-system.git
    ```

2.  **Ejecuta el script de configuración:**
    Navega dentro del repositorio clonado y ejecuta:
    ```bash
    cd claude-code-react-native-system
    ./scripts/setup-project.sh
    ```

3.  **Sigue las instrucciones interactivas:**
    El script te pedirá el nombre de tu proyecto, lo creará, copiará los archivos del sistema, y opcionalmente inicializará un proyecto de Expo y un repositorio de Git por ti.

4.  **¡Listo para desarrollar!**
    Una vez que el script termine, te dará las instrucciones finales para que navegues a la carpeta de tu nuevo proyecto y comiences a trabajar con Claude.

## 📚 Documentación

- **[Guía de Inicio Rápido](./help-docs/quick-start.md)**: ¿Ya terminaste la instalación? Lee esta guía para entender el flujo de trabajo diario y los comandos principales.
- **[Referencia de Comandos](./help-docs/commands-reference.md)**: Una lista detallada de todos los comandos slash disponibles y su uso.
- **[Resolución de Problemas](./help-docs/troubleshooting.md)**: Soluciones para los problemas más comunes.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si tienes ideas para mejorar el sistema, por favor abre un *issue* o un *pull request*.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.