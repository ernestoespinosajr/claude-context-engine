## Sincronizar y Reorganizar Tareas

EXECUTE this workflow to maintain task organization:

### STEP 1: Task Review
Read claude_tasks.md completely and identify:
- Completed tasks not marked as such
- Blocked tasks that might now be unblocked
- Tasks with changed priorities
- Orphaned tasks without clear category

### STEP 2: Status Synchronization
Update all task statuses based on actual project state:
- Mark completed work as ✅ COMPLETED
- Identify 🔄 IN PROGRESS vs 📋 READY TO START
- Flag ❌ BLOCKED tasks with clear blockers
- Note 🆕 DISCOVERED tasks from recent work

### STEP 3: Category Reorganization
Ensure all tasks are in appropriate categories:
```
# 📋 CLAUDE TASKS - [Project Name]

## 🏁 CURRENT SPRINT
[Tasks actively being worked on]

## 📋 READY TO START - PHASE 1 (Frontend)
[Tasks ready with all dependencies met]

## 📋 READY TO START - PHASE 2 (Backend)  
[Tasks for backend integration phase]

## ❌ BLOCKED
[Tasks waiting on dependencies or external factors]

## ✅ COMPLETED
[Finished tasks with deliverables]

## 🔮 FUTURE / NICE TO HAVE
[Lower priority or future enhancements]
```

### STEP 4: Dependency Chain Check
Verify task dependencies make sense:
- Remove dependencies on completed tasks
- Add new dependencies discovered during recent work
- Ensure no circular dependencies exist

### STEP 5: Priority Adjustment
Based on recent discoveries and project evolution:
- Promote critical path tasks
- Defer tasks that lost relevance
- Group related tasks for better workflow

### STEP 6: Memory Update
Execute `openmemory:add-memory` with:
"Task synchronization completed. Current priorities: [list top 3 tasks]"

ALWAYS provide summary of changes made and current sprint focus.
