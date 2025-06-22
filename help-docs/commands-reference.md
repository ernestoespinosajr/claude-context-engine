# 📋 Commands Reference - Claude Code React Native System

## 📊 Overview

Complete reference for all slash commands available in the Claude Code React Native System. Each command is designed for specific phases of development workflow.

## 🚀 Project Setup Commands

### `/parse-prd`
**Purpose**: Generate initial task backlog from PRD.md  
**Usage**: `Run once at project start`  
**Prerequisites**: PRD.md must exist with project requirements

**What it does**:
- Reads and analyzes PRD.md completely
- Extracts core features and requirements
- Separates tasks into Phase 1 (Frontend) and Phase 2 (Backend)
- Creates organized task list in claude_tasks.md
- Assigns priorities and estimates
- Stores project context in memory

**Example Output**:
```markdown
# 📋 CLAUDE TASKS - MyApp
*Generated from PRD.md on 2025-01-15*

## 🏗️ SETUP TASKS - Phase 1
### 📦 Project Base Setup - CRITICAL - Phase 1
**Description**: Initialize and configure React Native/Expo project
**Estimated Effort**: Medium (4-6 hours)
```

**When to use**:
- ✅ First time setting up project
- ✅ When PRD.md is significantly updated
- ❌ During regular development (use other commands)

**Troubleshooting**:
- If no tasks generated: Check PRD.md has sufficient detail
- If error occurs: Ensure PRD.md exists and is readable
- If categories missing: Add more specific features to PRD

---

### `/analyze-complexity`
**Purpose**: Analyze task complexity with web research  
**Usage**: `After /parse-prd or when adding new complex tasks`  
**Parameters**: Optional task name to analyze specific task

**What it does**:
- Conducts web research for each task using web_search
- Researches React Native/Expo best practices
- Identifies common challenges and solutions
- Assigns complexity scores (1-10 scale)
- Documents research findings
- Recommends tasks for expansion

**Complexity Scoring**:
- **1-3**: Simple, straightforward implementation
- **4-6**: Moderate, requires some research/setup
- **7-8**: Complex, multiple moving parts
- **9-10**: Very complex, high risk of blockers

**Example Usage**:
```
/analyze-complexity                    # Analyze all tasks
/analyze-complexity Authentication     # Analyze specific task
```

**Research Areas**:
- Technical complexity and implementation approaches
- Required dependencies and setup requirements
- Common gotchas and potential blockers
- Time estimates from development communities
- Best practices and patterns

---

### `/expand-task [task-name]`
**Purpose**: Break down complex task into manageable subtasks  
**Usage**: `For tasks with complexity score ≥6`  
**Parameters**: Task name to expand

**What it does**:
- Researches optimal implementation approach
- Breaks task into 1-4 hour subtasks
- Defines clear acceptance criteria for each subtask
- Sets up dependency chains between subtasks
- Maintains logical development sequence

**Subtask Criteria**:
- Maximum 4 hours estimated time
- Clear, specific deliverable
- Testable outcome
- Minimal dependencies between subtasks

**Example**:
```
/expand-task Authentication System

# Results in:
#### Subtask 1: Setup Auth Dependencies (1h)
#### Subtask 2: Create Login Form UI (2h)
#### Subtask 3: Add Form Validation (1.5h)
#### Subtask 4: Implement Auth Context (2h)
```

---

### `/expand-all`
**Purpose**: Expand all high-complexity tasks automatically  
**Usage**: `After complexity analysis, before starting development`

**What it does**:
- Identifies all tasks with complexity ≥6
- Runs expansion process for each complex task
- Creates comprehensive subtask breakdown
- Updates dependency chains across all tasks
- Generates development timeline recommendations

**Benefits**:
- Converts large, intimidating tasks into manageable work
- Provides realistic time estimates
- Enables better project planning
- Reduces risk of getting stuck on complex implementations

---

## 🔄 Daily Development Commands

### `/emergency-context`
**Purpose**: Quickly recover full project context  
**Usage**: `Start of every development session`

**What it loads**:
- Project overview from PRD.md
- Current task status from claude_tasks.md
- Recent progress and decisions from memory
- Current development phase (1 or 2)
- Next priority tasks and blockers

**Output Format**:
```
## 🚨 EMERGENCY CONTEXT RECOVERY
**Project**: MyApp - Social Media Platform
**Current Phase**: Phase 1 (Frontend Only)
**Active Task**: Create LoginScreen Component (2h)
**Last Progress**: UI layout completed, working on validation
**Next Priority**: Complete validation → Add error handling → Start RegisterScreen
**Blockers**: None
**Ready to Proceed**: YES
```

---

### `/start-task`
**Purpose**: Begin working on next logical task  
**Usage**: `When ready to start new task`  
**Prerequisites**: Task backlog must exist (run /parse-prd first)

**Selection Criteria**:
- All dependencies completed
- Current phase compliance (Phase 1 vs Phase 2)
- Priority level and criticality
- Logical development sequence

**What it does**:
- Analyzes available tasks
- Selects optimal next task
- Loads task context and requirements
- Sets up workspace mentally for Claude
- Documents task start in claude_tasks.md

---

### `/task-progress`
**Purpose**: Update progress on current task  
**Usage**: `During development after significant progress`

**What it tracks**:
- Completed subtasks and achievements
- Current work in progress
- Files modified/created
- Blockers encountered
- Time invested vs estimated
- Next steps in sequence

**Auto-Documentation**:
```markdown
## 🔄 Create LoginScreen - IN PROGRESS
**Last Updated**: 2025-01-15 14:30
**Progress**: 60% - UI completed, validation in progress
**Completed Subtasks**:
- [✅] Form layout and styling
- [✅] Input field components
**In Progress**:
- [🔄] Form validation logic
**Files Modified**: src/screens/LoginScreen.tsx, src/utils/validation.ts
```

---

### `/complete-task`
**Purpose**: Mark task as completed with full documentation  
**Usage**: `When all acceptance criteria are met`

**Comprehensive Documentation**:
- Detailed list of deliverables achieved
- Files created/modified with descriptions
- Key technical achievements and solutions
- Lessons learned and patterns discovered
- Impact on other tasks (dependencies unblocked)
- Testing completed and quality metrics
- Time analysis (actual vs estimated)

**Auto-Updates**:
- claude_tasks.md with completion record
- claude_self_improve.md with patterns and learnings
- Memory storage with project progress
- Dependency chain updates for blocked tasks

**Next Steps**:
- Analyzes task backlog for logical next task
- Provides specific recommendation
- **Always asks for user confirmation** before proceeding

---

### `/add-discovered-task`
**Purpose**: Add new task discovered during development  
**Usage**: `When you realize something needs to be done that wasn't planned`

**Smart Categorization**:
- Analyzes task context and requirements
- Determines appropriate category (Setup, UI, Backend, etc.)
- Assigns priority based on impact and dependencies
- Sets correct development phase (1 or 2)
- Links to related tasks automatically

**Categories**:
- **SETUP**: Environment, dependencies, configuration
- **CORE_FEATURES**: Main app functionality
- **UI_COMPONENTS**: Reusable components and design system
- **NAVIGATION**: Routing and navigation
- **STATE_MANAGEMENT**: Data flow and state
- **TESTING**: Unit tests, integration tests
- **OPTIMIZATION**: Performance, bundle size
- **DOCUMENTATION**: README, guides, comments

---

## 🔧 Maintenance Commands

### `/sync-tasks`
**Purpose**: Reorganize and clean up task backlog  
**Usage**: `Weekly or when task list becomes disorganized`

**Cleanup Operations**:
- Marks completed work that wasn't properly closed
- Identifies blocked tasks that might now be unblocked
- Updates priorities based on recent discoveries
- Removes orphaned or outdated tasks
- Reorganizes by current project phase

**Reorganization**:
```markdown
## 🏁 CURRENT SPRINT
[Active work]

## 📋 READY TO START - PHASE 1
[Frontend tasks ready to begin]

## ❌ BLOCKED
[Tasks waiting on dependencies]

## ✅ COMPLETED
[Finished work with deliverables]
```

---

## 🎯 Advanced Usage Patterns

### Command Sequences

#### **Project Initialization**:
```bash
/parse-prd              # Generate task backlog
/analyze-complexity     # Research all tasks
/expand-all            # Break down complex tasks
/emergency-context     # Load full context
/start-task           # Begin first task
```

#### **Daily Development Flow**:
```bash
/emergency-context     # Start of session
/task-progress        # Update current work
/complete-task        # When finished
/start-task          # Begin next task
```

#### **Weekly Maintenance**:
```bash
/sync-tasks           # Clean up task list
/emergency-context    # Refresh full context
```

### Command Combinations

#### **For Complex Features**:
```bash
/add-discovered-task   # Add the complex feature
/analyze-complexity [feature-name]  # Research complexity
/expand-task [feature-name]         # Break into subtasks
```

#### **When Stuck or Blocked**:
```bash
/emergency-context     # Reload full context
/sync-tasks           # Clean up any confusion
/start-task          # Find alternative task
```

## 🚨 Error Handling

### Common Command Errors

#### **Command Not Found**
```
Error: /parse-prd is not recognized
```
**Solutions**:
1. Restart Claude Code completely
2. Verify `.claude/commands/parse-prd.md` exists
3. Check file has content (not empty)

#### **Missing Prerequisites**
```
Error: claude_tasks.md must exist with task backlog
```
**Solutions**:
1. Run `/parse-prd` first to generate tasks
2. Check PRD.md exists and has content
3. Verify project setup is complete

#### **Context Loading Issues**
```
Warning: No project context found in memory
```
**Solutions**:
1. Run `/emergency-context` to reload
2. Check PRD.md and claude_tasks.md exist
3. Re-run `/parse-prd` if necessary

### Command-Specific Troubleshooting

#### `/parse-prd` Issues
- **No tasks generated**: PRD.md needs more detail
- **Wrong categories**: Update PRD features section
- **Missing phases**: Ensure Phase 1/2 distinction clear

#### `/analyze-complexity` Issues
- **No research results**: Check internet connection
- **Incomplete analysis**: Re-run for specific tasks
- **Wrong complexity scores**: Review research findings

#### `/start-task` Issues
- **No available tasks**: Check dependencies and blockers
- **Wrong task selected**: Review priority and phase settings
- **Task already in progress**: Use `/task-progress` instead

## 📚 Best Practices

### Command Usage Guidelines
1. **Always start sessions** with `/emergency-context`
2. **Use `/task-progress` frequently** during development
3. **Complete tasks properly** with `/complete-task`
4. **Add discovered tasks immediately** with `/add-discovered-task`
5. **Maintain organization** with weekly `/sync-tasks`

### Quality Assurance
- Every task should have clear acceptance criteria
- All completed tasks should be tested
- Documentation should be updated continuously
- Patterns should be recorded in claude_self_improve.md

### Performance Tips
- Use tab completion for file references in Claude Code
- Keep task descriptions specific and actionable
- Break large tasks before starting work
- Document decisions immediately to preserve context

---

**Command Support**: For command-specific issues, check the troubleshooting guide or the individual command files in `.claude/commands/`
