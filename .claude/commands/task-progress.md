## Actualizar Progreso de Tarea

EXECUTE this workflow to update task progress automatically:

### STEP 1: Context Loading
1. Read `claude_tasks.md` to understand current task structure
2. Execute `openmemory:search-memories` with query "current task progress [project name]"
3. Identify the task currently being worked on

### STEP 2: Progress Analysis
Analyze what has been accomplished since last update:
- Files created or modified
- Subtasks completed
- Blockers encountered
- New discoveries or requirements

### STEP 3: Update claude_tasks.md
Update the task section with:
```
## [TASK_NAME] - [STATUS: In Progress/Completed/Blocked]
**Last Updated**: [Current Date/Time]
**Progress**: [Percentage or specific achievements]
**Completed Subtasks**:
- [✅] Subtask 1: [Description] 
- [✅] Subtask 2: [Description]
**In Progress**:
- [🔄] Subtask 3: [Description] - [Progress notes]
**Blockers**:
- [❌] Issue: [Description] - [Required action]
**Files Modified**: [List of files]
**Next Steps**: [What comes next]
```

### STEP 4: Memory Storage
Execute `openmemory:add-memory` with content:
"Task [TASK_NAME] progress: [summary of achievements and current state]"

### STEP 5: Discovery Check
If any NEW requirements or tasks were discovered during work:
- Run `/add-discovered-task` command
- Link new task to current task as dependency if needed

ALWAYS provide a summary of what was updated and ask if more details are needed.
