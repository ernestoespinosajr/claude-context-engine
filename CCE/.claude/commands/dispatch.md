# Dispatch Command - Unified Task Execution & Agent System
**Version**: Context Engineering System v3.0  
**Purpose**: Universal task execution with specialized agent dispatch, complete workflow management, and intelligent task lifecycle

---

**IMPORTANT**: This command handles complete task execution from start to finish - use AFTER completing the planning phase with @ask/@feature/@issue/@quick-feature commands.

## Command Execution
Execute: immediate task execution with intelligent agent dispatch and complete workflow management  
Legend: 🤖 Generated based on task complexity and agent specialization  
Purpose: "[Execute][Task] with [Agent] including full lifecycle management"

## Usage

### Basic Dispatch Syntax
```bash
dispatch [agent-name] --context="[task-name]" [--persona-flags] [--mcp-flags]
```

### Universal Task Execution
```bash
# Execute any planned task with appropriate agent
dispatch [agent-name] "[task-name]"              # Execute with specific agent
dispatch auto "[task-name]"                      # Auto-select best agent for task
```

### Available Agents

**Core Development:**
- `frontend` 🎨 - Web frontend development, UI/UX implementation  
- `backend` ⚙️ - Server-side logic, APIs, database architecture
- `mobile` 📱 - Mobile app development, React Native, native features
- `full-stack` 🌐 - End-to-end web applications, frontend-backend integration

**Meta & Orchestration:**
- `context-manager` 🧠 - Information architecture and knowledge management
- `multi-agent-coordinator` 🎯 - Multi-agent workflow orchestration

**Business & Product:**
- `technical-writer` 📝 - Technical documentation and knowledge creation

**Data & AI:**
- `ai-engineer` 🤖 - AI system architecture and implementation

### Example Dispatch Commands
```bash
# Frontend feature implementation
dispatch frontend --context="dark-mode-toggle" --persona-frontend --mcp-playwright

# Backend API development  
dispatch backend --context="user-authentication-api" --persona-security --mcp-supabase

# Mobile app development
dispatch mobile --context="biometric-login" --persona-mobile --persona-security

# Full-stack feature
dispatch full-stack --context="real-time-chat" --persona-frontend --persona-backend --mcp-playwright --mcp-supabase

# AI system implementation
dispatch ai-engineer --context="recommendation-engine" --persona-data --mcp-sequential

# Technical documentation
dispatch technical-writer --context="api-documentation" --mcp-fetch --mcp-context7

# Multi-agent coordination
dispatch multi-agent-coordinator --context="complex-workflow" --mcp-sequential --mcp-context7
```

## Agent Selection Guide

### Frontend Agent 🎨
**Use when task involves:**
- React, Vue, Angular UI components
- CSS styling and responsive design
- Frontend state management
- Browser APIs and client-side features
- UI/UX implementation and accessibility

**Example tasks:**
- Component library development
- Dashboard UI implementation  
- Progressive web app features
- Client-side form validation
- Animation and interaction design

### Backend Agent ⚙️
**Use when task involves:**
- REST APIs and GraphQL services
- Database design and operations
- Authentication and authorization
- Server-side business logic
- Third-party integrations

**Example tasks:**
- API endpoint development
- Database schema design
- Authentication system implementation
- Payment processing integration
- Microservices architecture

### Mobile Agent 📱  
**Use when task involves:**
- React Native app development
- Native device features (camera, GPS, biometrics)
- Cross-platform mobile solutions
- App store deployment
- Mobile-specific UI patterns

**Example tasks:**
- Mobile app UI development
- Camera and photo features
- Push notification implementation
- Offline functionality
- Biometric authentication

### Full-Stack Agent 🌐
**Use when task involves:**
- End-to-end web feature development
- Frontend-backend integration
- Real-time features (WebSockets)
- Complete user workflows
- Database-to-UI data flow

**Example tasks:**
- Real-time collaboration features  
- User authentication flows
- File upload and management systems
- Dashboard with backend integration
- E-commerce checkout process

### Mobile Full-Stack Agent 📱🌐
**Use when task involves:**
- Mobile apps with custom APIs
- Mobile-backend real-time features
- Push notification systems
- Mobile-optimized backend services
- Cross-platform mobile solutions

**Example tasks:**
- Mobile chat applications
- Mobile payment systems
- Location-based mobile apps
- Mobile-first social platforms
- IoT mobile applications

## MANDATORY PRE-EXECUTION WORKFLOW

### Step 1: Pre-Execution Validation
BEFORE dispatching ANY agent, you MUST:

1. **Read workflow/logbook.md** - Check Task Log, project structure, and existing components
2. **Locate task file** in workflow/planned/ directory
3. **Move task file** from workflow/planned/ to workflow/in-progress/
4. **Update logbook.md** Task Log entry status from "pending" to "in-progress"

**Status Update Examples**:
```markdown
`@user-auth-biometrics` | in-progress | /workflow/in-progress/user-auth-biometrics.md | Add biometric login system
`@issue-login-ios-bug` | in-progress | /workflow/in-progress/issue-login-ios-bug.md | Fix login button not responding on iOS  
`@dark-mode-toggle` | in-progress | /workflow/in-progress/dark-mode-toggle.md | Add theme switching to settings
```

### Step 2: Task Type Recognition & Agent Selection
The system automatically detects task type by analyzing:

**File Location & Naming Patterns**:
- `issue-*.md` → Issue/Bug Fix (3-layer context)
- `*.md` in planned/ (no prefix) → Quick Feature (6-layer context)  
- Complex features → Full Feature (11-layer context)

**Content Analysis**:
- **Issue Indicators**: "fix", "bug", "broken", error messages, specific platform issues
- **Quick Feature Indicators**: Single component, UI changes, specific functionality
- **Complex Feature Indicators**: Multiple systems, architectural changes, cross-cutting concerns

## Context Handoff Process

### 1. Planning Context Transfer
The agent receives complete planning context including:
- Requirements and acceptance criteria
- Architecture decisions and constraints  
- Technical specifications and dependencies
- Quality gates and success metrics
- Risk assessment and mitigation strategies

### 2. Agent Initialization
- Load specialized agent configuration
- Apply recommended persona specializations
- Configure appropriate MCP modules
- Set up agent-specific context optimization
- Initialize quality assurance standards

### 3. Autonomous Execution
- Agent works independently in separate context
- Makes implementation decisions based on expertise
- Follows established patterns and best practices
- Handles errors and edge cases autonomously
- Provides progress updates without verbose explanations

### 4. Quality Assurance
- Agent validates implementation against acceptance criteria
- Runs automated tests and quality checks
- Ensures security and performance standards
- Documents implementation decisions and changes
- Prepares deployment-ready code

## Agent Collaboration Patterns

### Sequential Agent Workflows
```bash
# Backend-first development
dispatch backend --context="user-api"
# After backend completion:
dispatch frontend --context="user-interface" --depends-on="user-api"
```

### Parallel Agent Development
```bash
# Simultaneous development (when possible)
dispatch backend --context="chat-api" &
dispatch frontend --context="chat-ui" --api-contract="chat-api"
```

### Agent Handoff Workflows  
```bash
# Mobile agent → Backend agent collaboration for API needs
dispatch mobile --context="mobile-app-ui"
# If backend API needed:
dispatch backend --context="mobile-app-backend" --extends="mobile-app-ui"
```

## File Lifecycle Management

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

### Step 3: MANDATORY Final Documentation & Completion
Upon reaching 100% completion, you MUST complete ALL of these steps:

#### 3.1: Update Task Status in Logbook
IMMEDIATELY update the Task Log section in workflow/logbook.md:
- Change status from "in-progress" to completion status:
  - "complete without issues" (fully successful)
  - "complete with issues to fix" (works but has problems)  
  - "pending" (incomplete or paused)
- Update file path to new completed location

**Final Status Examples**:
```markdown
`@user-auth-biometrics` | complete without issues | /workflow/completed/done-user-auth-biometrics.md | Add biometric login system
`@issue-memory-leak` | complete with issues to fix | /workflow/completed/done-issue-memory-leak.md | Fix image loading memory leak - needs optimization
`@dark-mode-toggle` | pending | /workflow/in-progress/dark-mode-toggle.md | Add theme switching to settings - paused for design review
```

#### 3.2: Move and Rename Task File
1. **Move file** from workflow/in-progress/ to workflow/completed/
2. **Rename file** with appropriate prefix:
   - Success: `done-[task-name].md`
   - Failure: `fail-[task-name].md`

#### 3.3: Update Logbook Statistics
Update the Quick Overview section in workflow/logbook.md:
- Decrement "In Progress" count
- Increment "Completed" count (success or failure)
- Update "Last Activity" timestamp
- Recalculate success rate percentage

#### 3.4: Document Completion Details
Add completion summary to the task file before moving:
```markdown
## COMPLETION SUMMARY
- **Status**: [Complete/Failed/Paused]
- **Completion Date**: [Date]
- **Issues Encountered**: [Any problems faced]
- **Solutions Applied**: [How problems were solved]
- **Final Notes**: [Key insights or remaining work]
- **Quality Gates Met**: [Which quality criteria were satisfied]
```

## Quality Gates and Validation

### Agent Validation Requirements
Each agent must satisfy these quality gates before completion:

**Code Quality:**
- ✅ Type safety and error handling
- ✅ Code follows established patterns
- ✅ Comprehensive testing coverage
- ✅ Documentation and examples provided

**Performance Standards:**
- ✅ Meets performance benchmarks  
- ✅ Optimized for target platform
- ✅ Efficient resource utilization
- ✅ Scalability considerations addressed

**Security Compliance:**
- ✅ Input validation and sanitization
- ✅ Authentication and authorization
- ✅ Data protection measures
- ✅ Vulnerability assessment completed

**Integration Testing:**
- ✅ API contracts validated
- ✅ End-to-end workflows tested
- ✅ Error scenarios handled gracefully
- ✅ Deployment readiness confirmed

## Error Handling and Recovery

### Agent Error Resolution
Agents handle errors autonomously through:

**Automatic Recovery:**
- Retry failed operations with exponential backoff
- Fallback to alternative implementation approaches  
- Graceful degradation for non-critical features
- Self-correction based on error patterns

**Escalation Triggers:**
- External service dependencies unavailable
- Conflicting requirements or constraints discovered
- Security vulnerabilities requiring architectural changes
- Performance targets cannot be achieved with current approach

**Recovery Communication:**
- Clear explanation of issue and attempted solutions
- Alternative approaches considered and their trade-offs
- Recommendation for path forward with rationale
- Impact assessment on overall project timeline

## Progress Monitoring

### Agent Progress Updates
Agents provide milestone-based progress reporting:

**Implementation Phases:**
- 🏗️ **Architecture Phase**: Initial setup and structure
- 🔧 **Core Implementation**: Primary functionality development  
- 🧪 **Testing Phase**: Comprehensive testing and validation
- ⚡ **Optimization Phase**: Performance and security tuning
- 📦 **Deployment Phase**: Production readiness preparation

**Status Communication:**
- Milestone completion with acceptance criteria validation
- Performance metrics and benchmarks achieved
- Integration points validated and tested
- Quality gates passed with evidence
- Next phase dependencies identified

### Monitoring Commands
```bash
# Check agent status
agent status [agent-name]

# View agent progress  
agent progress [task-name]

# Get agent logs
agent logs [agent-name] --task="[task-name]"

# Agent health check
agent health [agent-name]
```

## Phase-by-Phase Validation Process

### Step 2: Mandatory User Validation
After completing EACH implementation phase, you MUST:

1. **Present completed phase** to user with clear description of what was accomplished
2. **Ask for validation**: "Would you like me to: **test**, **continue**, or **pause**?"
3. **WAIT for user response** - Never proceed without user validation
4. **Update task file** with ✅ completion marker and 1-2 line summary
5. **Update progress percentage** in task file

### Interactive Execution Patterns
```markdown
🎯 TASK EXECUTION: [Task Name] with [Agent]

## Current Status
- **Phase**: [Current implementation phase]
- **Progress**: [X/Y tasks completed]
- **Next Action**: [What's happening next]
- **Agent Status**: [Agent progress and current focus]

## Continue?
- `test` - Test current implementation and continue
- `continue` - Continue to next phase  
- `pause` - Pause and save current progress
- `details` - Show detailed progress and next steps
- `escalate` - Increase complexity level and re-plan
```

## Best Practices

### When to Dispatch Agents
✅ **Dispatch agents when:**
- Task complexity requires deep domain expertise
- Multi-step implementation across multiple files/systems
- Performance optimization requiring specialized knowledge
- Integration patterns requiring domain-specific understanding
- Quality assurance demanding comprehensive testing strategies

❌ **Don't dispatch agents for:**
- Simple configuration changes
- Single-file modifications
- Basic text or documentation updates
- Tasks requiring constant human decision-making
- Exploratory research or investigation tasks

### Agent Selection Strategy
1. **Analyze Task Domain**: Determine primary technical domain (frontend, backend, mobile)
2. **Assess Complexity**: Complex tasks benefit most from agent specialization
3. **Consider Integration**: Complex tasks may need agent coordination or full-stack agents
4. **Evaluate Timeline**: Agents work best for tasks requiring sustained focus
5. **Check Dependencies**: Ensure planning context provides sufficient detail

### Context Quality for Agents
**High-Quality Context Includes:**
- Clear requirements and acceptance criteria
- Technical constraints and dependencies  
- Architecture decisions already made
- Quality standards and performance targets
- Security and compliance requirements

**Poor Context Signals:**
- Vague or incomplete requirements
- Missing technical specifications
- Unclear success criteria
- Ambiguous architecture decisions
- Conflicting or contradictory constraints

## ⚠️ CRITICAL ENFORCEMENT RULES

### NON-NEGOTIABLE COMPLETION REQUIREMENTS
The dispatch command WILL NOT be considered successfully executed unless ALL of the following are completed:

1. **✅ Task Log Updated**: Status changed to completion status with correct file path
2. **✅ File Moved**: Task file moved from in-progress/ to completed/ with proper naming
3. **✅ Statistics Updated**: Logbook statistics decremented/incremented correctly
4. **✅ Completion Summary Added**: Task file contains completion documentation
5. **✅ User Validation**: Each phase validated by user before proceeding
6. **✅ Agent Quality Gates**: All agent-specific quality requirements met

**FAILURE TO COMPLETE THESE STEPS = INCOMPLETE EXECUTION**

Any dispatch execution that skips these mandatory steps must be considered failed and should be restarted with proper completion workflow.

## Output Requirements

Every dispatch response MUST include:

```markdown
# 🤖 Dispatching Agent: [Agent Name] for Task: [Task Name]

## Pre-Execution Check ✅
- Logbook reviewed for context
- Task file located and moved to in-progress
- Project structure validated
- Agent specialized for task domain

## Task Analysis
- **Type**: [Issue | Quick Feature | Complex Feature]
- **Context Level**: [3-Layer | 6-Layer | 11-Layer]  
- **Estimated Complexity**: [1-10]
- **Active Agent**: [Agent specialization and role]
- **Active Personas**: [List of personas]
- **MCP Modules**: [Active MCP integrations]

## Agent Execution Plan
[Phase-by-phase execution strategy with validation points]

## Phase 1: [Phase Name] - Agent Implementation
[Current agent implementation work with specialization]

---
**Validation Point**: After completing this phase, I will ask for your validation before proceeding.
```

## MANDATORY COMPLETION CHECKLIST

At the END of EVERY dispatch task execution, you MUST provide this completion checklist:

```markdown
# 🎯 AGENT TASK COMPLETION CHECKLIST

## Final Status: [COMPLETED/FAILED/PAUSED]

### Required Actions Completed:
- [ ] Task status updated in workflow/logbook.md Task Log
- [ ] File moved from in-progress/ to completed/
- [ ] File renamed with appropriate prefix (done-/fail-)
- [ ] Logbook statistics updated (counts, percentages, timestamps)
- [ ] Completion summary added to task file
- [ ] All agent quality gates validated
- [ ] Agent specialization requirements met

### Agent-Specific Completion:
- [ ] Domain expertise applied successfully
- [ ] Agent patterns and best practices followed
- [ ] Integration testing completed for agent scope
- [ ] Agent documentation and examples provided

### Completion Details:
- **Final Status**: [complete without issues | complete with issues to fix | pending]
- **Agent Performance**: [How agent specialization contributed to success]
- **Issues Resolved**: [What problems were solved]
- **Remaining Work**: [Any follow-up tasks needed]
- **Lessons Learned**: [Key insights for future agent dispatches]

---
**✅ All mandatory dispatch completion steps have been executed as required by the Context Engineering System workflow.**
```

## Integration with Command System

### Command-Agent Workflow
```mermaid
graph TD
    A[@ask] --> B[@feature/@issue/@quick-feature]
    B --> C[Planning Complete]
    C --> D[dispatch agent]
    D --> E[Agent Autonomous Implementation]
    E --> F[Quality Validation]
    F --> G[Deployment Ready]
```

### Workflow Phases
1. **Analysis Phase**: Use @ask for task consultation and approach recommendation
2. **Planning Phase**: Use @feature/@issue/@quick-feature for detailed planning
3. **Agent Selection**: Choose appropriate agent based on planning analysis
4. **Execution Phase**: Dispatch agent with complete planning context
5. **Validation Phase**: Agent validates implementation against quality gates
6. **Completion Phase**: Agent delivers production-ready implementation

---

**Context Engineering Integration**: The dispatch system seamlessly integrates with the existing Context Engineering workflow, providing autonomous implementation capabilities while maintaining the strategic planning and analysis strengths of the command system.

**Quality Assurance**: Every agent dispatch includes comprehensive quality validation, ensuring that autonomous implementation meets or exceeds the standards of manual implementation while significantly reducing human oversight requirements.