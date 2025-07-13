# Context Engineering System v2.0
# Enhanced AI Development Assistant with Advanced Token Economy

## Core System

@include commands/shared/core.yml#Core_Philosophy
@include commands/shared/core.yml#UltraCompressed_Mode
@include commands/shared/core.yml#Context_Engineering_Architecture

## Advanced Token Economy

@include commands/shared/token-economy.yml#Token_Budget_Management
@include commands/shared/token-economy.yml#Intelligent_Cost_Management
@include commands/shared/compression-patterns.yml#Performance_Baselines
@include commands/shared/universal-constants.yml#Universal_Legend

## Command System

### /context-engineer "[feature description]"
**Purpose**: Analyze & create comprehensive feature implementation plan

**Enhanced Process**:
1. **Feature Analysis**: Detect project type, language, framework & dependencies
2. **Context Research**: Build 11-layer context architecture focused on feature
3. **Token Optimization**: Apply UltraCompressed mode if context >75%
4. **PRP Generation**: Create Product Requirements Prompt w/ implementation blueprint
5. **Dependency Mapping**: Identify feature dependencies & conflicts
6. **Template Selection**: Choose appropriate templates based on tech stack
7. **Plan Creation**: Generate detailed implementation plan w/ validation gates

**Output**: Creates feature PRP in `/workflow/planned/[feature-name].md`

**Enhanced Flags**:
@include commands/shared/flags.yml#Universal_Flags
@include commands/shared/flags.yml#Command_Specific_Flags#context_engineer

### /execute-context [feature-name]
**Purpose**: Implement planned feature w/ focused context & validation

**Enhanced Process**:
1. **Context Loading**: Load feature PRP & build optimized 11-layer context
2. **Auto Workflow**: Move from `/workflow/planned/` → `/workflow/in-progress/active/`
3. **Environment Setup**: Prepare development environment & dependencies
4. **Feature Implementation**: Execute w/ continuous validation & compression
5. **Isolated Development**: Only modify files related to current feature
6. **Quality Gates**: Run validation checks at each implementation phase
7. **Auto Completion**: Move to `/workflow/completed/` on successful validation
8. **Documentation**: Update feature progress & document decisions

**Output**: Implements feature & automatically manages workflow files

**Enhanced Flags**:
@include commands/shared/flags.yml#Command_Specific_Flags#execute_context

### /context-status [feature-name]
**Purpose**: Monitor feature health, dependencies & project status w/ intelligence

**Enhanced Process**:
1. **Feature Health**: Check current feature implementation status
2. **Workflow Status**: Monitor files in planned/in-progress/completed
3. **Dependency Status**: Verify feature dependencies are met
4. **Context Quality**: Analyze context relevance & optimization opportunities
5. **Validation Results**: Report on quality gates & validation status
6. **Token Metrics**: Track compression effectiveness & token usage
7. **Optimization Suggestions**: Recommend context & workflow improvements
8. **Project Overview**: Comprehensive project health assessment

**Output**: Detailed status report w/ actionable recommendations & metrics

**Enhanced Flags**:
@include commands/shared/flags.yml#Command_Specific_Flags#context_status

## Specialized Personas

@include commands/shared/personas.yml#All_Personas
@include commands/shared/personas.yml#Intelligent_Activation_Patterns
@include commands/shared/personas.yml#Collaboration_Patterns

## MCP Integration

@include commands/shared/mcp.yml#MCP_Integration
@include commands/shared/mcp.yml#Token_Economics
@include commands/shared/mcp.yml#Cache_Management
@include commands/shared/mcp.yml#Workflows

## Quality Standards

@include commands/shared/rules.yml#Quality_Gates
@include commands/shared/core.yml#Quality_Gates_System
@include commands/shared/rules.yml#Security_Standards

## Intelligent Workflow Management

### Enhanced Workflow Structure
```
workflow/
├── planned/              # AI-generated workflow plans
├── in-progress/          # Currently executing workflows
│   ├── active/          # Currently being worked on
│   └── paused/          # Temporarily paused workflows
├── completed/           # Finished workflows (knowledge base)
│   ├── successful/      # Completed successfully
│   └── archived/        # Older completed workflows
└── templates/           # Workflow templates by tech stack
```

### Automatic File Management
- **Auto Movement**: AI moves files through workflow stages automatically
- **State Persistence**: Session-aware progress tracking
- **Smart Resume**: Resume work from last session state
- **Conflict Resolution**: Handle multiple in-progress workflows
- **Knowledge Base**: Completed workflows become searchable database

## Advanced Features

### UltraCompressed Mode (--uc)
@include commands/shared/compression-patterns.yml#Compression_Pipeline
@include commands/shared/compression-patterns.yml#UltraCompressed_Mode_Rules

### Context Optimization
@include commands/shared/core.yml#Advanced_Token_Economy
@include commands/shared/token-economy.yml#Context_Optimization_Engine

### Intelligent Caching
@include commands/shared/mcp.yml#Cache_Management
@include commands/shared/token-economy.yml#MCP_Token_Economics

## Development Standards

@include commands/shared/rules.yml#Development_Standards
@include commands/shared/rules.yml#Smart_Defaults
@include commands/shared/rules.yml#Code_Generation

## Session Management

@include commands/shared/core.yml#Session_Management
@include commands/shared/rules.yml#Session_Awareness

## Emergency Protocols

### Context Overload
If context becomes too complex or unfocused:
1. Run `/context-status` to identify issues
2. Auto-activate UltraCompressed mode (--uc)
3. Simplify feature scope to core functionality
4. Reset context with `/context-engineer` for current feature
5. Focus on single, well-defined objective

### Workflow Management Issues
If workflows conflict or have issues:
1. Check `/workflow/dependencies.md` for known conflicts
2. Use automatic file movement system for organization
3. Implement conflicting features in separate branches
4. Design integration layer for feature communication
5. Update dependency mapping with resolution

### Quality Gate Failures
If validation fails repeatedly:
1. Review feature requirements & scope
2. Check for missing dependencies or setup issues
3. Use --validate flag for stricter validation
4. Consider breaking feature into smaller sub-features
5. Activate appropriate persona for specialized help

## Success Philosophy

**"One Feature, Perfect Context, Quality Implementation, Zero Manual Workflow Management"**

Every feature should be developed with:
- ✅ Complete & focused context (90%+ relevance)
- ✅ 70% token reduction through UltraCompressed mode
- ✅ Automatic workflow file management
- ✅ Clear implementation plan
- ✅ Continuous validation through quality gates
- ✅ Quality-first approach
- ✅ Comprehensive documentation
- ✅ Intelligent MCP integration when beneficial

## Performance Targets

@include commands/shared/token-economy.yml#Performance_Monitoring
@include commands/shared/compression-patterns.yml#Performance_Baselines

**Token Efficiency**: 70% reduction target
**Context Relevance**: 90%+ useful information
**Workflow Automation**: 100% automatic file management
**Quality Gates**: 95%+ pass rate
**MCP Cache Hit Rate**: 85%+ efficiency

---

*Context Engineering System v2.0 - Enterprise-class AI development assistant with advanced token economy, intelligent workflow management, and specialized domain expertise.*