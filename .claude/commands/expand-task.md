## Expandir Tarea en Subtareas

EXECUTE this workflow to break down complex tasks into manageable subtasks:

### STEP 1: Task Selection and Analysis
- Read complexity analysis if available (from /analyze-complexity)
- Identify task to expand (by name or select from high-complexity list)
- Review task description and acceptance criteria
- Consider research findings and dependencies

### STEP 2: Research-Based Breakdown
Use web_search to research optimal implementation approach:
- Search for "React Native [task] step by step implementation"
- Research development workflow best practices
- Identify logical development phases
- Find common gotchas and prerequisite steps

### STEP 3: Subtask Generation
Break task into specific, testable subtasks:

**Subtask Criteria:**
- Each subtask takes 1-4 hours maximum
- Clear, specific deliverable
- Testable outcome
- Minimal dependencies between subtasks
- Follows logical development sequence

### STEP 4: Update claude_tasks.md
Replace original task with expanded version:

```
### 🔧 [ORIGINAL_TASK_NAME] - [PRIORITY] - Phase [1/2]
**Status**: EXPANDED INTO SUBTASKS
**Original Complexity**: [X/10] 
**Total Subtasks**: [Number]

#### Subtask 1: [Specific Action] - [TIME_ESTIMATE]
**Description**: [Clear, specific deliverable]
**Acceptance Criteria**:
- [ ] Specific testable outcome 1
- [ ] Specific testable outcome 2
**Dependencies**: None | [Previous subtask]
**Files to modify**: [Specific files]
**Research notes**: [Key insights from web research]

#### Subtask 2: [Next Logical Step] - [TIME_ESTIMATE]
**Description**: [Clear, specific deliverable]
**Acceptance Criteria**:
- [ ] Specific testable outcome 1
- [ ] Specific testable outcome 2
**Dependencies**: Subtask 1
**Files to modify**: [Specific files]
**Research notes**: [Implementation approach]

[Continue for all subtasks...]
```

### STEP 5: Dependency Chain Verification
Ensure subtasks flow logically:
- Verify each subtask builds on previous ones
- Check no circular dependencies exist
- Confirm all subtasks together complete original task
- Validate Phase 1/2 compliance for each subtask

### STEP 6: Update Other Tasks
Check if expansion affects other tasks:
- Update dependencies in other tasks
- Adjust priorities if needed
- Note if other tasks should also be expanded

### STEP 7: Memory Storage
Execute `openmemory:add-memory` with:
"Expanded [TASK_NAME] into [X] subtasks. Key approach: [research-based strategy]"

ALWAYS ensure subtasks are specific enough to complete in single focused session.
