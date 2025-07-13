# Commands Reference - Context Engineering System v2.0

## Overview
This system uses **feature-driven development** with **advanced context engineering** and **intelligent token economy** to optimize AI-assisted development across any programming language or framework.

## ✨ New in v2.0
- **70% Token Reduction** with UltraCompressed mode (--uc)
- **Automatic Workflow Management** (no manual file movement)
- **Specialized Personas** for domain expertise
- **Advanced MCP Integration** with intelligent caching
- **Universal Glossary** for symbol comprehension

## Core Commands

### `/context-engineer "[feature description]"`
**Purpose**: Analyze and create comprehensive feature implementation plans

**What it does**:
- Detects project language, framework, and structure
- Builds 11-layer context architecture focused on the feature
- Creates detailed Product Requirements Prompt (PRP)
- Identifies dependencies and potential conflicts
- Generates implementation blueprint with validation gates

**Usage Examples**:
```bash
# New project setup
/context-engineer "Set up React Native project with TypeScript"

# Feature addition
/context-engineer "Add user authentication with JWT tokens"

# Performance optimization
/context-engineer "Implement lazy loading for better performance"

# Database integration
/context-engineer "Add PostgreSQL database with user management"
```

**Output**:
- Creates feature PRP in `/features/planned/[feature-name].md`
- Updates dependency mapping in `/features/dependencies.md`
- Provides implementation readiness assessment

---

### `/execute-context [feature-name]`
**Purpose**: Implement planned features with focused context and validation

**What it does**:
- Loads feature PRP and builds optimized context
- Implements feature in isolated development scope
- Runs continuous validation through quality gates
- Tracks progress and documents implementation decisions
- Ensures no interference with unrelated code

**Usage Examples**:
```bash
# Implement a planned feature
/execute-context user-authentication

# Continue implementation of project setup
/execute-context project-setup

# Execute database integration
/execute-context database-integration
```

**Output**:
- Implements feature code with isolated scope
- Moves feature to `/features/completed/` upon success
- Creates comprehensive implementation report
- Updates project status and metrics

---

### `/context-status [feature-name]`
**Purpose**: Monitor feature health, dependencies, and project status

**What it does**:
- Analyzes feature health and implementation progress
- Checks context quality and optimization opportunities
- Monitors dependency status and conflicts
- Provides actionable insights and recommendations
- Tracks performance metrics and quality gates

**Usage Examples**:
```bash
# Check specific feature status
/context-status user-authentication

# Check overall project health
/context-status

# Monitor specific feature dependencies
/context-status database-integration
```

**Output**:
- Detailed health report with metrics
- Actionable recommendations for improvement
- Context optimization suggestions
- Dependency analysis and conflict detection

## Command Workflow

### Typical Development Flow
```
1. /context-engineer "feature description"
   ↓ (Creates comprehensive plan)
   
2. /execute-context feature-name
   ↓ (Implements with quality gates)
   
3. /context-status feature-name
   ↓ (Monitors and optimizes)
   
4. Repeat for next feature
```

### Advanced Usage Patterns

#### New Project Development
```bash
# Step 1: Initialize project
/context-engineer "Set up [language] project with [framework]"
/execute-context project-setup

# Step 2: Add core features
/context-engineer "Add basic navigation and routing"
/execute-context navigation-setup

# Step 3: Build specific features
/context-engineer "Add user authentication system"
/execute-context user-authentication

# Step 4: Monitor and optimize
/context-status  # Check overall project health
```

#### Existing Project Enhancement
```bash
# Step 1: Analyze and plan new feature
/context-engineer "Add real-time notifications system"

# Step 2: Check dependencies
/context-status notifications-system

# Step 3: Implement when ready
/execute-context notifications-system

# Step 4: Monitor integration
/context-status  # Verify no regressions
```

## Context Engineering Features

### 11-Layer Architecture
Each command uses a sophisticated context management system:

