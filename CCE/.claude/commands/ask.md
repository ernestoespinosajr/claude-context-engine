# Ask Command - Smart Task Consultation

**Purpose**: Analyze task complexity, suggest appropriate approach, and provide intelligent recommendations for features, bugs, and improvements.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Analyze][Task] in $ARGUMENTS"

Intelligent task analysis and routing system that prevents duplication, suggests optimal approaches, and provides context-aware recommendations.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@ask "implement user authentication with biometrics"` - Complex feature analysis
- `@ask "fix login button not responding on iOS"` - Bug analysis and routing
- `@ask "add dark mode toggle to settings"` - UI/UX feature consultation
- `@ask "optimize database queries for better performance"` - Performance improvement analysis

## Process

### 1. Context File Creation

#### Generate Context Code
- **Sequential Numbering**: Check `workflow/00-Context/` directory to determine next available ct### number
- **Context File Creation**: Create `workflow/00-Context/ct###-[task-name].md` with comprehensive analysis
- **Logbook Registration**: Update logbook.md with new context file entry

#### Logbook Analysis (Priority 1)
- **Quick Scan**: First check `workflow/logbook.md` for instant project overview
- **Pattern Recognition**: Identify similar completed tasks and their outcomes
- **Success/Failure Analysis**: Learn from previous task patterns
- **Dependency Awareness**: Understand current project dependencies and conflicts

#### Historical Context Check (Priority 2)
- **Detailed Search**: If needed, search individual task files for detailed implementation patterns
- **Duplication Prevention**: Identify existing components, patterns, or solutions that can be reused
- **Knowledge Mining**: Extract lessons learned from previous similar tasks
- **Component Mapping**: Map reusable components and architectural decisions

#### Complexity Assessment
- **Scope Analysis**: Understand the full scope and impact of the requested task
- **Technical Complexity**: Evaluate technical challenges and requirements
- **Cross-System Impact**: Assess how the task affects other parts of the system
- **Resource Requirements**: Estimate time, skills, and resources needed

#### Context Classification
Using smart analysis to determine task category:

**Bug Fix Indicators:**
- Error messages, crashes, or broken functionality
- "fix", "bug", "issue", "broken", "not working"
- Specific platform or browser issues
- Performance degradation

**Quick Feature Indicators:**
- UI/UX changes, simple additions
- "add", "toggle", "button", "theme", "style"
- Single-screen or component changes
- Configuration or settings changes

**Complex Feature Indicators:**
- New system integration, multi-component features
- "authentication", "payment", "real-time", "sync"
- Cross-platform requirements
- Database schema changes

### 2. Smart Recommendations

#### Command Route Suggestion
```markdown
## Recommendation Analysis

### Task Classification: [Bug Fix | Quick Feature | Complex Feature]

**Complexity Score**: [1-10]
- Technical Complexity: [1-10]
- Integration Complexity: [1-10] 
- Testing Complexity: [1-10]
- Time Investment: [1-10]

**Recommended Command**: `@[issue|quick-feature|feature]`

**Reasoning**: [Detailed explanation of why this classification and command]
```

#### Complete Command Construction
Based on task analysis, build the optimal command with:

**Persona Selection Logic:**
- **Security Tasks**: `--persona-security` (auth, permissions, encryption, vulnerability fixes)
- **Performance Tasks**: `--persona-performance` (optimization, caching, database tuning)
- **UI/UX Tasks**: `--persona-frontend` (interface changes, user experience, styling)
- **API/Backend Tasks**: `--persona-backend` (services, APIs, server-side logic)
- **Architecture Tasks**: `--persona-architect` (system design, structural changes)
- **Database Tasks**: `--persona-data` (schema changes, data modeling, migrations)
- **Mobile Tasks**: `--persona-mobile` (mobile-specific implementations)
- **Deployment Tasks**: `--persona-deployment` (CI/CD, infrastructure, DevOps)
- **Testing Tasks**: `--persona-testing` (test implementation, QA processes)

**MCP Module Selection Logic:**
- **Complex Analysis Needed**: `--mcp-sequential` (multi-step reasoning, complex problem solving)
- **Context Management**: `--mcp-context7` (when task needs enhanced context awareness)
- **Web Interaction**: `--mcp-playwright` (web automation, browser testing, scraping)
- **Research Required**: `--mcp-fetch` (web content analysis, external documentation)
- **Project Management**: `--mcp-linear` (issue tracking, project coordination)
- **Payment Integration**: `--mcp-stripe` (payment processing, financial operations)
- **Database Operations**: `--mcp-supabase` (database analysis, backend insights)
- **Deployment Tasks**: `--mcp-vercel` (hosting, deployment management)

