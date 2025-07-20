# Context Engineer Command

**Purpose**: Analyze feature requirements and create comprehensive implementation plans using advanced Context Engineering principles.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Action][Subject] in $ARGUMENTS"

Analyze feature requirements and create comprehensive implementation plans using advanced Context Engineering principles.

@include shared/flag-inheritance.yml#Universal_Always

Examples:
- `@context-engineer.md "Add user authentication with JWT tokens"` - Feature planning
- `@context-engineer.md "Optimize database queries" --persona-performance` - Performance-focused planning
- `@context-engineer.md "Implement secure payment gateway" --persona-security --mcp-context7` - Security-focused with enhanced context

## Process

### 1. Feature Analysis
- **Project Detection**: Analyze project structure, language, and framework
- **Scope Analysis**: Understand feature requirements and complexity
- **Context Gathering**: Collect relevant information for 11-layer architecture
- **Template Selection**: Choose appropriate templates based on technology stack

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

### 4. Dependency Analysis
- Check for feature dependencies and conflicts
- Update dependency mapping
- Validate implementation order

### 5. Template Application
- Apply language-specific templates
- Customize for framework patterns
- Add validation rules

### 6. Plan Validation
- Verify completeness
- Check for missing requirements
- Validate technical feasibility

## Output
- Creates feature PRP file in `workflow/planned/[feature-name].md`
- Updates `workflow/dependencies.md` with new relationships
- Generates context quality report

## Important File Handling
- The feature file is created in `workflow/planned/` directory
- Feature names are sanitized (lowercase, dashes instead of spaces)
- Each feature receives a timestamp and unique identifier
- Dependencies are tracked in `workflow/dependencies.md`

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates 