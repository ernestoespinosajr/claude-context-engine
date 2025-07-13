# Feature Templates

This directory contains templates for different types of features, organized by programming language and framework.

## Template Structure

```
templates/
├── javascript/
│   ├── react-native/
│   ├── react/
│   ├── nextjs/
│   └── node/
├── python/
│   ├── django/
│   ├── fastapi/
│   └── flask/
├── rust/
│   ├── tauri/
│   └── axum/
├── go/
│   └── gin/
└── universal/         # Language-agnostic templates
```

## Template Types

### Universal Templates
- `project-init.md` - Project initialization for any language
- `auth-system.md` - Authentication patterns
- `database-integration.md` - Database setup patterns
- `api-integration.md` - External API integration
- `testing-setup.md` - Testing framework setup

### Language-Specific Templates
Each language directory contains templates optimized for that ecosystem:
- Framework-specific boilerplate
- Language conventions and patterns
- Ecosystem-specific dependencies
- Testing frameworks and validation

## Template Format

Each template follows the Feature PRP structure:

```markdown
# Feature Template: [Type]
## Applicability
## Context Engineering Layers
## Implementation Blueprint
## Validation Gates
## Common Patterns
## Gotchas & Best Practices
```

## Usage

Templates are automatically selected by `/context-engineer` based on:
1. Project language detection (package.json, requirements.txt, etc.)
2. Framework detection (dependencies, config files)
3. Feature type classification
4. User preferences and project patterns 