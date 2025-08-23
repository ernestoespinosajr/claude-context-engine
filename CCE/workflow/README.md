# Features Directory

This directory manages the feature-driven development workflow using Context Engineering principles.

## Directory Structure

```
workflow/
├── planned/          # Features ready for implementation
├── in-progress/      # Features currently in development
├── completed/        # All completed features (successful or failed)
├── logbook.md        # Automatic project activity log and quick reference
└── dependencies.md   # Dependency mapping between features
```

## Feature Lifecycle

### 1. Planning Phase (`planned/`)
- Features start here after the analysis commands (`@ask`, `@feature`, `@quick-feature`, `@issue`)
- Contains the complete PRP (Product Requirements Prompt)
- Includes research, context, and implementation plan

### 2. Development Phase (`in-progress/`)
- Features are MOVED here during the `@start` command
- Files move from `planned/` to `in-progress/`, never duplicated
- Contains progress tracking and real-time updates within the file
- Task status and progress are managed inside the document
- Includes validation points and quality gates

### 3. Completion Phase (`completed/`)
- Features are MOVED here after implementation (successful or failed)
- Files are renamed with completion status:
  - `done-[task-name].md` for successful completions
  - `fail-[task-name].md` for failed/rejected implementations
- Each file contains final documentation, lessons learned, and completion report
- Serves as knowledge base for future similar features

## File Handling

The key point of this workflow system is that feature files are NEVER duplicated:

1. Analysis commands (`@ask`, `@feature`, `@quick-feature`, `@issue`) CREATE the file in `planned/`
2. `@start` MOVES the file from `planned/` to `in-progress/`
3. Upon completion, the file is MOVED from `in-progress/` to `completed/` with status prefix:
   - Successful: `done-[original-name].md`
   - Failed: `fail-[original-name].md`

This approach avoids synchronization problems and ensures there's always a single source of truth for each feature.

## Command Usage

### New Simplified System
- `@ask "[task description]"` - Analyze task and suggest best approach
- `@issue "[bug description]"` - Handle bugs and simple tasks (3-layer context)
- `@quick-feature "[feature description]"` - Medium features and UI/UX changes (6-layer context)
- `@feature "[feature description]"` - Complex features and system changes (11-layer context)
- `@start "[task-name]"` - Execute any planned task

### Status Checking
To check task status, simply:
- Look at file location in `workflow/` directories
- Read the task document directly for detailed progress
- Use `@ask "[task-name] status"` for analysis and recommendations

## File Naming Convention

### During Development
- `[task-name].md` - Files in `planned/` and `in-progress/`
- `issue-[bug-name].md` - Bug fixes and simple issues

### Upon Completion
- `done-[task-name].md` - Successfully completed tasks
- `fail-[task-name].md` - Failed or rejected tasks

Each completion file includes:
- Final implementation status
- Lessons learned
- Completion report with details about success/failure
- Recommendations for future similar tasks

## Best Practices

1. **One feature at a time**: Focus on implementing a single feature
2. **Status tracking**: Update progress within the task document
3. **Dependency awareness**: Check dependencies before starting
4. **Quality gates**: Each feature must pass validation before completion
5. **Completion reporting**: Document success/failure reasons and lessons learned

## Project Logbook

The `logbook.md` file serves as the central intelligence hub for the project:

### What it contains:
- **Quick Overview**: Real-time project statistics and success rates
- **In Progress Tasks**: Currently active development work
- **Recent Activity**: Latest planned, completed, and failed tasks
- **Task Categories**: Breakdown by type, domain, and complexity
- **Dependencies**: Current dependency relationships
- **Patterns & Insights**: Success/failure patterns and common challenges
- **Project Evolution**: Key milestones and architectural decisions

### Automatic Updates:
- **Planning**: New entries added when creating tasks with @issue, @quick-feature, or @feature
- **Execution**: Status updated when starting tasks with @start
- **Completion**: Final status and lessons learned logged upon completion
- **Real-time Stats**: Counters and percentages updated automatically

### Benefits:
- **Fast Context**: Claude can quickly understand project state
- **Pattern Recognition**: Identify successful approaches and avoid failed ones
- **Duplication Prevention**: See similar work before creating redundant tasks
- **Progress Tracking**: Visual progress across all project dimensions 