1. **System Instructions** - Core behavior and principles
2. **Goals** - Feature objectives and success criteria
3. **Constraints** - Technical limitations and requirements
4. **Historical Context** - Past implementations and lessons learned
5. **External Context** - APIs, documentation, and dependencies
6. **Domain Knowledge** - Language and framework expertise
7. **Project Context** - Current project structure and patterns
8. **Feature Context** - Related features and integration points
9. **Session Context** - Current development state
10. **Immediate Context** - Current focus and active work
11. **User Query** - Current request and specific requirements

### Feature Isolation
- **Focused Development**: Only work on files related to current feature
- **Dependency Awareness**: Understand and respect feature relationships
- **Clean Integration**: Minimize impact on existing code
- **Quality Assurance**: Continuous validation throughout development

### Language Agnostic
The system automatically adapts to any programming language:
- **JavaScript/TypeScript**: React Native, Next.js, Node.js
- **Python**: Django, FastAPI, Flask
- **Rust**: Tauri, Axum
- **Go**: Gin, Echo
- **Java**: Spring Boot
- **C#**: .NET Core
- **Swift**: iOS Development
- **Kotlin**: Android Development
- **And many more...**

## Quality Gates

### Level 1: Syntax & Structure
- Code compiles without errors
- Follows language conventions
- Proper file structure
- Dependencies resolved

### Level 2: Integration
- Integrates with existing codebase
- API contracts maintained
- Data flow validated
- No regression issues

### Level 3: Functional
- All requirements implemented
- Edge cases handled
- Error handling robust
- User experience meets standards

### Level 4: Performance & Quality
- Performance targets met
- Security requirements satisfied
- Code coverage >90%
- Documentation complete

## Best Practices

### Command Usage
1. **One Feature at a Time**: Focus on single feature implementation
2. **Complete Planning**: Use `/context-engineer` for thorough analysis
3. **Monitor Progress**: Regular `/context-status` checks
4. **Quality Focus**: Ensure all validation gates pass

### Development Workflow
1. **Plan First**: Always start with `/context-engineer`
2. **Check Dependencies**: Verify prerequisites are met
3. **Implement Focused**: Use `/execute-context` for isolated development
4. **Validate Continuously**: Monitor quality gates throughout
5. **Document Everything**: Maintain comprehensive feature documentation

### Context Optimization
1. **Keep Context Relevant**: Aim for >90% relevance score
2. **Minimize Noise**: Keep irrelevant information <10%
3. **Optimize Density**: Maximize useful information per token
4. **Regular Cleanup**: Periodically optimize context layers

## Error Handling

### Common Issues
- **Context Overload**: Too much irrelevant information
- **Dependency Conflicts**: Circular or conflicting dependencies
- **Validation Failures**: Quality gates not passing
- **Integration Problems**: Feature conflicts with existing code

### Recovery Strategies
- **Simplify Scope**: Break complex features into smaller parts
- **Reset Context**: Regenerate context with `/context-engineer`
- **Check Dependencies**: Verify all prerequisites are met
- **Incremental Implementation**: Implement in smaller, testable chunks

## Support

### Getting Help
- Review this commands reference for usage patterns
- Check `/features/` directory for examples and templates
- Use `/context-status` for diagnostic information
- Refer to quality gates for validation requirements

### Troubleshooting
1. **Feature Not Implementing**: Check dependencies and validation gates
2. **Context Issues**: Use `/context-status` for optimization suggestions
3. **Quality Problems**: Review implementation against quality gates
4. **Performance Issues**: Monitor context metrics and optimization opportunities

## Advanced Features

### Custom Templates
Create custom templates in `/features/templates/` for:
- Specific project patterns
- Organization-specific conventions
- Industry-specific requirements
- Custom validation rules

### Dependency Management
Automatic tracking of:
- Feature prerequisites
- Conflicting implementations
- Integration requirements
- Implementation order optimization

### Performance Monitoring
Continuous tracking of:
- Context quality metrics
- Implementation time
- Code quality scores
- System performance impact

---

*This system is designed to scale with your project and adapt to any development environment while maintaining high quality standards and optimal AI performance.*
