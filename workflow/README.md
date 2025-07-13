# Features Directory

This directory manages the feature-driven development workflow using Context Engineering principles.

## Directory Structure

```
features/
├── planned/          # Features ready to be implemented
├── in-progress/      # Currently being developed
├── completed/        # Successfully implemented features
├── templates/        # Feature templates by type
└── dependencies.md   # Feature dependency mapping
```

## Feature Lifecycle

### 1. Planning Phase (`/planned/`)
- Features start here after `/context-engineer` command
- Contains complete Feature PRP (Product Requirements Prompt)
- Includes research, context, and implementation plan

### 2. Development Phase (`/in-progress/`)
- Features move here during `/execute-context` command
- Contains progress tracking and real-time updates
- Includes validation checkpoints and quality gates

### 3. Completion Phase (`/completed/`)
- Features move here after successful implementation
- Contains final documentation and lessons learned
- Serves as knowledge base for future similar features

## Feature PRP Structure

Each feature follows this standard structure:

```markdown
# Feature: [Name]
## Goal & Context
## Research Findings
## 11-Layer Context Architecture
## Implementation Blueprint
## Validation Gates
## Dependencies
## Quality Score (1-10)
```

## Usage Commands

- `/context-engineer "[feature description]"` - Create new feature plan
- `/execute-context [feature-name]` - Implement planned feature
- `/context-status [feature-name]` - Check feature status and health

## Best Practices

1. **One Feature at a Time**: Focus on single feature implementation
2. **Context Isolation**: Each feature has its own complete context
3. **Dependency Awareness**: Check dependencies before starting
4. **Quality Gates**: Each feature must pass validation before completion
5. **Documentation**: Always update feature status and learnings 