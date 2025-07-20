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

### 2. Status Reporting

#### When Checking a Specific Feature
- Implementation status (planned, in-progress, completed)
- Quality metrics and token usage
- Dependency status and conflicts
- Implementation recommendations

#### When Checking Overall Project
- Summary of all features by status
- Dependencies graph
- Critical path analysis
- Detected bottlenecks

### 3. Optimization Recommendations
- Context quality improvements
- Token optimization opportunities
- Implementation sequence suggestions
- Resource allocation recommendations

## Important File Handling
- Reads from `workflow/planned/`, `workflow/in-progress/` and `workflow/completed/` directories
- Never modifies feature files, only reads them
- Verifies correct location of feature files (ensures features are in correct directories)
- Detects orphaned or misplaced files

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates 