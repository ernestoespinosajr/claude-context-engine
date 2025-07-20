# Execute Context Command

**Purpose**: Implement planned features using focused context engineering with continuous validation and isolated development.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Action][Subject] in $ARGUMENTS"

Implement planned features using focused context engineering with continuous validation and isolated development.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@execute-context.md "user-authentication"` - Implement user authentication feature
- `@execute-context.md "database-optimization" --persona-performance` - Performance-focused implementation
- `@execute-context.md "payment-processing" --persona-security --validate` - Security-focused implementation with validation

## Process

### 1. Context Loading & Validation
- **Load Feature PRP**: Import complete feature plan from `workflow/planned/[feature-name].md`
- **Validate Dependencies**: Ensure all prerequisite features are completed
- **Build Context Stack**: Construct 11-layer context architecture focused on current feature
- **Context Optimization**: Optimize context density and relevance for implementation
- **Critical Assessment**: Cuestionar suposiciones y evaluar alternativas antes de iniciar implementación

### 2. Pre-Implementation Setup
- **Environment Preparation**: Set up development environment and dependencies
- **Feature Isolation**: Create isolated development scope to prevent interference
- **Validation Framework**: Initialize continuous validation and quality gates
- **Progress Tracking**: Set up real-time progress monitoring
- **Alternative Analysis**: Evaluar enfoques alternativos de implementación

### 3. Implementation Execution

#### Phase 1: Foundation Setup
**Objective**: Establish feature foundation and dependencies

**Process**:
- Load Layer 7 (Project Context) and Layer 6 (Domain Knowledge)
- Install required packages and dependencies
- Create necessary directories and files
- Set up configuration files and constants
- Question dependency choices and configuration decisions

**Validation Gates**:
- Dependencies installed without conflicts
- File structure follows project conventions
- Base configuration is valid and accessible
- No breaking changes to existing code
- Dependency choices are justified and optimal

#### Phase 2: Core Implementation
**Objective**: Implement main feature functionality

**Process**:
- Load Layer 10 (Immediate Context) and Layer 8 (Feature Context)
- Implement main feature algorithms and business logic
- Build UI components, services, or modules
- Connect feature with existing system components
- Challenge implementation assumptions and consider alternatives

**Validation Gates**:
- Core functionality works as specified
- Components render/execute correctly
- Integration points are functional
- No regression in existing features
- Implementation approach is optimal and well-reasoned

#### Phase 3: Integration & Testing
**Objective**: Ensure feature integrates properly with existing system

**Process**:
- Load Layer 8 (Feature Context) and Layer 7 (Project Context)
- Test feature with existing system components
- Validate complete user workflows
- Ensure feature meets performance requirements
- Identify potential edge cases and failure scenarios

**Validation Gates**:
- Integration tests pass
- End-to-end workflows function correctly
- Performance benchmarks are met
- No memory leaks or resource issues
- Edge cases and failure scenarios are handled

#### Phase 4: Optimization & Documentation
**Objective**: Optimize performance and document implementation

**Process**:
- Load Layer 4 (Historical Context) and Layer 6 (Domain Knowledge)
- Optimize code for better performance
- Create comprehensive documentation
- Conduct thorough code review and cleanup
- Question optimization choices and document trade-offs

**Validation Gates**:
- Performance optimizations implemented
- Code coverage meets requirements (>90%)
- Documentation is complete and accurate
- Code quality standards are met
- Optimization choices are justified with data

### 4. Feature Isolation Strategy

Only modify files directly related to current feature, and add dependencies only if required for current feature.

### 5. Continuous Validation

**Quality Gates Monitoring**:
- Level 1: Syntax & Structure (compilation, conventions, structure, dependencies)
- Level 2: Integration (existing codebase, API contracts, data flow, regression)
- Level 3: Functional (requirements, edge cases, error handling, UX)
- Level 4: Performance & Quality (performance, security, coverage, documentation)
- Level 5: Critical Analysis (assumption validation, alternative consideration, trade-off analysis)

### 6. Feature Completion

**Completion Criteria**:
- All quality gates passed
- Feature fully functional
- Integration tests passing
- Performance benchmarks met
- Documentation complete
- Code review completed
- Critical analysis performed and documented

**Completion Actions**:
- Move feature from `workflow/in-progress/` to `workflow/completed/successful/`
- Update dependencies as completed
- Generate final implementation report
- Update project status

## Important File Handling
- MOVE feature file from `workflow/planned/[feature-name].md` to `workflow/in-progress/active/[feature-name].md` when execution begins
- File is NEVER duplicated, only moved between directories
- When completed, MOVE from `workflow/in-progress/active/[feature-name].md` to `workflow/completed/successful/[feature-name].md`
- Feature name must match exactly the name used during planning phase
- Failed features are moved to `workflow/in-progress/paused/` if execution is halted

## Interactive Task Execution
The implementation MUST follow these guidelines:

1. **Initial Setup**:
   - At the beginning, display active flags and personas
   - Show the list of tasks from the PRP
   - Clearly indicate the current task being worked on
   - Present critical questions about the approach

2. **For Each Task**:
   - Display: `📋 TASK [X/Y]: [Task Name] (Complexity: [1-10])`
   - Show description and acceptance criteria
   - Present alternative approaches to consider
   - Indicate: `🔄 Starting task execution...`

3. **During Task Execution**:
   - Provide regular updates on progress
   - Show intermediate steps and decisions
   - Question key decisions and present alternatives
   - Use emoji indicators for status: 🔄 (in progress), ✅ (completed), ⚠️ (warning), ❌ (error)

4. **Task Completion**:
   - Display: `✅ COMPLETED: [Task Name]`
   - Summarize what was accomplished
   - Show how acceptance criteria were met
   - Discuss trade-offs and alternative approaches considered
   - Update the PRP file with completion status

5. **User Interaction**:
   - After each task, ask: `Continue to next task? (yes/no/details/alternatives)`
   - If "no", mark the feature as paused and move to `workflow/in-progress/paused/`
   - If "details", provide more information about the next task
   - If "alternatives", discuss alternative approaches for the next task
   - Only proceed to the next task with user confirmation

6. **Final Completion**:
   - When all tasks are complete, display a summary
   - Show which tasks were completed and any that were skipped
   - Present a critical analysis of the implementation
   - MOVE the file to `workflow/completed/successful/`
   - Provide clear instructions for next steps

## Required PRP Updates
During execution, the PRP file MUST be updated with:

```markdown
## Task Status

### Task 1: [Task Name]
- **Status**: Completed | In Progress | Paused
- **Completion Date**: [Date if completed]
- **Notes**: [Any implementation notes]
- **Challenges**: [Any challenges encountered]
- **Solutions**: [How challenges were addressed]
- **Alternatives Considered**: [Alternative approaches that fueron considerados]
- **Trade-offs**: [Trade-offs de la solución implementada]

### Task 2: [Task Name]
- **Status**: Completed | In Progress | Paused
...
```

## User Feedback
At the beginning of the response, ALWAYS include:
1. A confirmation of which flags and personas are active
2. A brief explanation of how they will influence the implementation process
3. A clear indication that the file has been moved to the in-progress directory
4. Al menos un cuestionamiento crítico sobre el enfoque de implementación
5. Una perspectiva alternativa que podría considerarse

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates 