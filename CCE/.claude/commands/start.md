# Start Command - Universal Task Execution

**Purpose**: Execute any planned task regardless of complexity level (issue, quick-feature, or feature) with intelligent workflow management.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Execute][Task] in $ARGUMENTS"

Universal execution command that handles any planned task, automatically detecting its complexity level and applying the appropriate implementation approach.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@start "user-authentication-biometrics"` - Execute complex feature
- `@start "dark-mode-toggle"` - Execute quick feature
- `@start "login-button-fix"` - Execute issue/bug fix
- `@start "payment-processing-system"` - Execute any planned task

## Intelligent Task Detection

### 1. Task Type Recognition
The system automatically detects task type by analyzing:

**File Location & Naming Patterns**:
- `issue-*.md` → Issue/Bug Fix (3-layer context)
- `*.md` in planned/ (no prefix) → Quick Feature (6-layer context)  
- Complex features → Full Feature (11-layer context)

**Content Analysis**:
- **Issue Indicators**: "fix", "bug", "broken", error messages, specific platform issues
- **Quick Feature Indicators**: Single component, UI changes, specific functionality
- **Complex Feature Indicators**: Multiple systems, architectural changes, cross-cutting concerns

**Complexity Scoring**:
- **Scope**: Single component vs. multiple systems
- **Integration**: Isolated vs. cross-system impact
- **Architecture**: Component-level vs. system-level changes
- **Time Investment**: Hours vs. days vs. weeks

### 2. Context Architecture Selection

Based on detection, automatically apply appropriate context level:

```markdown
## Detected Task Type: [Issue | Quick Feature | Complex Feature]

**Context Level**: [3-Layer | 6-Layer | 11-Layer]
**Estimated Complexity**: [1-10]
**Execution Strategy**: [Focused Fix | Balanced Development | Comprehensive Engineering]
```

## Unified Execution Process

### Phase 1: Task Loading & Validation

#### File Discovery & Loading
- **Locate Task File**: Search workflow directories for specified task
- **Validate File Status**: Ensure task is in correct status for execution
- **Load Task Context**: Import all task documentation and requirements
- **Dependency Check**: Verify all dependencies are met before starting

#### Context Preparation
- **Context Level Assignment**: Apply appropriate context architecture (3/6/11 layers)
- **Persona Activation**: Activate recommended personas based on task type
- **Environment Setup**: Prepare development environment for task execution
- **Workflow Transition**: Move task file from `planned/` to `in-progress/`

### Phase 2: Execution Strategy Application

#### Issue Execution (3-Layer Context)
```markdown
🔧 EXECUTING ISSUE: [Task Name]
Context Level: 3-Layer (Problem → Solution → Implementation)
Focus: Direct problem resolution with minimal scope
```

**Process**:
1. **Problem Analysis**: Understand and reproduce the issue
2. **Solution Implementation**: Apply focused fix
3. **Validation**: Verify fix works and doesn't break existing functionality

#### Quick Feature Execution (6-Layer Context)
```markdown
🚀 EXECUTING QUICK FEATURE: [Task Name]
Context Level: 6-Layer (Goals → UX → Technical → Dependencies → Strategy → Quality)
Focus: Balanced feature development with user experience focus
```

**Process**:
1. **Requirements Analysis**: Understand user needs and acceptance criteria
2. **Design & Planning**: Plan user experience and technical approach
3. **Implementation**: Build feature in logical phases
4. **Integration & Testing**: Ensure feature works with existing systems
5. **Quality Validation**: Verify feature meets all requirements

#### Complex Feature Execution (11-Layer Context)
```markdown
🏗️ EXECUTING COMPLEX FEATURE: [Task Name]
Context Level: 11-Layer (Full Context Engineering Architecture)
Focus: Comprehensive system development with architectural considerations
```

**Process**:
1. **Context Engineering**: Apply full 11-layer context architecture
2. **Architectural Planning**: Design system-level changes and impacts
3. **Phased Implementation**: Execute in carefully planned phases
4. **Integration Management**: Handle complex system integrations
5. **Quality Engineering**: Apply comprehensive quality gates and validation

### Phase 3: Implementation Execution

#### Universal Implementation Patterns

**Progressive Enhancement**:
- Start with minimal viable implementation
- Add complexity incrementally
- Validate at each step before proceeding

**Continuous Validation**:
- Apply quality gates appropriate to task complexity
- Test integration points continuously
- Validate user experience at each phase

**Adaptive Complexity**:
- Monitor if task complexity changes during implementation
- Escalate or de-escalate context level as needed
- Adjust approach based on discovered requirements

### Phase 4: Completion & Transition

#### Completion Validation
Based on task type, apply appropriate completion criteria:

**Issue Completion**:
- [ ] Problem is resolved
- [ ] No regression in existing functionality
- [ ] Fix is tested and validated
- [ ] Relevant documentation updated

**Quick Feature Completion**:
- [ ] All acceptance criteria met
- [ ] User experience validated
- [ ] Integration testing completed
- [ ] Performance requirements met

**Complex Feature Completion**:
- [ ] All 11-layer context requirements satisfied
- [ ] Architectural integrity maintained
- [ ] Comprehensive testing completed
- [ ] Full documentation and knowledge transfer done

#### File Transition
- **Success**: Move from `in-progress/` to `completed/` and rename to `done-[task-name].md`
- **Failure**: Move from `in-progress/` to `completed/` and rename to `fail-[task-name].md`
- **Pause**: Keep in `in-progress/` with status updated in document
- **Update Dependencies**: Mark task as completed in dependency tracking

## Intelligent Features

### Context Escalation
If during execution the task proves more complex than initially assessed:

```markdown
⚠️ COMPLEXITY ESCALATION DETECTED

