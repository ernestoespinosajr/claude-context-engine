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

## 🏁 Setup Inicial (Solo Primera Vez)

Después de completar tu `project-docs/PRD.md`, sigue este orden exacto:

### 1. Generar Backlog Inicial
```bash
/parse-prd
```
**Qué hace**: Analiza tu PRD y genera todas las tareas del proyecto automáticamente.

### 2. Analizar Complejidad
```bash
/analyze-complexity
```
**Qué hace**: Evalúa qué tareas son muy complejas y necesitan subdivisión.

### 3. Expandir Tareas Complejas (si es necesario)
```bash
/expand-task [task-id]
```
**Qué hace**: Convierte tareas complejas en subtareas manejables. Repite para cada tarea compleja identificada.

### 4. Ver Estado del Proyecto
```bash
/task-status
```
**Qué hace**: Te muestra el resumen completo y cuál es tu próxima tarea a trabajar.

## 📊 Tu Flujo de Desarrollo Diario

### 1. Empezar tu sesión (cada día)

Antes de escribir código, obtén el estado actual del proyecto:

```bash
/task-status
```
Claude te responderá con: estado del proyecto, qué tareas están completas, en cuál deberías trabajar y plan de acción.

### 2. Ciclo Principal de Desarrollo

Una vez que tengas el contexto, usa el comando principal:

```bash
/start-task
```

**Este comando integra todo el flujo**:
1. 🎯 Selecciona la próxima tarea prioritaria
2. 📋 Te da detalles y plan de implementación  
3. ⏸️ Hace pausas para que valides el progreso
4. ✅ Te pregunta si deseas completar la tarea
5. 📝 Actualiza automáticamente el progreso
6. 🔄 Te sugiere la siguiente tarea

**No necesitas comandos separados** - todo está integrado en `/start-task`.

## 🔥 Comandos Esenciales del Día a Día

| Comando | Para qué sirve | Cuándo Usarlo |
| :--- | :--- | :--- |
| `/task-status` | Obtener estado actual y próxima tarea. | **Al inicio de cada sesión.** |
| `/start-task` | Ciclo completo de desarrollo integrado. | **Comando principal para desarrollar.** |
| `/add-discovered-task` | Añadir una tarea no prevista. | Cuando descubres una nueva necesidad. |
| `/emergency-context` | Cargar contexto completo (emergencias). | Cuando hay pérdida de contexto. |
| `/project-audit` | Auditoría tecnológica del proyecto. | **Semanalmente** para evaluación. |

## 🚀 Tus Metas para la Primera Semana

- **Día 1**: Generar el backlog completo con `/parse-prd`, `/analyze-complexity` y `/expand-all` (esto se hace una sola vez al inicio).
- **Días 2-3**: Completar las tareas de configuración inicial y empezar la primera pantalla de la aplicación.
- **Días 4-5**: Tener 2-3 pantallas funcionales (con datos de prueba) y una base de componentes reutilizables.

## 📚 ¿Y ahora qué?

Ya conoces el flujo principal. Si quieres profundizar más:

- Consulta la **[Referencia de Comandos](./commands-reference.md)** para ver todos los comandos en detalle.
- Si algo falla, la guía de **[Resolución de Problemas](./troubleshooting.md)** es tu mejor aliada.

**¡Feliz desarrollo con tu nuevo flujo de trabajo potenciado por IA!**