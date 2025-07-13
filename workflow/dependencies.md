# Workflow Dependencies & Management
# Context Engineering System v2.0 - Intelligent Workflow Tracking

This file tracks dependencies between workflows to ensure proper implementation order and automatic file management.

## Automatic Workflow Management

### Workflow States & Auto-Movement
- **planned/**: AI-generated workflow plans (created by `/context-engineer`)
- **in-progress/active/**: Currently being worked on (moved by `/execute-context`)
- **in-progress/paused/**: Temporarily paused workflows
- **completed/successful/**: Successfully completed workflows
- **completed/archived/**: Older completed workflows

### Dependency Rules

1. **Core Workflows**: Independent workflows that can be implemented first
2. **Dependent Workflows**: Workflows that require other workflows to be completed
3. **Conflicting Workflows**: Workflows that cannot coexist or need coordination
4. **Auto Management**: AI automatically moves files between directories based on status

## Current Dependencies

*Updated automatically by `/context-engineer` and `/context-status`*

### Core Features (No Dependencies)
- `project-init` - Project initialization and basic structure
- `basic-ui` - Core UI components and styling
- `navigation-setup` - Basic navigation structure

### Authentication Chain
- `basic-auth` (depends on: project-init)
  - `biometric-auth` (depends on: basic-auth)
  - `social-auth` (depends on: basic-auth)
  - `two-factor-auth` (depends on: basic-auth)

### Data Management Chain
- `local-storage` (depends on: project-init)
  - `database-integration` (depends on: local-storage)
  - `offline-sync` (depends on: database-integration)

### UI Enhancement Chain
- `theme-system` (depends on: basic-ui)
  - `dark-mode` (depends on: theme-system)
  - `accessibility` (depends on: theme-system)

## Conflict Detection

### Known Conflicts
- `redux-state` vs `zustand-state` - Choose one state management solution
- `expo-router` vs `react-navigation` - Choose one navigation solution

## Auto-Generated Sections

*The following sections are automatically maintained by the system*

### Recently Completed
<!-- Auto-updated by /execute-context -->

### Currently Blocked
<!-- Auto-updated by /context-status -->

### Ready to Implement
<!-- Auto-updated by /context-engineer -->

## Manual Override

To manually override dependency detection:

```yaml
feature: "custom-feature"
dependencies: ["required-feature-1", "required-feature-2"]
conflicts: ["conflicting-feature"]
override: true
reason: "Special business logic requires this dependency structure"
``` 