**Agent Selection Logic:**

@include shared/agent-architecture.yml#Agent_Recommendation_Logic

**Agent Specialization Mapping:**
- **Frontend Tasks** → `frontend` agent: React, Vue, Angular, UI/UX, responsive design
- **Backend Tasks** → `backend` agent: APIs, databases, authentication, server architecture
- **Mobile Tasks** → `mobile` agent: React Native, native features, cross-platform apps
- **Full-Stack Tasks** → `full-stack` agent: End-to-end web applications, integration
- **Context Management** → `context-manager` agent: Information architecture, knowledge management
- **Multi-Agent Coordination** → `multi-agent-coordinator` agent: Complex workflow orchestration
- **Technical Documentation** → `technical-writer` agent: Documentation creation and management
- **AI System Implementation** → `ai-engineer` agent: AI architecture and model deployment

**Flag Combination Examples:**
```bash
# Authentication feature (complex, security-focused, needs sequential thinking)
@feature "user-authentication-biometrics" --persona-security --mcp-sequential

# Performance optimization (performance-focused, needs context awareness)
@issue "optimize-database-queries" --persona-performance --mcp-context7 --mcp-supabase

# UI component (frontend-focused, simple implementation)
@quick-feature "dark-mode-toggle" --persona-frontend

# API integration (backend-focused, complex logic, needs research)
@feature "payment-gateway-integration" --persona-backend --mcp-sequential --mcp-stripe --mcp-fetch

# Web automation (playwright for web interaction, testing for validation)
@feature "automated-e2e-testing" --persona-testing --mcp-playwright

# Deployment feature (DevOps-focused, deployment integration)
@feature "ci-cd-pipeline-setup" --persona-deployment --mcp-vercel --mcp-linear

# Research-intensive feature (needs external documentation and analysis)
@feature "external-api-integration" --persona-backend --mcp-fetch --mcp-sequential
```

**Command Selection Matrix:**
- **@issue**: Complexity 1-3, single component, bug fixes, simple additions
- **@quick-feature**: Complexity 4-6, UI changes, medium features, configuration
- **@feature**: Complexity 7-10, system changes, architecture, integrations

#### Historical Context Integration
```markdown
## Similar Previous Work

### Found Implementations:
- **[Feature/Task Name]** (Status: Completed/In-Progress)
  - Location: `workflow/[directory]/[filename].md`
  - Similarity: [High|Medium|Low]
  - Reusable Components: [List of reusable parts]
  - Lessons Learned: [Key insights from previous implementation]

### Reuse Opportunities:
- **Components**: [List of existing components that can be reused]
- **Patterns**: [Architectural patterns already established]
- **Dependencies**: [Shared dependencies that are already implemented]
```

### 3. Context-Aware Analysis

#### System Integration Points
- **Affected Components**: List all system components that will be touched
- **API Interfaces**: Existing APIs that need modification or new ones required
- **Database Changes**: Schema modifications or new tables needed
- **Security Implications**: Security considerations and requirements

#### Risk Assessment
- **Technical Risks**: Potential technical challenges and solutions
- **Integration Risks**: Risk of breaking existing functionality
- **Performance Risks**: Potential performance impact and mitigation
- **User Experience Risks**: UX considerations and usability impact

### 4. Alternative Approaches

#### Multiple Solution Paths
For each analyzed task, provide 2-3 alternative approaches:

```markdown
## Alternative Approaches

### Approach 1: [Name] (Recommended)
- **Method**: [High-level approach description]
- **Pros**: [Benefits and advantages]
- **Cons**: [Limitations and trade-offs]
- **Estimated Effort**: [Time/complexity estimate]

### Approach 2: [Name] (Alternative)
- **Method**: [Alternative approach description]
- **Pros**: [Benefits and advantages]  
- **Cons**: [Limitations and trade-offs]
- **Estimated Effort**: [Time/complexity estimate]

### Approach 3: [Name] (Minimal)
- **Method**: [Minimal viable approach]
- **Pros**: [Benefits and advantages]
- **Cons**: [Limitations and trade-offs]
- **Estimated Effort**: [Time/complexity estimate]
```

### 5. Context File Structure

#### Context File Template
Create the context file with this structure:

```markdown
# Context Analysis: [Task Description]
*Context ID: ct###-[task-name]*
*Created: [Date]*
*Analysis by: @ask command*

## User Requirements & Goals
- **Primary Goal**: [Main objective]
- **User Story**: [As a... I want... So that...]
- **Acceptance Criteria**: [Success conditions]

## Business Context
- **Business Value**: [Why this task matters]
- **User Impact**: [How users benefit]
- **Priority Level**: [High/Medium/Low]

## Technical Constraints & Dependencies
- **Technology Stack**: [Relevant technologies]
- **System Dependencies**: [What this task depends on]
- **Integration Points**: [Systems/components affected]
- **Database Changes**: [Schema modifications needed]

## Complexity Analysis
- **Overall Complexity Score**: [1-10]
- **Technical Complexity**: [1-10]
- **Integration Complexity**: [1-10] 
- **Testing Complexity**: [1-10]
- **Time Investment**: [1-10]
- **Context Layer Recommendation**: [3/6/11-layer]

## Recommended Approach
- **Command Route**: [@issue/@quick-feature/@feature]
- **Agent Recommendation**: [Specialized agent]
- **Persona Flags**: [Required personas]
- **MCP Modules**: [Required MCP integrations]

## Success Criteria & Acceptance Criteria
- **Functional Requirements**: [What it must do]
- **Non-Functional Requirements**: [Performance, security, etc.]
- **Testing Requirements**: [How to validate]

## Risk Assessment
- **Technical Risks**: [Development challenges]
- **Integration Risks**: [System interaction risks]  
- **Performance Risks**: [Performance impacts]
- **User Experience Risks**: [UX considerations]

## Alternative Approaches
### Approach 1: [Recommended]
- **Method**: [Description]
- **Pros**: [Advantages]
- **Cons**: [Trade-offs]
- **Effort**: [Estimate]

### Approach 2: [Alternative]  
- **Method**: [Description]
- **Pros**: [Advantages]
- **Cons**: [Trade-offs]
- **Effort**: [Estimate]

## Historical Context
- **Similar Previous Work**: [Links to related tasks]
- **Reusable Components**: [Existing components to leverage]
- **Lessons Learned**: [Insights from similar tasks]

## Next Steps
1. **Planning Command**: [Exact command to run]
2. **Agent Dispatch**: [Agent specialization recommendation]
3. **Dependencies**: [Prerequisites]
```

## Output Format

The response MUST follow this structure:

```markdown
# Task Analysis: [Task Description]

## 📋 Copy-Paste Command (Ready to Execute)

```bash
@[issue|quick-feature|feature] "ct###-[exact-task-name]" [--persona-X] [--mcp-X] [--flags]
```

**Why this command?**
- `@[command]`: [Reason for choosing this command level]
- `ct###-[task-name]`: [Context file ID for seamless integration]
- `[--persona-X]`: [Why this persona/specialist is needed]
- `[--mcp-X]`: [Why this MCP module enhances the task]
- `[--flags]`: [Any additional flags and their purpose]

**Context File Created**: `workflow/00-Context/ct###-[task-name].md`
**Reference Materials**: [If any existing similar tasks found: `workflow/03-completed/tsk###-[similar-task]-completed.md`]

## 🤖 Agent Recommendation

After completing the planning phase above, this task would benefit from specialized agent execution:

**Recommended Agent**: `[frontend|backend|mobile|full-stack|context-manager|multi-agent-coordinator|technical-writer|ai-engineer]`

**Why this agent?**
- **Domain Expertise**: [Specific specializations needed from agent]
- **Autonomous Benefits**: [Complex workflows agent can handle independently]
- **Context Management**: [How agent prevents context pollution during implementation]

**Agent Dispatch Command**:
```bash
# After planning is complete, dispatch to specialized agent:
dispatch [agent-name] --context="ct###-[task-name]" [--persona-flags] [--mcp-flags]
```

**Agent Integration Benefits**:
- ✅ **Deep Specialization**: Agent has 1000+ lines of domain-specific expertise
- ✅ **Autonomous Execution**: Handles multi-step implementation without constant oversight
- ✅ **Clean Context**: Separate execution context prevents planning conversation pollution
- ✅ **Consistent Quality**: Agent enforces team standards and best practices automatically

## 🎯 Quick Recommendation
**Planning**: `@[issue|quick-feature|feature] "[task-name]" [--flags]`
**Execution**: `dispatch [agent-name] --context="[task-name]"`
**Reasoning**: [Brief explanation of hybrid approach benefits]

