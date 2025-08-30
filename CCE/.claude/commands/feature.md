# Feature Command - Complex Features & System Changes

**Purpose**: Handle complex features, architectural changes, and system-wide implementations using the full 11-layer Context Engineering architecture.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: plan-only. Create plan in workflow/01-planned/ and update logbook
Legend: Generated based on symbols used in command
Purpose: "[Plan][Feature] for $ARGUMENTS"

Creates comprehensive feature plan using full 11-layer Context Engineering architecture and registers in logbook. References context from 00-Context/ if available. Use dispatch to execute with specialized agent.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@feature "implement real-time collaboration system"` - Complex multi-user feature
- `@feature "redesign entire authentication architecture"` - System architecture change
- `@feature "integrate machine learning recommendations"` - Advanced AI integration
- `@feature "build multi-tenant SaaS platform"` - Platform-level feature

## Process

### 1. Feature Analysis
- **Project Detection**: Analyze project structure, language, and framework
- **Scope Analysis**: Understand feature requirements and complexity
- **Context Gathering**: Collect relevant information for 11-layer architecture
- **Critical Evaluation**: Question assumptions and analyze alternatives

### 2. Context Engineering (11-Layer Architecture)

#### Layer 1: System Instructions
System role and instructions for AI assistant

#### Layer 2: Goals
Primary objectives and success criteria

#### Layer 3: Constraints
Technical limitations and requirements

#### Layer 4: Historical Context
Past decisions and lessons learned

#### Layer 5: External Context
Third-party resources and documentation

#### Layer 6: Domain Knowledge
Technical expertise for implementation

#### Layer 7: Project Context
Current project structure and architecture

#### Layer 8: Feature Context
Related features and dependencies

#### Layer 9: Session Context
Current development session state

#### Layer 10: Immediate Context
Current implementation focus

#### Layer 11: User Query
Original request and requirements

### 3. PRP Generation

Create comprehensive Product Requirements Prompt with:
- Executive Summary
- Goal & Context
- Full 11-layer Context Architecture
- Research Findings
- Implementation Blueprint
- Quality Gates
- Dependencies
- Risk Assessment
- Success Metrics
- Critical Analysis & Alternatives

### 4. Dependency Analysis
- Check for feature dependencies and conflicts
- Update dependency mapping
- Validate implementation order
- Challenge dependency assumptions

### 5. Plan Validation
- Verify completeness
- Check for missing requirements
- Validate technical feasibility
- Identify potential logical flaws
- Present alternative approaches

## Output
- Creates feature PRP file in `workflow/01-planned/tsk###-[feature-name].md`
- Updates `workflow/dependencies.md` with new relationships
- Generates context quality report

## MANDATORY TASK LOG REGISTRATION

IMMEDIATELY after creating a feature plan, you MUST update `workflow/logbook.md`:

### Step 1: Register in Task Log Section
Add entry in **Task Log** section with exact ultra-compact format:
```markdown
`tsk###-user-auth-biometrics` | pending | /workflow/01-planned/tsk###-user-auth-biometrics.md | Add biometric login system
`tsk###-payment-integration` | pending | /workflow/01-planned/tsk###-payment-integration.md | Integrate Stripe payment processing
`tsk###-real-time-notifications` | pending | /workflow/01-planned/tsk###-real-time-notifications.md | WebSocket notification system
```

**Format Rules**:
- Task name: kebab-case, descriptive but short
- Achievement goal: 1-6 words max, user outcome focused
- No extra spaces, under 50 characters total for goal

### Step 2: Update Logbook Statistics  
- Increment "Planned" count in Quick Overview
- Add to "By Type" → Complex Features counter
- Add to appropriate complexity range (typically 7-10)
- Update "Last Activity" timestamp
- Add dependencies to Dependencies Overview
- Note any architectural decisions in Project Evolution

### Step 3: Check for Existing Components
Before creating the feature, scan the **Project Structure** section in logbook.md to ensure:
- No duplicate components are being created
- Existing services/components can be reused
- File structure conflicts are avoided

## Important File Handling
- The feature file is created in `workflow/planned/` directory
- Feature names are sanitized (lowercase, dashes instead of spaces)
- Each feature receives a timestamp and unique identifier
- Dependencies are tracked in `workflow/dependencies.md`
- Logbook is automatically updated with new planning activity

## Required PRP Structure
Every Product Requirements Prompt MUST include these sections:

```markdown
# Feature: [Feature Name]

## Executive Summary
[Brief description of the feature]

## Active Flags & Personas
[List of active flags and personas being used, with their purpose]

## Critical Analysis
[Critical analysis of the proposal, questioning assumptions and presenting alternatives]

## Tasks
[Numbered list of tasks with complexity ratings]

### Task 1: [Task Name] (Complexity: [1-10])
- Description: [Task description]
- Acceptance Criteria: [What defines task completion]
- Dependencies: [Any dependencies]
- Alternative Approaches: [Alternative approaches to consider]

### Task 2: [Task Name] (Complexity: [1-10])
- Description: [Task description]
- Acceptance Criteria: [What defines task completion]
- Dependencies: [Any dependencies]
- Alternative Approaches: [Alternative approaches to consider]

[Additional tasks as needed]

## Implementation Blueprint
[Implementation details]

## 🤖 Agent Execution Recommendation

**Recommended Agent**: `[frontend|backend|mobile|full-stack|context-manager|multi-agent-coordinator|technical-writer|ai-engineer]`

**Agent Specialization Benefits**:
- **Domain Expertise**: [Specific agent capabilities needed for this feature]
- **Autonomous Implementation**: [Complex workflows the agent can handle independently]
- **Quality Assurance**: [Built-in validation and best practices the agent provides]

**Agent Dispatch Strategy**:
```bash
# After this planning is approved, execute with:
dispatch [recommended-agent] --context="[feature-name]" [--persona-flags] [--mcp-flags]
```

**Why Agent vs Command Execution?**
- ✅ **Complexity Handling**: Feature requires multi-step implementation across multiple files/systems
- ✅ **Context Management**: Separate agent context prevents main conversation pollution
- ✅ **Specialized Knowledge**: Agent has deep domain expertise for this feature type
- ✅ **Autonomous Progress**: Agent can make implementation decisions without constant guidance

**Agent Integration Points**:
- **Planning Context**: Agent receives this complete feature plan as context
- **Persona Integration**: Agent automatically applies recommended persona specializations
- **MCP Configuration**: Agent leverages specified MCP modules for enhanced capabilities
- **Progress Reporting**: Agent provides milestone updates without cluttering main conversation

## Quality Gates
[Quality criteria that must be met]

## Dependencies
[List of dependencies on other features]

## Risk Assessment
[Potential risks and mitigation strategies]

## Success Metrics
[How success will be measured]

## Alternative Perspectives
[Alternative perspectives and counterarguments to consider]
```

## User Feedback Requirements

At the beginning of EVERY response, include:
1. A confirmation of which flags and personas are active
2. A brief explanation of how they will influence the planning process
3. At least one critical questioning about the requested feature
4. An alternative perspective that the user should consider

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates