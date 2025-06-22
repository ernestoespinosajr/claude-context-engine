## Recuperar Contexto de Emergencia

Use when starting a session and need full project context quickly:

### RAPID CONTEXT RECOVERY
1. **PRD Analysis**: Read PRD.md and extract key objectives
2. **Memory Recovery**: Execute multiple openmemory:search-memories:
   - "[project name] current status"
   - "Phase 1 completion status"  
   - "recent task progress"
   - "technical decisions made"
3. **Task State**: Read claude_tasks.md and identify:
   - Currently active task
   - Last completed task
   - Next priority tasks
4. **Environment Check**: Verify setup is complete
5. **Phase Identification**: Determine if in Phase 1 or Phase 2

### OUTPUT FORMAT
```
## 🚨 EMERGENCY CONTEXT RECOVERY
**Project**: [Name and brief description]
**Current Phase**: [1: Frontend Only / 2: Backend Integration]
**Active Task**: [Current task being worked on]
**Last Progress**: [Most recent achievement]
**Next Priority**: [Top 3 tasks in backlog]
**Blockers**: [Any current issues]
**Ready to Proceed**: [YES/NO with reasons]
```

### IMMEDIATE ACTION
Based on context recovered, suggest the most logical next step:
- Continue current task with `/task-progress`
- Start new task with `/start-task`
- Resolve blockers first
- Sync task organization with `/sync-tasks`

ALWAYS end with clear recommendation for immediate action.
