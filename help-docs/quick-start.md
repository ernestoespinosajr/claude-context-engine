# ⚡ Guía de Inicio Rápido: Tu Flujo de Trabajo con Claude

> Esta guía asume que ya has ejecutado el script `setup-project.sh` y estás en tu nuevo directorio de proyecto. Aquí aprenderás el flujo de trabajo diario para desarrollar con el sistema Claude.

## 🎯 Concepto Clave: Desarrollo en Dos Fases

El sistema impone un flujo de trabajo en dos fases para garantizar la calidad y la organización:

1.  **Fase 1: Frontend con Datos Ficticios (Dummy Data)**
    - **Objetivo**: Construir toda la interfaz de usuario y la experiencia de navegación sin depender de un backend.
    - **Regla**: La aplicación debe ser 100% funcional visualmente usando solo datos de prueba.

2.  **Fase 2: Conexión con Backend**
    - **Prerrequisito**: La Fase 1 debe estar completamente terminada.
    - **Objetivo**: Reemplazar los datos de prueba con llamadas reales a la API, componente por componente.

## 📊 Tu Flujo de Desarrollo Diario

Este es el ciclo que seguirás en cada sesión de desarrollo.

### 1. Empezar tu sesión (cada día)

Antes de escribir una sola línea de código, sincroniza a Claude con el estado actual del proyecto.

```
/emergency-context
```
Claude te responderá con un resumen completo: qué tareas están completas, en cuál estabas trabajando y qué sigue.

### 2. Iniciar una Tarea

Una vez que tengas el contexto, pide a Claude que te prepare para la siguiente tarea.

```
/start-task
```
Claude seleccionará la siguiente subtarea priorizada del backlog, te dará los detalles y creará un plan de acción.

### 3. Actualizar tu Progreso (frecuentemente)

Mientras codificas, mantén a Claude informado de tus avances. Esto es crucial para que la memoria del proyecto se mantenga actualizada.

```
/task-progress
```
Informa sobre qué archivos has creado o modificado, qué has logrado y en qué estás trabajando ahora.

### 4. Completar una Tarea

Cuando termines una subtarea (generalmente de 1 a 4 horas de trabajo), notifícalo.

```
/complete-task
```
Claude documentará tus logros, registrará cualquier aprendizaje en `claude_self_improve.md` y te sugerirá la siguiente tarea, listo para que vuelvas a empezar el ciclo con `/start-task`.

## 🔥 Comandos Esenciales del Día a Día

| Comando | Para qué sirve | Cuándo Usarlo |
| :--- | :--- | :--- |
| `/emergency-context` | Cargar el contexto completo del proyecto. | **Al inicio de cada sesión.** |
| `/start-task` | Empezar a trabajar en la siguiente tarea. | Cuando estés listo para codificar. |
| `/task-progress` | Actualizar a Claude sobre tu avance. | **Frecuentemente** mientras desarrollas. |
| `/complete-task` | Finalizar la tarea actual y documentar. | Cuando la subtarea esté 100% terminada. |
| `/add-discovered-task` | Añadir una tarea no prevista. | Cuando descubres una nueva necesidad. |

## 🚀 Tus Metas para la Primera Semana

- **Día 1**: Generar el backlog completo con `/parse-prd`, `/analyze-complexity` y `/expand-all` (esto se hace una sola vez al inicio).
- **Días 2-3**: Completar las tareas de configuración inicial y empezar la primera pantalla de la aplicación.
- **Días 4-5**: Tener 2-3 pantallas funcionales (con datos de prueba) y una base de componentes reutilizables.

## 📚 ¿Y ahora qué?

Ya conoces el flujo principal. Si quieres profundizar más:

- Consulta la **[Referencia de Comandos](./commands-reference.md)** para ver todos los comandos en detalle.
- Si algo falla, la guía de **[Resolución de Problemas](./troubleshooting.md)** es tu mejor aliada.

**¡Feliz desarrollo con tu nuevo flujo de trabajo potenciado por IA!**