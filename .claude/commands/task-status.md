# Task Status Command

## Purpose
Get complete project status and next task information when resuming work.

## Usage
Use this command at the beginning of every work session to get context.

## What This Command Does

### 1. Load Project Context
- Read `./project-docs/PRD.md` for project overview
- Read `./claude_tasks.md` for current task status  
- Read `./claude_self_improve.md` for previous learnings
- Search openmemory for project context

### 2. Analyze Current State
- Identify current development phase (Phase 1 or Phase 2)
- Determine completed tasks and progress percentage
- Find current active task (if any)
- Identify next priority task based on dependencies

### 3. Provide Status Summary
Present information in this format:

```
## 📊 PROJECT STATUS SUMMARY

**Project**: [Project Name from PRD]
**Current Phase**: Phase [1/2] - [Frontend/Backend]
**Overall Progress**: [X]% ([completed]/[total] tasks)
**Last Session**: [Date of last activity]

### 🎯 CURRENT STATUS
**Active Task**: [Current task name and ID]
**Progress**: [Percentage]% - [Current subtask or status]
**Time Invested**: [Hours] / [Estimated hours]

### 📋 COMPLETED RECENTLY
- ✅ [Recently completed task 1]
- ✅ [Recently completed task 2]

### 🚀 NEXT PRIORITY TASK
**Task**: [Next task name and ID]
**Description**: [Brief description]
**Estimated Time**: [Hours]
**Dependencies**: [Any prerequisites]
**Ready to Start**: [YES/NO with reason if NO]

### 🚨 BLOCKERS & NOTES
[Any current blockers or important notes]

### 💡 RECOMMENDATIONS
[Specific recommendations for next steps]
```

### 4. Action Recommendations
- If no active task: Recommend specific task to start
- If task in progress: Provide resumption guidance
- If blocked: Suggest alternative tasks or solutions
- Always end with clear next action

## Integration with Memory
- Store session start time and context
- Update project status in memory
- Track session-to-session continuity

## Error Handling
- If claude_tasks.md doesn't exist: Recommend running `/parse-prd`
- If PRD.md is missing: Request completion of project documentation
- If no clear next task: Analyze dependencies and suggest options 