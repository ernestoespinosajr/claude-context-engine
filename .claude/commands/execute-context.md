# Execute Context Command

## Purpose
Implement planned features using focused context engineering with continuous validation and isolated development.

## Usage
```
/execute-context [feature-name]
```

## Process

### 1. Context Loading & Validation
- **Load Feature PRP**: Import complete feature plan from `/features/planned/[feature-name].md`
- **Validate Dependencies**: Ensure all prerequisite features are completed
- **Build Context Stack**: Construct 11-layer context architecture focused on current feature
- **Context Optimization**: Optimize context density and relevance for implementation

### 2. Pre-Implementation Setup
- **Environment Preparation**: Set up development environment and dependencies
- **Feature Isolation**: Create isolated development scope to prevent interference
- **Validation Framework**: Initialize continuous validation and quality gates
- **Progress Tracking**: Set up real-time progress monitoring

### 3. Implementation Execution

#### Phase 1: Foundation Setup
**Objective**: Establish feature foundation and dependencies
**Process**:
1. **Context Focus**: Load Layer 7 (Project Context) and Layer 6 (Domain Knowledge)
2. **Dependency Installation**: Install required packages and dependencies
3. **File Structure**: Create necessary directories and files
4. **Base Configuration**: Set up configuration files and constants

**Validation Gates**:
- [ ] All dependencies installed without conflicts
- [ ] File structure follows project conventions
- [ ] Base configuration is valid and accessible
- [ ] No breaking changes to existing code

#### Phase 2: Core Implementation
**Objective**: Implement main feature functionality
**Process**:
1. **Context Focus**: Load Layer 10 (Immediate Context) and Layer 8 (Feature Context)
2. **Core Logic**: Implement main feature algorithms and business logic
3. **Component Creation**: Build UI components, services, or modules
4. **Integration Points**: Connect feature with existing system components

**Validation Gates**:
- [ ] Core functionality works as specified
- [ ] Components render/execute correctly
- [ ] Integration points are functional
- [ ] No regression in existing features

#### Phase 3: Integration & Testing
**Objective**: Ensure feature integrates properly with existing system
**Process**:
1. **Context Focus**: Load Layer 8 (Feature Context) and Layer 7 (Project Context)
2. **Integration Testing**: Test feature with existing system components
3. **End-to-End Testing**: Validate complete user workflows
4. **Performance Testing**: Ensure feature meets performance requirements

**Validation Gates**:
- [ ] Integration tests pass
- [ ] End-to-end workflows function correctly
- [ ] Performance benchmarks are met
- [ ] No memory leaks or resource issues

#### Phase 4: Optimization & Documentation
**Objective**: Optimize performance and document implementation
**Process**:
1. **Context Focus**: Load Layer 4 (Historical Context) and Layer 6 (Domain Knowledge)
2. **Performance Optimization**: Optimize code for better performance
3. **Documentation**: Create comprehensive documentation
4. **Code Review**: Conduct thorough code review and cleanup

**Validation Gates**:
- [ ] Performance optimizations implemented
- [ ] Code coverage meets requirements (>90%)
- [ ] Documentation is complete and accurate
- [ ] Code quality standards are met

### 4. Feature Isolation Strategy

#### Scope Boundaries
```
Feature Scope:
├── Included:
│   ├── Feature-specific files and components
│   ├── Direct dependencies and utilities
│   ├── Integration interfaces
│   └── Feature-related tests and documentation
└── Excluded:
    ├── Unrelated project files
    ├── Other feature implementations
    ├── Global configuration (unless specifically needed)
    └── Legacy code not related to current feature
```

#### Development Constraints
- **File Modification**: Only modify files directly related to current feature
- **Dependency Management**: Add dependencies only if required for current feature
- **API Changes**: Minimize changes to existing APIs; prefer extension over modification
- **Testing**: Focus testing on feature functionality and integration points

### 5. Continuous Validation

#### Real-Time Validation
- **Syntax Validation**: Continuous syntax checking during development
- **Build Validation**: Ensure project builds successfully after each change
- **Test Validation**: Run relevant tests automatically
- **Integration Validation**: Check integration points remain functional

#### Quality Gates Monitoring
```
Level 1: Syntax & Structure
├── Code compiles without errors ✓
├── Follows language conventions ✓
├── Proper file structure ✓
└── Dependencies resolved ✓

Level 2: Integration
├── Integrates with existing codebase ✓
├── API contracts maintained ✓
├── Data flow validated ✓
└── No regression issues ✓

Level 3: Functional
├── All requirements implemented ✓
├── Edge cases handled ✓
├── Error handling robust ✓
└── User experience meets standards ✓

Level 4: Performance & Quality
├── Performance targets met ✓
├── Security requirements satisfied ✓
├── Code coverage >90% ✓
└── Documentation complete ✓
```

### 6. Context Management During Implementation

#### Dynamic Context Updates
- **Session Context**: Update with current progress and active files
- **Immediate Context**: Focus on current implementation phase
- **Feature Context**: Maintain awareness of related features and dependencies
- **Project Context**: Keep project-wide impacts in consideration

#### Context Optimization
- **Relevance Scoring**: Continuously score context relevance (target >90%)
- **Density Optimization**: Maximize useful information per context token
- **Noise Reduction**: Filter out irrelevant information (<10% noise)
- **Context Refresh**: Update context as implementation progresses

### 7. Progress Tracking & Documentation

#### Real-Time Progress Updates
```markdown
# Feature: [FEATURE_NAME] - Implementation Progress

## Current Phase: [CURRENT_PHASE]
**Progress**: [PROGRESS_PERCENTAGE]%
**Status**: [IN_PROGRESS/BLOCKED/COMPLETED]

## Completed Tasks
- [x] [COMPLETED_TASK_1]
- [x] [COMPLETED_TASK_2]
- [x] [COMPLETED_TASK_3]

## Current Tasks
- [ ] [CURRENT_TASK_1] (In Progress)
- [ ] [CURRENT_TASK_2] (Blocked: [REASON])
- [ ] [CURRENT_TASK_3] (Pending)

## Next Steps
1. [NEXT_STEP_1]
2. [NEXT_STEP_2]
3. [NEXT_STEP_3]

## Validation Status
- Level 1: ✓ Passed
- Level 2: ✓ Passed
- Level 3: ⏳ In Progress
- Level 4: ⏸️ Pending

## Context Quality
- Relevance: [RELEVANCE_SCORE]%
- Density: [DENSITY_SCORE]%
- Efficiency: [EFFICIENCY_SCORE]%

## Implementation Decisions
- [DECISION_1]: [RATIONALE]
- [DECISION_2]: [RATIONALE]
- [DECISION_3]: [RATIONALE]

## Issues & Resolutions
- [ISSUE_1]: [RESOLUTION]
- [ISSUE_2]: [RESOLUTION]

---
*Last Updated: [TIMESTAMP]*
*Context Quality Score: [CONTEXT_QUALITY_SCORE]*
```

### 8. Feature Completion

#### Completion Criteria
- [ ] All quality gates passed
- [ ] Feature fully functional
- [ ] Integration tests passing
- [ ] Performance benchmarks met
- [ ] Documentation complete
- [ ] Code review completed

#### Completion Actions
1. **Move Feature**: Transfer from `/features/in-progress/` to `/features/completed/`
2. **Update Dependencies**: Mark feature as completed in dependency mapping
3. **Create Completion Report**: Generate final implementation report
4. **Update Project Status**: Update overall project health status

#### Completion Report Template
```markdown
# Feature Completion Report: [FEATURE_NAME]

## Summary
**Feature**: [FEATURE_NAME]
**Implementation Time**: [DURATION]
**Complexity Score**: [COMPLEXITY_SCORE]/10
**Quality Score**: [QUALITY_SCORE]/10

## Implementation Metrics
- **Lines of Code**: [LOC]
- **Files Created**: [FILE_COUNT]
- **Files Modified**: [MODIFIED_COUNT]
- **Dependencies Added**: [DEPENDENCY_COUNT]
- **Tests Written**: [TEST_COUNT]
- **Code Coverage**: [COVERAGE_PERCENTAGE]%

## Quality Gates Results
- **Level 1**: ✓ Passed
- **Level 2**: ✓ Passed
- **Level 3**: ✓ Passed
- **Level 4**: ✓ Passed

## Performance Metrics
- **Build Time**: [BUILD_TIME]
- **Bundle Size Impact**: [SIZE_IMPACT]
- **Runtime Performance**: [PERFORMANCE_METRICS]

## Lessons Learned
- [LESSON_1]
- [LESSON_2]
- [LESSON_3]

## Patterns Discovered
- [PATTERN_1]
- [PATTERN_2]
- [PATTERN_3]

## Recommendations for Future Features
- [RECOMMENDATION_1]
- [RECOMMENDATION_2]
- [RECOMMENDATION_3]

---
*Completed: [COMPLETION_TIMESTAMP]*
*Context Quality Score: [FINAL_CONTEXT_QUALITY_SCORE]*
```

## Error Handling & Recovery

### Common Issues & Solutions

#### Context Overload
**Symptoms**: Context becomes too complex, AI performance degrades
**Solution**: 
1. Simplify feature scope
2. Break feature into smaller sub-features
3. Reset context with focus on current phase only

#### Validation Failures
**Symptoms**: Quality gates fail repeatedly
**Solution**:
1. Review feature requirements
2. Check dependency status
3. Validate development environment
4. Consider breaking feature into phases

#### Integration Conflicts
**Symptoms**: Feature conflicts with existing code
**Solution**:
1. Check feature isolation boundaries
2. Review API compatibility
3. Implement adapter pattern if needed
4. Update integration interfaces

### Emergency Protocols

#### Context Reset
```bash
# Reset context to current feature only
/context-status [feature-name]  # Check current status
/context-engineer [feature-name]  # Regenerate context
/execute-context [feature-name]  # Resume with fresh context
```

#### Feature Rollback
```bash
# Rollback to last known good state
git checkout [last-good-commit]
# Re-evaluate feature scope
/context-engineer "[simplified-feature-description]"
```

## Best Practices

### Implementation
1. **One Feature at a Time**: Never work on multiple features simultaneously
2. **Continuous Validation**: Run validation gates throughout development
3. **Context Monitoring**: Keep context quality score >80%
4. **Isolated Development**: Only modify files within feature scope
5. **Documentation**: Document decisions and patterns discovered

### Quality Assurance
1. **Test Early**: Write tests as you implement functionality
2. **Validate Often**: Run validation gates after each significant change
3. **Review Regularly**: Conduct mini code reviews during development
4. **Optimize Continuously**: Improve performance throughout development
5. **Document Everything**: Keep comprehensive implementation notes

### Performance Optimization
1. **Monitor Context**: Keep context window utilization optimal
2. **Batch Operations**: Group related changes together
3. **Lazy Loading**: Load context layers only when needed
4. **Cache Wisely**: Cache stable context information
5. **Measure Impact**: Track performance impact of changes 