# Context Status Command

**Purpose**: Monitor feature health, dependencies, context quality, and overall project status with actionable insights.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Action][Subject] in $ARGUMENTS"

Monitor feature health, dependencies, context quality, and overall project status with actionable insights and optimization recommendations.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@context-status.md "user-authentication"` - Check status of user authentication feature
- `@context-status.md "database-optimization" --deep` - Comprehensive analysis of database optimization feature
- `@context-status.md` - Check overall project status

## Process

### 1. Status Collection
- **Feature Analysis**: Review feature files across workflow directories
- **Dependency Tracking**: Check dependencies and detect conflicts
- **Quality Metrics**: Assess context quality and implementation status
- **Project Overview**: Aggregate all feature statuses for project health
- **Critical Analysis**: Evaluar suposiciones y decisiones de implementación

### 2. Status Reporting

#### When Checking a Specific Feature
- Implementation status (planned, in-progress, completed)
- Quality metrics and token usage
- Dependency status and conflicts
- Implementation recommendations
- Critical assessment of approach and alternatives

#### When Checking Overall Project
- Summary of all features by status
- Dependencies graph
- Critical path analysis
- Detected bottlenecks
- Análisis crítico de decisiones arquitectónicas y técnicas

### 3. Optimization Recommendations
- Context quality improvements
- Token optimization opportunities
- Implementation sequence suggestions
- Resource allocation recommendations
- Alternative approaches to consider
- Cuestionamiento de suposiciones clave

## Important File Handling
- Reads from `workflow/planned/`, `workflow/in-progress/` and `workflow/completed/` directories
- Never modifies feature files, only reads them
- Verifies correct location of feature files (ensures features are in correct directories)
- Detects orphaned or misplaced files

## Detailed Status Reporting
The status report MUST include:

### For Specific Features

```markdown
# Status Report: [Feature Name]

## Current Location
- Directory: planned | in-progress/active | in-progress/paused | completed/successful
- Path: [Full path to feature file]
- Last Modified: [Date and time]

## Active Flags & Personas
- [List of active flags and personas]

## Critical Assessment
- Assumptions Questioned: [Lista de suposiciones cuestionadas]
- Alternative Approaches: [Enfoques alternativos considerados]
- Potential Weaknesses: [Debilidades potenciales en el enfoque actual]
- Trade-offs Identified: [Trade-offs en la implementación]

## Task Status Summary
- Total Tasks: [Number]
- Completed: [Number] ([Percentage]%)
- In Progress: [Number] ([Percentage]%)
- Pending: [Number] ([Percentage]%)
- Blocked: [Number] ([Percentage]%)

## Detailed Task Status
### Task 1: [Task Name] (Complexity: [1-10])
- Status: Completed | In Progress | Pending | Blocked
- Progress: [Percentage]%
- Time Spent: [Estimated time]
- Blockers: [Any blockers if applicable]
- Alternative Approaches: [Enfoques alternativos considerados]
- Trade-offs: [Trade-offs en la implementación]

### Task 2: [Task Name] (Complexity: [1-10])
...

## Dependencies
- Required Features: [List of features this depends on]
- Dependent Features: [List of features that depend on this]
- Blocked By: [Features blocking progress]
- Dependency Assessment: [Evaluación crítica de las dependencias]

## Quality Metrics
- Context Quality Score: [1-10]
- Implementation Quality: [1-10]
- Test Coverage: [Percentage]%
- Documentation Completeness: [1-10]
- Critical Thinking Score: [1-10]

## Recommendations
- [List of actionable recommendations]
- [Alternative approaches to consider]
- [Cuestionamientos críticos a resolver]
```

### For Overall Project

```markdown
# Project Status Report

## Feature Summary
- Total Features: [Number]
- Planned: [Number] ([Percentage]%)
- In Progress: [Number] ([Percentage]%)
- Completed: [Number] ([Percentage]%)
- Paused/Blocked: [Number] ([Percentage]%)

## Critical Project Assessment
- Key Assumptions Questioned: [Lista de suposiciones cuestionadas]
- Architectural Trade-offs: [Trade-offs arquitectónicos identificados]
- Alternative Approaches: [Enfoques alternativos a considerar]
- Potential Risks: [Riesgos potenciales no abordados]

## Recent Activity
- Last 7 Days: [Number] features created, [Number] moved to in-progress, [Number] completed
- Most Active Feature: [Feature name]

## Task Completion
- Total Tasks: [Number]
- Completed Tasks: [Number] ([Percentage]%)
- In Progress Tasks: [Number] ([Percentage]%)
- Pending Tasks: [Number] ([Percentage]%)
- Blocked Tasks: [Number] ([Percentage]%)

## Critical Path
- Blocking Features: [List of features blocking others]
- Recommended Next Features: [List of features to focus on next]
- Alternative Paths: [Caminos alternativos a considerar]

## Health Metrics
- Overall Project Health: [1-10]
- Dependency Health: [1-10]
- Implementation Quality: [1-10]
- Documentation Quality: [1-10]
- Critical Thinking Score: [1-10]

## Recommendations
- [List of actionable recommendations]
- [Alternative approaches to consider]
- [Cuestionamientos críticos a resolver]
```

## User Feedback
At the beginning of the response, ALWAYS include:
1. A confirmation of which flags and personas are active
2. A brief explanation of how they influence the status analysis
3. A clear indication of what is being analyzed (specific feature or overall project)
4. Al menos un cuestionamiento crítico sobre el estado actual
5. Una perspectiva alternativa que podría mejorar el proyecto

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates 