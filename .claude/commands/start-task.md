# Start Task Command - Integrated Development Workflow

## Purpose
Main command for the complete development cycle. Integrates task selection, implementation, progress tracking, and completion into one cohesive flow.

## Usage
Use this as your primary development command. It handles the entire workflow automatically.

## Integrated Workflow

### Phase 1: Task Selection & Preparation
1. **Analyze Available Tasks**
   - Check `./claude_tasks.md` for ready tasks
   - Verify dependencies are completed
   - Ensure phase compliance (Phase 1 vs Phase 2)
   - Select optimal next task based on priority and logic

2. **Task Setup**
   - Load complete task context and requirements
   - Review acceptance criteria and deliverables
   - Identify files that will need modification
   - Present implementation plan to user

### Phase 2: Implementation with Checkpoints
3. **Begin Implementation**
   - Start working on the selected task
   - Break work into logical checkpoints (every 30-60 minutes)
   - Document progress in real-time

4. **Checkpoint Validations** ⏸️
   - **Pause regularly** for user validation
   - Present current progress and next steps
   - Ask user: "Ready to continue to [next step]? Or do you want to review/modify?"
   - Allow user to provide feedback or change direction

### Phase 3: Task Completion & Transition
5. **Completion Check** ✅
   - When implementation is complete, ask user:
   - "Task appears complete. Would you like me to mark it as done and move to completion documentation?"
   - Wait for explicit user confirmation

6. **Automatic Task Completion** 📝
   - Document all deliverables and files modified
   - Update `./claude_tasks.md` with completion status
   - Record learnings in `./claude_self_improve.md`
   - Store progress in memory

7. **Next Task Suggestion** 🔄
   - Analyze remaining tasks
   - Recommend specific next task with reasoning
   - Ask: "Ready to start the next task, or do you want to take a break?"

## User Interaction Points

### Required User Confirmations
- **Start confirmation**: "Ready to begin [Task Name]?"
- **Checkpoint confirmations**: "Continue to [next step]?" (every major milestone)
- **Completion confirmation**: "Mark task as complete and document?"
- **Next task confirmation**: "Start next task now?"

### Optional User Inputs
- **Direction changes**: User can redirect implementation approach
- **Priority changes**: User can request different task
- **Break requests**: User can pause workflow at any checkpoint

## Implementation Guidelines

### Phase 1 (Frontend) Enforcement
- ONLY dummy/mock data allowed
- NO backend connections
- UI must be fully functional with test data
- Progress only continues if phase compliance maintained

### Phase 2 (Backend) Prerequisites
- Phase 1 must be 100% complete and verified
- Replace dummy data systematically
- Maintain UI functionality during integration

### Progress Documentation
Update `./claude_tasks.md` continuously:
```markdown
## 🔄 [Task Name] - IN PROGRESS
**Started**: [Timestamp]
**Progress**: [Percentage]% - [Current checkpoint]
**Files Modified**: [List of files]
**Next Checkpoint**: [What's coming next]
```

### Completion Documentation
```markdown
## ✅ [Task Name] - COMPLETED
**Completed**: [Timestamp]
**Time Invested**: [Actual hours]
**Deliverables**:
- [File 1]: [Description of changes]
- [File 2]: [Description of changes]
**Key Achievements**: [Major accomplishments]
**Learnings**: [Patterns discovered]
```

## Error Handling
- If no tasks available: Recommend dependency resolution or task creation
- If Phase 2 attempted before Phase 1 complete: Block and explain
- If critical files missing: Provide setup instructions
- If user disagrees with approach: Adapt and continue

## Memory Integration
- Store task start time and approach
- Track implementation decisions
- Record user preferences and feedback patterns
- Update project context continuously

## Success Criteria
- Task completed with all acceptance criteria met
- Documentation updated accurately
- Next steps clearly identified
- User satisfied with progress and ready to continue