## 🔍 Analysis Summary
- **Complexity**: [1-10]
- **Category**: [Bug Fix | Quick Feature | Complex Feature]
- **Domain**: [Frontend | Backend | Mobile | Full-Stack | Context Management | Multi-Agent Coordination | Technical Writing | AI Engineering]
- **Estimated Time**: [Time estimate]
- **Risk Level**: [Low | Medium | High]

## 📚 Historical Context
[Results from previous work search - what exists, what can be reused]

## 🧠 Recommended Approach
[Detailed recommendation with persona suggestions and agent specialization]

## 🔀 Alternative Options
[2-3 alternative approaches with trade-offs, including agent vs command-only execution]

## ⚠️ Critical Considerations
[Important factors to consider before starting, including agent vs command decision factors]

## 🚀 Next Steps
1. **Planning Phase**: [Execute recommended command for analysis and planning]
2. **Agent Dispatch**: [When to dispatch recommended agent for execution]
3. **Dependencies**: [What to prepare before starting]
```

## Smart Features

### Auto-Discovery
- **Component Scanning**: Automatically scan codebase for existing similar components
- **Dependency Analysis**: Analyze package.json, requirements.txt, etc. for relevant dependencies
- **Pattern Recognition**: Identify established patterns in the codebase
- **Architecture Awareness**: Understand current system architecture and constraints

### Intelligence Integration
- **Learning from History**: Improve recommendations based on past project outcomes
- **Context Optimization**: Suggest the optimal context level for the task
- **Resource Optimization**: Recommend the most efficient approach based on available resources
- **Quality Prediction**: Predict potential quality issues based on similar past implementations

## Important Behaviors

### MANDATORY PRE-ANALYSIS STEPS
1. **Read workflow/logbook.md FIRST** - Check Task Log, Project Structure, Components Registry
2. **Prevent Duplication** - Verify similar tasks haven't been completed or are in progress
3. **Component Reuse** - Identify existing components/services that can be reused
4. **Pattern Recognition** - Learn from previous similar successful/failed tasks
5. **Project Context** - Understand current project structure and constraints

### Task Log Integration
Every @ask response MUST include a section showing:
```markdown
## 📋 Project Context Check
- **Similar Tasks Found**: [None | List of similar tasks with status]
- **Reusable Components**: [None | List of components that can be reused] 
- **Project Structure Impact**: [How this task affects existing structure]
- **Previous Lessons**: [Any relevant lessons from completed tasks]
```

### Critical Questions to Address
1. "Have we solved something similar before?"
2. "What existing components can be reused?"
3. "What's the simplest approach that meets requirements?"
4. "What are the hidden complexities not immediately obvious?"
5. "How does this fit with our existing architecture?"

### Copy-Paste Command Requirements
The MOST IMPORTANT part of every @ask response is providing a ready-to-execute command:

**MANDATORY COMMAND FORMAT:**
```bash
@[issue|quick-feature|feature] "[exact-task-name]" [--persona-X] [--mcp-X] [--additional-flags]
```

**Command Construction Checklist:**
1. ✅ **Exact Task Name**: Use clear, descriptive kebab-case names
2. ✅ **Appropriate Command Level**: @issue (1-3), @quick-feature (4-6), @feature (7-10)
3. ✅ **Relevant Persona**: Based on primary skill domain needed
4. ✅ **MCP Modules**: Include if task complexity requires enhanced capabilities
5. ✅ **Reference Materials**: Link to similar completed tasks if found
6. ✅ **Explanation**: Brief explanation of each flag's purpose

**Examples of Well-Constructed Commands:**
```bash
# Security feature with complex reasoning needed
@feature "implement-2fa-authentication" --persona-security --mcp-sequential

# Performance issue with database analysis needed
@issue "fix-memory-leak-dashboard" --persona-performance --mcp-context7 --mcp-supabase

# UI enhancement with no additional flags needed
@quick-feature "add-loading-spinner-forms" --persona-frontend

# Complex system integration with research and testing
@feature "real-time-notifications-websocket" --persona-backend --persona-frontend --mcp-sequential --mcp-fetch --mcp-playwright

# Payment integration with Stripe and research
@feature "subscription-billing-system" --persona-backend --mcp-stripe --mcp-fetch --mcp-sequential

# Deployment automation with Vercel integration
@feature "auto-deployment-pipeline" --persona-deployment --mcp-vercel --mcp-linear
```

### User Feedback Requirements
At the beginning of EVERY response, include:
1. Brief confirmation of what task is being analyzed
2. High-level complexity assessment (Simple/Medium/Complex)
3. Whether similar work was found in the project history
4. **Copy-paste ready command with full explanation**
5. Any critical considerations or warnings

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates