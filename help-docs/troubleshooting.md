# 🔧 Solución de Problemas - Claude Code System

## 🚨 Problemas Comunes

### 1. "No se puede encontrar el comando"
```
Error: Comando /task-progress no encontrado
```
**Solución**: Los comandos han sido simplificados. Usa `/start-task` que integra todo el flujo.

**Comandos actualizados**:
- ~~`/task-progress`~~ → Integrado en `/start-task`
- ~~`/complete-task`~~ → Integrado en `/start-task`
- ~~`/next-task`~~ → Reemplazado por `/task-status`

### 2. "No se encuentra claude_tasks.md"
```
Error: claude_tasks.md no existe
```
**Solución**:
1. Ejecuta `/parse-prd` para generar el backlog inicial
2. Asegúrate de que `project-docs/PRD.md` esté completo
3. Verifica que estés en el directorio raíz del proyecto

### 3. "Pérdida de contexto del proyecto" 
```
Claude no recuerda el estado del proyecto
```
**Solución**:
1. Ejecuta `/emergency-context` para recuperar contexto completo
2. Si no funciona, ejecuta `/task-status` para obtener resumen actual
3. Verifica que los archivos estén en las rutas correctas:
   - `./project-docs/PRD.md`
   - `./claude_tasks.md`
   - `./claude_self_improve.md`

### 4. "No hay tareas disponibles"
```
No se encontraron tareas listas para comenzar
```
**Solución**:
1. Revisa dependencias con `/task-status`
2. Verifica que estés en la fase correcta (Phase 1 vs Phase 2)
3. Ejecuta `/add-discovered-task` si necesitas crear nuevas tareas

### 5. "Error de fase de desarrollo"
```
Intentando acceder a backend en Phase 1
```
**Solución**:
- **Phase 1**: Solo dummy data permitido, NO conexiones backend
- **Phase 2**: Solo después de completar Phase 1 al 100%
- Revisa tu fase actual con `/task-status`

## 🔍 Diagnóstico Paso a Paso

### Si el sistema no funciona correctamente:

1. **Verifica estructura de archivos**:
   ```
   project-root/
   ├── project-docs/PRD.md ✓
   ├── claude_tasks.md ✓
   ├── claude_self_improve.md ✓
   └── CLAUDE.md ✓
   ```

2. **Ejecuta diagnóstico**:
   ```
   /task-status     # Estado general
   /emergency-context  # Si hay problemas de contexto
   ```

3. **Si aún hay problemas**:
   - Reinicia Claude completamente
   - Verifica que todos los archivos tengan contenido
   - Ejecuta `/parse-prd` para regenerar tareas

## 📋 Rutas Obligatorias del Sistema

**NOTA**: Estas rutas están definidas en `CLAUDE.md` y son fijas:

- **Documentación**: `./project-docs/` (NUNCA renombrar)
- **PRD**: `./project-docs/PRD.md`
- **Requisitos**: `./project-docs/functional-requirements.md`
- **UI/UX**: `./project-docs/ui-ux-specifications.md`
- **Tareas**: `./claude_tasks.md`
- **Mejoras**: `./claude_self_improve.md`
- **Comandos**: `./help-docs/commands-reference.md`

## 🆘 Cuando Todo Falla

### Reset Completo del Sistema:

1. **Verifica archivos críticos existen**:
   - `project-docs/PRD.md` debe tener contenido
   - `CLAUDE.md` debe existir en la raíz

2. **Regenera el backlog**:
   ```
   /parse-prd
   /analyze-complexity
   /task-status
   ```

3. **Si continúan los problemas**:
   - Revisa que el script `setup-project.sh` se ejecutó correctamente
   - Verifica que estés en el directorio correcto del proyecto
   - Confirma que Claude puede leer todos los archivos

## 📞 Obtener Ayuda

### Información útil para reportar problemas:
1. **Comando que causó el error**: `/comando-específico`
2. **Mensaje de error exacto**: Copia el texto completo
3. **Estado del proyecto**: Resultado de `/task-status`
4. **Archivos presentes**: Lista de archivos en el directorio raíz

### Comando de diagnóstico rápido:
```
/project-audit
```
Este comando también incluye diagnóstico de problemas técnicos comunes.