Original Assessment: [Issue/Quick Feature]
Current Assessment: [Quick Feature/Complex Feature]

Recommended Action:
1. Pause current execution
2. Re-analyze with higher context level
3. Create new plan with appropriate complexity
4. Resume with enhanced approach
```

### Smart Persona Integration
Automatically activate recommended personas based on:
- **Task Type**: Issue (minimal), Quick Feature (1-2 personas), Complex Feature (multiple personas)
- **Domain**: Security, Performance, Frontend, Backend, etc.
- **Historical Success**: Learn from past similar task outcomes

### Progress Intelligence
- **Real-time Progress Tracking**: Monitor implementation progress against plan
- **Risk Detection**: Identify potential issues before they become blockers  
- **Resource Optimization**: Suggest more efficient approaches during execution
- **Quality Prediction**: Predict potential quality issues based on implementation patterns

## Interactive Execution

### User Interaction Patterns
```markdown
🎯 TASK EXECUTION: [Task Name]

## Current Status
- **Phase**: [Current implementation phase]
- **Progress**: [X/Y tasks completed]
- **Next Action**: [What's happening next]

## Continue?
- `yes` - Continue to next phase
- `pause` - Pause and save current progress
- `details` - Show detailed progress and next steps
- `escalate` - Increase complexity level and re-plan
```

### Adaptive Execution
- **User Preferences**: Learn user's preferred interaction style
- **Context Sensitivity**: Adjust interaction frequency based on task complexity
- **Progress Visibility**: Provide appropriate level of detail for task type
- **Decision Points**: Present key decisions and alternatives during execution

## File Management

### Universal File Handling
```markdown
## File Transition Log

**Start**: `workflow/planned/[task-name].md`
**Execution**: `workflow/in-progress/[task-name].md`
**Completion**: 
  - Success: `workflow/completed/done-[task-name].md`
  - Failure: `workflow/completed/fail-[task-name].md`

**Status Updates**: Real-time updates to task file during execution
**Dependency Updates**: Automatic dependency resolution tracking
**Progress Logging**: Detailed execution log for future reference
**Logbook Updates**: Automatic updates to workflow/logbook.md on status changes
```

### Automatic Logbook Updates

When task status changes, automatically update `workflow/logbook.md`:

**On Start Execution:**
- Move task from "Recently Planned" to "In Progress"
- Update "In Progress" count in Quick Overview
- Update "Last Activity" timestamp

**On Successful Completion:**
- Move task from "In Progress" to "Recently Completed - Successful"
- Update success counters and success rate
- Log lessons learned and completion notes

**On Failed Completion:**
- Move task from "In Progress" to "Recently Completed - Failed"  
- Update failure counters and success rate
- Log failure reasons and lessons learned

**On Pause:**
- Keep in "In Progress" but add pause status and reason
- Update "Last Activity" timestamp

### Execution Tracking
Each task file gets enhanced with execution metadata:

```markdown
## Execution Metadata

**Started**: [Timestamp]
**Context Level**: [3-Layer | 6-Layer | 11-Layer]
**Personas Active**: [List of active personas]
**Estimated Duration**: [Time estimate]
**Actual Duration**: [Actual time taken]
**Complexity Escalations**: [Any changes in complexity during execution]
**Challenges Encountered**: [Issues faced during implementation]
**Solutions Applied**: [How challenges were resolved]
**Lessons Learned**: [Key insights for future similar tasks]
```

## Output Requirements

Every @start response MUST include:

```markdown
# 🚀 Starting Task: [Task Name]

## Task Analysis
- **Type**: [Issue | Quick Feature | Complex Feature]
- **Context Level**: [3-Layer | 6-Layer | 11-Layer]  
- **Estimated Complexity**: [1-10]
- **Active Personas**: [List of personas]

## Execution Plan
[Phase-by-phase execution strategy]

## Success Criteria
[How completion will be measured]

## Current Action
[What's happening right now]
```

## User Feedback Requirements

At the beginning of EVERY @start response, include:
1. Confirmation of which task is being executed
2. Detected task type and complexity level
3. Estimated time to completion
4. Active personas and their roles
5. Clear indication that execution is beginning
6. Any critical considerations or risks identified

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates