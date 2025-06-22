## Agregar Tarea Descubierta

EXECUTE this workflow when new tasks are discovered during development:

### STEP 1: Task Analysis
Analyze the discovered task:
- What triggered this discovery?
- Is it related to current work?
- What phase does it belong to (Phase 1: Frontend / Phase 2: Backend)?
- Priority level (Critical/High/Medium/Low)

### STEP 2: Categorization
Determine the appropriate category:
- **SETUP**: Environment, dependencies, configuration
- **CORE_FEATURES**: Main app functionality
- **UI_COMPONENTS**: Reusable components and design system
- **NAVIGATION**: Routing and navigation
- **STATE_MANAGEMENT**: Data flow and state
- **TESTING**: Unit tests, integration tests
- **OPTIMIZATION**: Performance, bundle size
- **DOCUMENTATION**: README, guides, comments
- **DEPLOYMENT**: Build, release, CI/CD

### STEP 3: Update claude_tasks.md
Add new task to appropriate category:
```
### 🆕 [TASK_NAME] - [PRIORITY] - Phase [1/2]
**Discovered During**: [Current task name]
**Category**: [Category from above]
**Description**: [Clear description of what needs to be done]
**Acceptance Criteria**:
- [ ] Criterion 1
- [ ] Criterion 2
**Dependencies**: [Other tasks this depends on]
**Estimated Effort**: [Small/Medium/Large]
**Discovery Notes**: [Why this was discovered, context]
```

### STEP 4: Dependencies Check
- Check if this new task blocks current work
- Update existing tasks if they depend on this new task
- Reorganize priority if necessary

### STEP 5: Phase Compliance
Ensure task respects two-phase development:
- Phase 1 tasks: Only frontend, dummy data
- Phase 2 tasks: Backend integration, real APIs

### STEP 6: Memory and Notification
- Execute `openmemory:add-memory` with discovery context
- Provide clear summary of what was added
- Suggest if priority adjustment is needed

ALWAYS explain WHY this task was discovered and how it impacts current work.
