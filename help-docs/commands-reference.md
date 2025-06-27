# 📋 Referencia de Comandos - Claude Code System

## 🚀 Comandos Esenciales (Orden de Uso)

### 1. `/parse-prd` - Análisis Inicial del Proyecto
**Uso**: Primera vez únicamente, después de completar tu PRD.md
**Propósito**: Genera el backlog completo de tareas desde el PRD
**Resultado**: Crea estructura inicial en claude_tasks.md con todas las tareas identificadas

```
/parse-prd
```

### 2. `/analyze-complexity` - Análisis de Complejidad
**Uso**: Después de parse-prd, una sola vez
**Propósito**: Evalúa la complejidad de cada tarea y recomienda subdivisiones
**Resultado**: Identifica tareas que necesitan ser expandidas

```
/analyze-complexity
```

### 3. `/expand-task` - Expandir Tareas Complejas
**Uso**: Para tareas específicas que necesitan subdivisión
**Propósito**: Convierte una tarea compleja en subtareas manejables
**Resultado**: Subtareas detalladas listas para implementación

```
/expand-task [task-id]
```

### 4. `/task-status` - Estado Actual del Proyecto
**Uso**: Al comenzar cualquier sesión de trabajo
**Propósito**: Obtiene resumen completo del estado actual y próxima tarea
**Resultado**: Contexto completo + plan para la siguiente tarea

```
/task-status
```

### 5. `/start-task` - Ciclo Principal de Desarrollo
**Uso**: Comando principal para todo el desarrollo diario
**Propósito**: Flujo completo de desarrollo con validaciones automáticas
**Flujo Integrado**:
1. Selecciona/inicia próxima tarea
2. Implementa con pausas para validación
3. Solicita confirmación de usuario en checkpoints
4. Completa tarea automáticamente
5. Actualiza progreso y sugiere siguiente tarea

```
/start-task
```

### 6. `/add-discovered-task` - Añadir Tareas No Previstas
**Uso**: Cuando descubres nuevas necesidades durante el desarrollo
**Propósito**: Incorpora tareas emergentes al backlog
**Resultado**: Nueva tarea integrada con prioridad y dependencias

```
/add-discovered-task [descripción]
```

### 7. `/emergency-context` - Recuperación de Contexto Completo
**Uso**: Cuando necesitas cargar todo el contexto del proyecto
**Propósito**: Lee todos los archivos importantes y restaura memoria completa
**Resultado**: Claude completamente sincronizado con el estado del proyecto

```
/emergency-context
```

### 8. `/project-audit` - Auditoría Tecnológica
**Uso**: Periódicamente para evaluación del proyecto
**Propósito**: Análisis completo de fortalezas, debilidades y mejoras
**Resultado**: Reporte detallado con recomendaciones técnicas

```
/project-audit
```

## 🔄 Flujo de Trabajo Recomendado

### Primera Vez (Setup Inicial)
```
1. /parse-prd          → Genera backlog inicial
2. /analyze-complexity → Evalúa complejidad de tareas  
3. /expand-task [id]   → Expande tareas complejas (repetir según necesidad)
4. /task-status        → Ve el resumen y próxima tarea
5. /start-task         → Comienza desarrollo
```

### Sesiones Diarias
```
1. /task-status        → Estado actual y próxima tarea
2. /start-task         → Desarrollo (repetir hasta completar sprint)
3. /project-audit      → Evaluación periódica (semanal/quincenal)
```

### Manejo de Emergencias
```
1. /emergency-context  → Recupera contexto completo
2. /add-discovered-task → Añade tareas no previstas
```

## 📝 Notas Importantes

- **start-task es el comando principal**: Integra todo el flujo de desarrollo
- **task-status siempre al inicio**: Para mantener contexto entre sesiones
- **emergency-context para recuperación**: Cuando algo sale mal o hay pérdida de contexto
- **project-audit periódicamente**: Para mantener calidad técnica del proyecto

## 🚨 Comandos Deprecados (No Usar)

Los siguientes comandos han sido integrados en `/start-task`:
- ~~`/task-progress`~~ → Integrado en start-task
- ~~`/complete-task`~~ → Integrado en start-task  
- ~~`/next-task`~~ → Reemplazado por task-status
