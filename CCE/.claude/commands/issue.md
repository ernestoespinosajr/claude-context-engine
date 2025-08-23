# Issue Command - Bug Fixes & Small Tasks

**Purpose**: Efficiently handle bug fixes, small improvements, and maintenance tasks using lightweight 3-layer context approach.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Fix][Issue] in $ARGUMENTS"

Streamlined approach for bug fixes and small tasks that don't require full context engineering architecture.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@issue "fix login button not responding on iOS"` - Platform-specific bug fix
- `@issue "correct typo in error message"` - Simple text fix
- `@issue "update dependency version for security patch"` - Maintenance task
- `@issue "fix memory leak in image loading"` - Performance bug fix

## Lightweight Context Architecture (3-Layer)

### Layer 1: Problem Context
**Focus**: Clear problem identification and current state
- **Issue Description**: What specifically is broken or needs fixing
- **Current Behavior**: How the system currently behaves (incorrectly)
- **Expected Behavior**: How the system should behave
- **Error Analysis**: Error messages, logs, or symptoms
- **Reproduction Steps**: How to consistently reproduce the issue

### Layer 2: Solution Context  
**Focus**: Root cause analysis and solution approach
- **Root Cause**: What is actually causing the problem
- **Impact Analysis**: What parts of the system are affected
- **Solution Strategy**: High-level approach to fixing the issue
- **Risk Assessment**: What could go wrong with the fix
- **Alternative Solutions**: Other ways to address the problem

### Layer 3: Implementation Context
**Focus**: Practical implementation and verification
- **Implementation Steps**: Step-by-step fix procedure
- **Testing Strategy**: How to verify the fix works
- **Rollback Plan**: How to undo changes if something goes wrong
- **Documentation**: What needs to be updated after the fix

## Process

### 1. Issue Analysis & Triage
- **Problem Identification**: Clearly understand what needs to be fixed
- **Scope Assessment**: Ensure this is truly a simple issue (not a hidden complex feature)
- **Impact Evaluation**: Understand who and what is affected
- **Urgency Classification**: Critical, High, Medium, or Low priority

### 2. Root Cause Investigation
- **Symptom Analysis**: Look beyond surface symptoms to find root cause
- **Code Investigation**: Examine relevant code sections for the actual problem
- **Dependency Check**: Verify if external dependencies are involved
- **Historical Context**: Check if this issue has occurred before

### 3. Solution Development
- **Minimal Viable Fix**: Identify the smallest change that resolves the issue
- **Side Effect Analysis**: Ensure the fix doesn't break other functionality
- **Testing Strategy**: Plan how to verify the fix works correctly
- **Documentation Updates**: Identify any docs that need updating

### 4. Implementation & Verification
- **Code Changes**: Implement the minimal fix
- **Local Testing**: Verify fix works in development environment
- **Regression Testing**: Ensure no existing functionality is broken
- **Documentation**: Update relevant documentation

## Issue Classification

### Critical Issues (Immediate Fix Required)
- Security vulnerabilities
- System crashes or complete failures
- Data loss or corruption
- Payment or authentication failures

### High Priority Issues
- Major functionality broken for significant user base
- Performance degradation affecting user experience
- Integration failures with critical systems

### Medium Priority Issues  
- Minor functionality issues affecting some users
- UI/UX problems that don't prevent core functionality
- Non-critical performance issues

### Low Priority Issues
- Cosmetic issues
- Nice-to-have improvements
- Documentation updates
- Code cleanup tasks

## File Handling

### Issue Documentation
Create lightweight issue file in `workflow/planned/issue-[name].md`:

```markdown
# Issue: [Issue Name]

## Problem Summary
[Brief description of the issue]

## Current vs Expected Behavior
- **Current**: [What happens now]
- **Expected**: [What should happen]

## Root Cause
[What is actually causing the problem]

## Solution Approach
[How we plan to fix it]

## Implementation Steps
1. [Step 1]
2. [Step 2]
3. [Step 3]

## Testing Plan
- [How to verify the fix works]
- [What regression tests to run]

## Risk Assessment
- **Risk Level**: [Low | Medium | High]
- **Potential Issues**: [What could go wrong]
- **Rollback Plan**: [How to undo if needed]

## Success Criteria
- [ ] Issue is resolved
- [ ] No regression in existing functionality
- [ ] Appropriate tests added/updated
- [ ] Documentation updated if needed
```

### Workflow Integration
- **Planning**: Issue files start in `workflow/planned/`
- **Execution**: Move to `workflow/in-progress/` during @start
- **Completion**: Move to `workflow/completed/` with status prefix when done
- **Naming**: `issue-[descriptive-name].md` format

## Quality Gates

### Level 1: Fix Validation
- Issue is actually resolved
- Fix doesn't introduce new bugs
- Code follows project conventions
- Change is minimal and focused

### Level 2: Integration Check
- No regression in existing functionality
- Integration tests still pass
- No new error messages or warnings
- Performance hasn't degraded

### Level 3: Documentation & Cleanup
- Relevant documentation updated
- Code comments added where needed
- Temporary debug code removed
- Issue tracking updated

## Best Practices

### Keep It Simple
- **Minimal Changes**: Make the smallest change that fixes the issue
- **Single Focus**: Address only the specific issue, don't add unrelated improvements
- **Clear Commit Messages**: Explain what was fixed and why
- **Test-Driven**: Write tests that reproduce the issue, then fix until tests pass

### Safety First
- **Backup Critical Data**: Before making changes that could affect data
- **Feature Flags**: Use feature flags for fixes that might need quick rollback
- **Incremental Deployment**: Deploy fixes gradually when possible
- **Monitor Post-Fix**: Watch metrics and logs after deploying fixes

### Communication
- **Clear Documentation**: Explain what was wrong and how it was fixed
- **Stakeholder Updates**: Notify relevant team members of critical fixes
- **User Communication**: Inform users when fixes address issues they reported

## Integration with Other Commands

### Escalation Path
If during issue investigation you discover it's actually more complex:
- **Promote to Quick Feature**: `@ask "re-evaluate as quick-feature"`
- **Promote to Full Feature**: `@ask "re-evaluate as complex feature"`
- **Split into Multiple Issues**: Break down into smaller, manageable pieces

### Dependencies
- Issues can depend on other issues or features
- Track dependencies in `workflow/dependencies.md`
- Block issue execution if dependencies aren't resolved

## Output Requirements

Every @issue response MUST include:

```markdown
# 🔧 Issue Analysis: [Issue Name]

## Problem Summary
[Clear, concise problem description]

## Root Cause  
[What's actually causing the issue]

## Solution Strategy
[How we're going to fix it]

## Implementation Plan
[Step-by-step fix approach]

## Risk Assessment
[What could go wrong and mitigation]

## Success Criteria
[How we'll know it's fixed]
```

## Automatic Logbook Updates

When creating an issue plan, automatically add entry to `workflow/logbook.md`:

```markdown
## Recently Planned (Last 10)
- **issue-[name]** | [Brief description] | Created: [date] | Type: Issue | Complexity: [1-10]
```

Update logbook sections:
- Increment "Planned" count in Quick Overview
- Add to "By Type" → Issues/Bugs counter
- Add to appropriate complexity range
- Update "Last Activity" timestamp

## User Feedback Requirements

At the beginning of EVERY response, include:
1. Confirmation that this is being treated as a simple issue
2. Brief description of the problem understood
3. Estimated complexity and time to fix
4. Any concerns about the issue being more complex than it appears
5. Clear next steps for resolution

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates