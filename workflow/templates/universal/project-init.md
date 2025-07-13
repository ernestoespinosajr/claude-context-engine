# Feature Template: Project Initialization

## Applicability
- **Use when**: Starting a new project from scratch
- **Languages**: Any programming language
- **Scope**: Complete project setup including structure, dependencies, and basic configuration

## Context Engineering Layers

### Layer 1: System Instructions
- You are a project initialization specialist
- Follow language-specific best practices and conventions
- Create clean, maintainable, and scalable project structure
- Ensure proper tooling and development environment setup

### Layer 2: Project Information
- **Language**: [Auto-detected or user-specified]
- **Framework**: [Based on user requirements]
- **Project Type**: [Web app, mobile app, API, desktop app, etc.]
- **Target Platform**: [Web, iOS/Android, Desktop, Server]

### Layer 3: Knowledge Base Context
- Language-specific project structure conventions
- Framework documentation and setup guides
- Best practices for dependency management
- Development tooling recommendations

### Layer 4: Goal State Context
- **Primary Goal**: Functional project foundation ready for feature development
- **Success Criteria**: Project builds, runs, and passes initial health checks
- **Dependencies**: None (this is the foundation feature)

## Implementation Blueprint

### Phase 1: Project Structure Creation
```
project-root/
├── src/                 # Source code
├── tests/              # Test files
├── docs/               # Documentation
├── scripts/            # Build and utility scripts
├── config/             # Configuration files
└── [language-specific files]
```

### Phase 2: Dependency Management
- Initialize package manager (npm, pip, cargo, go mod, etc.)
- Add essential dependencies for the chosen framework
- Set up development dependencies (linting, testing, building)

### Phase 3: Development Environment
- Configure code formatting and linting
- Set up testing framework
- Create build scripts and development server
- Initialize version control (git)

### Phase 4: Basic Application Structure
- Create main application entry point
- Set up basic routing/navigation (if applicable)
- Create initial components/modules
- Add basic error handling

## Validation Gates

### Level 1: Structure Validation
```bash
# Verify directory structure exists
ls -la src/ tests/ docs/ scripts/ config/

# Check package manager initialization
[language-specific: npm ls, pip list, cargo check, go mod verify]
```

### Level 2: Dependency Validation
```bash
# Install dependencies without errors
[language-specific install command]

# Verify no dependency conflicts
[language-specific dependency check]
```

### Level 3: Build & Run Validation
```bash
# Project builds successfully
[language-specific build command]

# Development server starts
[language-specific dev server command]

# Basic health check endpoint/function works
[language-specific test command]
```

### Level 4: Code Quality Validation
```bash
# Linting passes
[language-specific linter]

# Code formatting is consistent
[language-specific formatter]

# Initial tests pass
[language-specific test runner]
```

## Common Patterns

### React Native Projects
```typescript
// App.tsx - Main application component
// src/components/ - Reusable UI components
// src/screens/ - Screen components
// src/navigation/ - Navigation setup
// src/services/ - API and external services
// src/utils/ - Utility functions
// src/types/ - TypeScript type definitions
```

### Python API Projects
```python
# main.py - Application entry point
# src/api/ - API route handlers
# src/models/ - Data models
# src/services/ - Business logic
# src/utils/ - Helper functions
# tests/ - Test files
# requirements.txt - Dependencies
```

### Node.js Projects
```javascript
// index.js - Entry point
// src/routes/ - Express routes
// src/middleware/ - Custom middleware
// src/controllers/ - Request handlers
// src/models/ - Data models
// src/utils/ - Utility functions
// package.json - Dependencies and scripts
```

## Gotchas & Best Practices

### General Best Practices
- **Consistent naming**: Use consistent naming conventions throughout
- **Environment separation**: Separate development, staging, and production configs
- **Error handling**: Set up global error handling early
- **Logging**: Configure proper logging from the start
- **Security**: Enable basic security measures (CORS, rate limiting, etc.)

### Common Gotchas
- **Port conflicts**: Check for port availability before setting defaults
- **Environment variables**: Create .env.example with all required variables
- **Cross-platform compatibility**: Ensure scripts work on Windows, macOS, and Linux
- **Version compatibility**: Pin dependency versions to avoid future conflicts
- **Hot reloading**: Configure development server for optimal developer experience

### Quality Gates
- **Code coverage**: Set up code coverage reporting
- **Pre-commit hooks**: Configure git hooks for code quality
- **Documentation**: Include README with setup and development instructions
- **CI/CD ready**: Structure project for easy continuous integration setup

## Success Indicators
- [ ] Project structure follows language/framework conventions
- [ ] All dependencies install without conflicts
- [ ] Development server starts and responds correctly
- [ ] Linting and formatting are configured and passing
- [ ] Basic tests are set up and passing
- [ ] Documentation includes clear setup instructions
- [ ] Git repository is initialized with proper .gitignore
- [ ] Environment configuration is properly templated 