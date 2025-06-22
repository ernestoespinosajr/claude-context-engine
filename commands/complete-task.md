## Completar Tarea

EXECUTE this workflow when a task is finished:

### STEP 1: Completion Verification
Verify ALL acceptance criteria are met:
- [ ] All subtasks completed and tested
- [ ] Code follows project conventions
- [ ] Phase compliance maintained (dummy data in Phase 1)
- [ ] No blockers remaining
- [ ] Documentation updated if needed

### STEP 2: Update claude_tasks.md
Mark task as completed:
```
## ✅ [TASK_NAME] - COMPLETED
**Completion Date**: [Current Date/Time]
**Phase**: [1/2]
**Deliverables**:
- [File/Feature 1]: [Description]
- [File/Feature 2]: [Description]
**Key Achievements**:
- Achievement 1
- Achievement 2
**Lessons Learned**: [Technical insights, patterns discovered]
**Impact on Other Tasks**: [Tasks now unblocked or affected]
```

### STEP 3: Dependency Updates
Check claude_tasks.md for tasks that were waiting on this completion:
- Mark dependent tasks as "Ready to Start"
- Update their priority if needed
- Note any new dependencies discovered

### STEP 4: Self-Improvement Documentation
Update `claude_self_improve.md` with:
- Patterns or solutions discovered
- Code conventions established
- Mistakes avoided or corrected
- Best practices identified

### STEP 5: Phase Assessment
- If in Phase 1: Assess if all frontend work is complete
- Check if ready to transition to Phase 2
- Note any Phase 2 tasks that became clearer during Phase 1 work

### STEP 6: Memory and Next Steps
- Execute `openmemory:add-memory` with completion summary
- Suggest next logical task from backlog
- **ASK USER** for confirmation before proceeding to next task

ALWAYS provide clear summary of what was accomplished and request explicit approval for next steps.
