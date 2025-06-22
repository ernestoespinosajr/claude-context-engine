## Generar Tareas Iniciales desde PRD

EXECUTE this workflow to create initial task backlog from PRD.md (ONLY FIRST TIME):

### STEP 1: PRD Analysis
1. Read PRD.md completely and extract:
   - Core features and functionality requirements
   - User stories and use cases
   - Technical specifications and constraints
   - UI/UX requirements and design guidelines
   - Success criteria and acceptance definitions

### STEP 2: Phase Separation
Categorize ALL requirements into two phases:
- **Phase 1 (Frontend)**: UI/UX, navigation, components, dummy data
- **Phase 2 (Backend)**: APIs, authentication, data persistence, integrations

### STEP 3: Task Generation
Generate comprehensive task list organized by categories:

```
# 📋 CLAUDE TASKS - [Project Name from PRD]
*Generated from PRD.md on [Date]*

## 🏗️ SETUP TASKS - Phase 1
### 📦 Project Setup - CRITICAL - Phase 1
**Description**: Configure development environment and dependencies
**Acceptance Criteria**:
- [ ] Expo/React Native project initialized
- [ ] TypeScript configuration complete
- [ ] Required dependencies installed
- [ ] Development scripts working
**Estimated Effort**: Medium

## 🎨 UI/UX TASKS - Phase 1
[Generate UI tasks from PRD requirements]

## 🧩 COMPONENT TASKS - Phase 1  
[Generate component tasks from PRD UI specifications]

## 🗺️ NAVIGATION TASKS - Phase 1
[Generate navigation tasks from PRD user flows]

## 💾 STATE MANAGEMENT TASKS - Phase 1
[Generate state tasks for dummy data management]

## 🔌 BACKEND TASKS - Phase 2
[Generate API and integration tasks]

## 🔐 AUTHENTICATION TASKS - Phase 2
[Generate auth tasks if specified in PRD]

## 📊 DATA TASKS - Phase 2
[Generate data persistence and sync tasks]
```

### STEP 4: Task Prioritization
For each generated task:
- Assign priority: CRITICAL/HIGH/MEDIUM/LOW
- Define dependencies between tasks
- Estimate effort: Small/Medium/Large
- Set phase compliance (1 or 2)

### STEP 5: Validation Against PRD
Ensure every PRD requirement has corresponding tasks:
- Cross-reference features with generated tasks
- Verify nothing was missed
- Confirm phase assignments are correct

### STEP 6: Create claude_tasks.md
Generate the complete file with:
- Task categories and organization
- Ready-to-start tasks for Phase 1
- Future tasks for Phase 2
- Clear dependencies and priorities

### STEP 7: Memory Storage
Execute `openmemory:add-memory` with:
"Initial task backlog generated from PRD. Total tasks: [number], Phase 1 ready: [number]"

IMPORTANT: This command should only be run ONCE at project start. For ongoing task management, use other commands.
