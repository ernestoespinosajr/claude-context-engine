## Iniciar Nueva Tarea (REQUIERE tareas existentes en claude_tasks.md)

PREREQUISITE: claude_tasks.md must exist with task backlog. If not, run `/parse-prd` first.

MANDATORY workflow before starting ANY development work:

### STEP 1: Environment Verification
1. Check package.json exists with required dependencies
2. Verify assets/images/ directory exists
3. Confirm src/ directory structure is complete
4. **STOP if anything is missing** - provide exact commands to fix

### STEP 2: Context Loading
1. Read PRD.md completely and extract current project objectives
2. Execute `openmemory:search-memories` with query "[project name] task context"
3. Read claude_tasks.md to understand task backlog
4. Identify current development phase (1: Frontend / 2: Backend)

### STEP 3: Task Selection
From claude_tasks.md, identify:
- Next logical task based on dependencies
- Tasks ready to start (all dependencies completed)
- Current phase compliance (Phase 1 vs Phase 2)

### STEP 4: Task Preparation
For selected task:
```
## 🚀 [TASK_NAME] - STARTED
**Start Date**: [Current Date/Time]
**Phase**: [1: Frontend Only / 2: Backend Integration]
**Prerequisites Checked**: ✅
**Research Required**: [List any investigation needed]
**Subtasks Breakdown**:
- [ ] Subtask 1: [Specific, testable outcome]
- [ ] Subtask 2: [Specific, testable outcome]
**Success Criteria**: [How to know task is complete]
```

### STEP 5: Investigation Phase
BEFORE coding, research:
- Best practices for this specific task
- Existing code patterns to follow
- Required dependencies or setup
- Document findings in task notes

### STEP 6: Memory Storage
Execute `openmemory:add-memory` with:
"Started task [TASK_NAME] in Phase [1/2]. Objectives: [brief summary]"

NEVER start coding without completing this preparation workflow.
