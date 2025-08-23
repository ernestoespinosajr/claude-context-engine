# Feature Command - Complex Features & System Changes

**Purpose**: Handle complex features, architectural changes, and system-wide implementations using the full 11-layer Context Engineering architecture.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Build][Feature] in $ARGUMENTS"

Handle complex features, architectural changes, and system-wide implementations using the full 11-layer Context Engineering architecture.

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
- Creates feature PRP file in `workflow/planned/[feature-name].md`
- Updates `workflow/dependencies.md` with new relationships
- Generates context quality report

## Automatic Logbook Updates

When creating a complex feature plan, automatically add entry to `workflow/logbook.md`:

```markdown
## Recently Planned (Last 10)
- **[feature-name]** | [Brief description] | Created: [date] | Type: Complex Feature | Complexity: [1-10]
```

Update logbook sections:
- Increment "Planned" count in Quick Overview
- Add to "By Type" → Complex Features counter
- Add to appropriate complexity range (typically 7-10)
- Update "Last Activity" timestamp
- Add dependencies to Dependencies Overview
- Note any architectural decisions in Project Evolution

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