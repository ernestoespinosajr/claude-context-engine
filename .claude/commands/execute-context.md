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

### 2. Pre-Implementation Setup
- **Environment Preparation**: Set up development environment and dependencies
- **Feature Isolation**: Create isolated development scope to prevent interference
- **Validation Framework**: Initialize continuous validation and quality gates
- **Progress Tracking**: Set up real-time progress monitoring

### 3. Implementation Execution

#### Phase 1: Foundation Setup
**Objective**: Establish feature foundation and dependencies

**Process**:
- Load Layer 7 (Project Context) and Layer 6 (Domain Knowledge)
- Install required packages and dependencies
- Create necessary directories and files
- Set up configuration files and constants

**Validation Gates**:
- Dependencies installed without conflicts
- File structure follows project conventions
- Base configuration is valid and accessible
- No breaking changes to existing code

#### Phase 2: Core Implementation
**Objective**: Implement main feature functionality

**Process**:
- Load Layer 10 (Immediate Context) and Layer 8 (Feature Context)
- Implement main feature algorithms and business logic
- Build UI components, services, or modules
- Connect feature with existing system components

**Validation Gates**:
- Core functionality works as specified
- Components render/execute correctly
- Integration points are functional
- No regression in existing features

#### Phase 3: Integration & Testing
**Objective**: Ensure feature integrates properly with existing system

**Process**:
- Load Layer 8 (Feature Context) and Layer 7 (Project Context)
- Test feature with existing system components
- Validate complete user workflows
- Ensure feature meets performance requirements

**Validation Gates**:
- Integration tests pass
- End-to-end workflows function correctly
- Performance benchmarks are met
- No memory leaks or resource issues

#### Phase 4: Optimization & Documentation
**Objective**: Optimize performance and document implementation

**Process**:
- Load Layer 4 (Historical Context) and Layer 6 (Domain Knowledge)
- Optimize code for better performance
- Create comprehensive documentation
- Conduct thorough code review and cleanup

**Validation Gates**:
- Performance optimizations implemented
- Code coverage meets requirements (>90%)
- Documentation is complete and accurate
- Code quality standards are met

### 4. Feature Isolation Strategy

Only modify files directly related to current feature, and add dependencies only if required for current feature.

### 5. Continuous Validation

**Quality Gates Monitoring**:
- Level 1: Syntax & Structure (compilation, conventions, structure, dependencies)
- Level 2: Integration (existing codebase, API contracts, data flow, regression)
- Level 3: Functional (requirements, edge cases, error handling, UX)
- Level 4: Performance & Quality (performance, security, coverage, documentation)

### 6. Feature Completion

**Completion Criteria**:
- All quality gates passed
- Feature fully functional
- Integration tests passing
- Performance benchmarks met
- Documentation complete
- Code review completed

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

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates 