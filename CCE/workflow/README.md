# Features Directory

This directory manages the feature-driven development workflow using Context Engineering principles.

## Directory Structure

```
workflow/
├── 01-planned/          # Features ready for implementation
├── 02-in-progress/      # Features currently in development  
├── 03-completed/        # All completed features (successful or failed)
├── logbook.md           # Automatic project activity log and quick reference
└── dependencies.md      # Dependency mapping between features
```

## Feature Lifecycle

### 1. Planning Phase (`01-planned/`)
- Features start here after the analysis commands (`@ask`, `@feature`, `@quick-feature`, `@issue`)
- Contains the complete PRP (Product Requirements Prompt)
- Includes research, context, and implementation plan
- Files use `tsk###-[task-name].md` naming convention

### 2. Development Phase (`02-in-progress/`)
- Features are MOVED here during the `dispatch` command
- Files move from `01-planned/` to `02-in-progress/`, never duplicated
- Contains progress tracking and real-time updates within the file
- Task status and progress are managed inside the document
- Includes validation points and quality gates

### 3. Completion Phase (`03-completed/`)
- Features are MOVED here after implementation (successful or failed)
- Files are renamed with completion status suffix:
  - `tsk###-[task-name]-completed.md` for successful completions
  - `tsk###-[task-name]-failed.md` for failed/rejected implementations
- Each file contains final documentation, lessons learned, and completion report
- Serves as knowledge base for future similar features

## File Handling

The key point of this workflow system is that feature files are NEVER duplicated:

1. Analysis commands (`@ask`, `@feature`, `@quick-feature`, `@issue`) CREATE the file in `01-planned/`
2. `dispatch` MOVES the file from `01-planned/` to `02-in-progress/`
3. Upon completion, the file is MOVED from `02-in-progress/` to `03-completed/` with status suffix:
   - Successful: `tsk###-[original-name]-completed.md`
   - Failed: `tsk###-[original-name]-failed.md`

This approach avoids synchronization problems and ensures there's always a single source of truth for each feature.

## Command Usage

### New Simplified System
- `@ask "[task description]"` - Analyze task and suggest best approach (always checks logbook first)
- `@issue "[bug description]"` - Handle bugs and simple tasks (3-layer context) + registers in Task Log
- `@quick-feature "[feature description]"` - Medium features and UI/UX changes (6-layer context) + registers in Task Log
- `@feature "[feature description]"` - Complex features and system changes (11-layer context) + registers in Task Log
- `dispatch [agent] "tsk###-[task-name]"` - Execute any planned task with specialized agent and mandatory phase validation

### Status Checking
To check task status, simply:
- Check `workflow/logbook.md` Task Log section for complete overview
- Look at file location in `workflow/` directories
- Read the task document directly for detailed progress
- Use `@ask "[task-name] status"` for analysis and recommendations

### Phase Validation Process (dispatch command)

**CRITICAL**: dispatch now requires user validation at each phase:

1. **Pre-execution**: Always reads logbook.md for context and project structure
2. **Phase Completion**: After each implementation phase:
   - Presents completed work to user
   - Asks: "test", "continue", or "pause" 
   - Waits for user response
   - Updates task file with ✅ and progress summary
3. **Final Status Update**: Updates Task Log with completion status:
   - "complete without issues"
   - "complete with issues to fix" 
   - "pending"

## File Naming Convention

### During Development
- `tsk###-[task-name].md` - Files in `01-planned/` and `02-in-progress/`
- `tsk###-issue-[bug-name].md` - Bug fixes and simple issues

### Upon Completion
- `tsk###-[task-name]-completed.md` - Successfully completed tasks
- `tsk###-[task-name]-failed.md` - Failed or rejected tasks

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