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
**Uso**: Comando principal para completar UNA tarea específica
**Propósito**: Desarrollo completo de una tarea con documentación automática
**Flujo de Tarea Única**:
1. **Análisis**: Identifica próxima tarea/subtarea disponible
2. **Investigación**: Documenta hallazgos y plan de implementación 
3. **Desarrollo**: Implementa la solución completa de la tarea
4. **Documentación**: Actualiza progreso automáticamente en claude_tasks.md
5. **Finalización**: Completa tarea, documenta logros y **PARA**

**COMPORTAMIENTO CRÍTICO**: 
- ✅ **Completa SOLO UNA tarea por comando**
- ✅ **Documenta progreso automáticamente**
- ✅ **Mantiene contexto continuo durante la tarea**
- ✅ **NO continúa con otras tareas automáticamente**
- ✅ **PARA al terminar para dar control al usuario**

```
/start-task
```

**Al Finalizar Cada Tarea**:
- ✅ Documenta detalles de implementación completos
- ✅ Actualiza claude_tasks.md con status completado
- ✅ Presenta resumen de lo logrado
- ✅ Sugiere siguiente tarea lógica (sin iniciarla)
- ✅ **TERMINA** - deja que el usuario decida qué hacer

**El usuario entonces puede**:
- Ejecutar `/start-task` otra vez para la siguiente tarea
- Usar `/add-discovered-task` si encontró algo nuevo
- Usar `/task-status` para ver el estado general
- Tomar una pausa o cambiar de enfoque

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
2. /start-task         → Completa UNA tarea y para
3. (Usuario decide)    → Continuar, pausar, o cambiar enfoque
4. /start-task         → Siguiente tarea (repetir según usuario decida)
5. /project-audit      → Evaluación periódica (semanal/quincenal)
```

### Manejo de Emergencias
```
1. /emergency-context  → Recupera contexto completo
2. /add-discovered-task → Añade tareas no previstas
```

## 📝 Notas Importantes

- **start-task completa UNA tarea**: Ejecuta una tarea completa y para para dar control al usuario
- **Usuario controla el ritmo**: Decide cuándo continuar, pausar o cambiar enfoque después de cada tarea
- **task-status siempre al inicio**: Para mantener contexto entre sesiones
- **emergency-context para recuperación**: Cuando algo sale mal o hay pérdida de contexto
- **project-audit periódicamente**: Para mantener calidad técnica del proyecto

## ⚠️ Comportamiento Crítico de /start-task

🎯 **UNA tarea por comando**: Nunca continúa automáticamente a la siguiente
📋 **Documenta todo**: Actualiza claude_tasks.md durante el desarrollo  
🛑 **Para al terminar**: Devuelve control al usuario para decidir siguiente acción
💡 **Sugiere sin ejecutar**: Recomienda próxima tarea pero NO la inicia

## 🚨 Comandos Deprecados (No Usar)

Los siguientes comandos han sido integrados en `/start-task`:
- ~~`/task-progress`~~ → Integrado en start-task
- ~~`/complete-task`~~ → Integrado en start-task  
- ~~`/next-task`~~ → Reemplazado por task-status
