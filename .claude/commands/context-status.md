# Context Status Command

## Purpose
Monitor feature health, dependencies, context quality, and overall project status with actionable insights and optimization recommendations.

## Usage
```
/context-status [feature-name]  # Check specific feature
/context-status                 # Check overall project status
```

## Process

### 1. Feature Health Assessment

#### Individual Feature Status
When checking a specific feature:

```markdown
# Feature Health Report: [FEATURE_NAME]

## Current Status
**Phase**: [PLANNED/IN_PROGRESS/COMPLETED]
**Progress**: [PROGRESS_PERCENTAGE]%
**Health Score**: [HEALTH_SCORE]/10
**Last Updated**: [TIMESTAMP]

## Quality Gates Status
- **Level 1** (Syntax & Structure): [✓/⏳/❌] [PASS_RATE]%
- **Level 2** (Integration): [✓/⏳/❌] [PASS_RATE]%
- **Level 3** (Functional): [✓/⏳/❌] [PASS_RATE]%
- **Level 4** (Performance & Quality): [✓/⏳/❌] [PASS_RATE]%

## Context Quality Metrics
- **Relevance Score**: [RELEVANCE_SCORE]% (Target: >90%)
- **Density Score**: [DENSITY_SCORE]% (Target: >80%)
- **Noise Level**: [NOISE_LEVEL]% (Target: <10%)
- **Context Efficiency**: [EFFICIENCY_SCORE]% (Target: >80%)

## Implementation Metrics
- **Files Created**: [FILE_COUNT]
- **Files Modified**: [MODIFIED_COUNT]
- **Dependencies Added**: [DEPENDENCY_COUNT]
- **Tests Written**: [TEST_COUNT]
- **Code Coverage**: [COVERAGE_PERCENTAGE]%

## Dependency Status
**Prerequisites**: [PREREQUISITE_STATUS]
- [DEPENDENCY_1]: ✓ Completed
- [DEPENDENCY_2]: ⏳ In Progress
- [DEPENDENCY_3]: ❌ Blocked

**Dependents**: [DEPENDENT_FEATURES]
- [DEPENDENT_1]: Waiting
- [DEPENDENT_2]: Blocked

## Issues & Blockers
**High Priority**:
- [HIGH_PRIORITY_ISSUE_1]
- [HIGH_PRIORITY_ISSUE_2]

**Medium Priority**:
- [MEDIUM_PRIORITY_ISSUE_1]
- [MEDIUM_PRIORITY_ISSUE_2]

**Low Priority**:
- [LOW_PRIORITY_ISSUE_1]
- [LOW_PRIORITY_ISSUE_2]

## Recommendations
**Immediate Actions**:
1. [IMMEDIATE_ACTION_1]
2. [IMMEDIATE_ACTION_2]
3. [IMMEDIATE_ACTION_3]

**Context Optimizations**:
1. [CONTEXT_OPTIMIZATION_1]
2. [CONTEXT_OPTIMIZATION_2]
3. [CONTEXT_OPTIMIZATION_3]

**Next Steps**:
1. [NEXT_STEP_1]
2. [NEXT_STEP_2]
3. [NEXT_STEP_3]
```

#### Overall Project Status
When checking project-wide status:

```markdown
# Project Health Dashboard

## Overall Status
**Project Health Score**: [OVERALL_HEALTH_SCORE]/10
**Active Features**: [ACTIVE_FEATURE_COUNT]
**Completion Rate**: [COMPLETION_RATE]%
**Last Activity**: [LAST_ACTIVITY_TIMESTAMP]

## Feature Pipeline
**Planned**: [PLANNED_COUNT] features
**In Progress**: [IN_PROGRESS_COUNT] features
**Completed**: [COMPLETED_COUNT] features
**Blocked**: [BLOCKED_COUNT] features

## Context Quality Overview
**Average Relevance**: [AVG_RELEVANCE]%
**Average Density**: [AVG_DENSITY]%
**Average Efficiency**: [AVG_EFFICIENCY]%
**Context Health**: [CONTEXT_HEALTH_SCORE]/10

## Dependency Health
**Resolved Dependencies**: [RESOLVED_COUNT]
**Pending Dependencies**: [PENDING_COUNT]
**Circular Dependencies**: [CIRCULAR_COUNT]
**Conflicting Features**: [CONFLICT_COUNT]

## Project Metrics
- **Total Features**: [TOTAL_FEATURE_COUNT]
- **Success Rate**: [SUCCESS_RATE]%
- **Average Implementation Time**: [AVG_IMPLEMENTATION_TIME]
- **Code Quality Score**: [CODE_QUALITY_SCORE]/10
- **Test Coverage**: [OVERALL_TEST_COVERAGE]%

## Critical Issues
**Project Blockers**:
- [PROJECT_BLOCKER_1]
- [PROJECT_BLOCKER_2]

**Performance Issues**:
- [PERFORMANCE_ISSUE_1]
- [PERFORMANCE_ISSUE_2]

**Quality Concerns**:
- [QUALITY_CONCERN_1]
- [QUALITY_CONCERN_2]

## Recommended Actions
**High Priority**:
1. [HIGH_PRIORITY_ACTION_1]
2. [HIGH_PRIORITY_ACTION_2]
3. [HIGH_PRIORITY_ACTION_3]

**Medium Priority**:
1. [MEDIUM_PRIORITY_ACTION_1]
2. [MEDIUM_PRIORITY_ACTION_2]
3. [MEDIUM_PRIORITY_ACTION_3]

**Optimization Opportunities**:
1. [OPTIMIZATION_1]
2. [OPTIMIZATION_2]
3. [OPTIMIZATION_3]
```

### 2. Context Quality Analysis

#### Context Layer Health Assessment
```yaml
Layer Assessment:
  layer_1_system:
    relevance: 95%
    density: 88%
    freshness: 100%
    issues: []
    
  layer_2_goals:
    relevance: 92%
    density: 85%
    freshness: 90%
    issues: ["Some goals may be outdated"]
    
  layer_3_constraints:
    relevance: 88%
    density: 82%
    freshness: 85%
    issues: ["Performance constraints need update"]
    
  layer_4_historical:
    relevance: 78%
    density: 75%
    freshness: 60%
    issues: ["Historical data needs pruning"]
    
  layer_5_external:
    relevance: 85%
    density: 80%
    freshness: 70%
    issues: ["API documentation outdated"]
    
  layer_6_domain:
    relevance: 93%
    density: 90%
    freshness: 95%
    issues: []
    
  layer_7_project:
    relevance: 96%
    density: 92%
    freshness: 98%
    issues: []
    
  layer_8_feature:
    relevance: 94%
    density: 88%
    freshness: 100%
    issues: []
    
  layer_9_session:
    relevance: 89%
    density: 85%
    freshness: 100%
    issues: ["Session context could be more focused"]
    
  layer_10_immediate:
    relevance: 98%
    density: 95%
    freshness: 100%
    issues: []
    
  layer_11_query:
    relevance: 100%
    density: 98%
    freshness: 100%
    issues: []
```

#### Context Optimization Recommendations
```markdown
## Context Optimization Report

### High Impact Optimizations
1. **Layer 4 (Historical)**: Prune outdated historical data
   - **Current**: 78% relevance, 75% density
   - **Target**: 85% relevance, 80% density
   - **Action**: Remove data older than 6 months

2. **Layer 5 (External)**: Update API documentation
   - **Current**: 85% relevance, 80% density
   - **Target**: 90% relevance, 85% density
   - **Action**: Refresh external documentation cache

3. **Layer 9 (Session)**: Focus session context
   - **Current**: 89% relevance, 85% density
   - **Target**: 92% relevance, 88% density
   - **Action**: Filter session context to current feature scope

### Medium Impact Optimizations
1. **Layer 3 (Constraints)**: Update performance constraints
2. **Layer 2 (Goals)**: Refresh feature goals

### Low Impact Optimizations
1. **General**: Improve context compression algorithms
2. **General**: Implement dynamic layer weighting
```

### 3. Dependency Analysis

#### Dependency Health Check
```markdown
## Dependency Health Report

### Resolved Dependencies
- `project-init` → `user-auth` ✓
- `user-auth` → `user-profile` ✓
- `navigation` → `user-profile` ✓

### Pending Dependencies
- `payment-system` → `user-auth` ⏳ (In Progress)
- `notifications` → `user-profile` ⏳ (Planned)

### Circular Dependencies
- `feature-a` ↔ `feature-b` ❌ (Needs Resolution)

### Conflicting Features
- `redux-state` vs `zustand-state` ⚠️ (Choose One)
- `expo-router` vs `react-navigation` ⚠️ (Choose One)

### Dependency Chain Analysis
```
project-init (✓)
├── user-auth (✓)
│   ├── user-profile (✓)
│   │   ├── notifications (⏳)
│   │   └── user-settings (⏳)
│   ├── biometric-auth (⏳)
│   └── social-auth (⏳)
├── navigation (✓)
│   ├── tab-navigation (⏳)
│   └── stack-navigation (⏳)
└── theme-system (⏳)
    ├── dark-mode (⏳)
    └── accessibility (⏳)
```

### Recommended Dependency Actions
1. **Resolve Circular Dependencies**: Redesign feature-a and feature-b interfaces
2. **Choose State Management**: Decide between Redux and Zustand
3. **Choose Navigation**: Decide between Expo Router and React Navigation
4. **Prioritize Chains**: Focus on completing user-auth chain first
```

### 4. Performance Monitoring

#### Performance Metrics Dashboard
```markdown
## Performance Dashboard

### Context Performance
- **Context Loading Time**: [LOAD_TIME]ms (Target: <100ms)
- **Context Memory Usage**: [MEMORY_USAGE]MB (Target: <50MB)
- **Context Refresh Rate**: [REFRESH_RATE]ms (Target: <500ms)
- **Layer Processing Time**: [LAYER_PROCESSING_TIME]ms (Target: <50ms)

### Implementation Performance
- **Average Build Time**: [BUILD_TIME]s (Target: <30s)
- **Test Execution Time**: [TEST_TIME]s (Target: <60s)
- **Feature Implementation Time**: [IMPLEMENTATION_TIME]h (Target: <8h)
- **Validation Gate Time**: [VALIDATION_TIME]s (Target: <10s)

### System Performance
- **Memory Usage**: [SYSTEM_MEMORY]MB
- **CPU Usage**: [CPU_USAGE]%
- **Disk Usage**: [DISK_USAGE]GB
- **Network Usage**: [NETWORK_USAGE]MB

### Performance Alerts
**Critical**:
- [CRITICAL_PERFORMANCE_ISSUE]

**Warning**:
- [WARNING_PERFORMANCE_ISSUE]

**Info**:
- [INFO_PERFORMANCE_ISSUE]
```

### 5. Quality Metrics Analysis

#### Code Quality Assessment
```markdown
## Code Quality Report

### Overall Quality Score: [QUALITY_SCORE]/10

### Quality Metrics
- **Code Coverage**: [COVERAGE]% (Target: >90%)
- **Cyclomatic Complexity**: [COMPLEXITY] (Target: <10)
- **Maintainability Index**: [MAINTAINABILITY] (Target: >80)
- **Technical Debt**: [TECH_DEBT] hours (Target: <40h)

### Quality Gates Summary
- **Syntax & Structure**: [PASS_RATE]% pass rate
- **Integration**: [PASS_RATE]% pass rate
- **Functional**: [PASS_RATE]% pass rate
- **Performance**: [PASS_RATE]% pass rate

### Code Quality Issues
**High Priority**:
- [HIGH_PRIORITY_QUALITY_ISSUE]

**Medium Priority**:
- [MEDIUM_PRIORITY_QUALITY_ISSUE]

**Low Priority**:
- [LOW_PRIORITY_QUALITY_ISSUE]

### Recommendations
1. [QUALITY_RECOMMENDATION_1]
2. [QUALITY_RECOMMENDATION_2]
3. [QUALITY_RECOMMENDATION_3]
```

### 6. Actionable Insights

#### Immediate Action Items
```markdown
## Action Items

### Critical (Do Now)
- [ ] [CRITICAL_ACTION_1]
- [ ] [CRITICAL_ACTION_2]
- [ ] [CRITICAL_ACTION_3]

### High Priority (This Week)
- [ ] [HIGH_PRIORITY_ACTION_1]
- [ ] [HIGH_PRIORITY_ACTION_2]
- [ ] [HIGH_PRIORITY_ACTION_3]

### Medium Priority (This Month)
- [ ] [MEDIUM_PRIORITY_ACTION_1]
- [ ] [MEDIUM_PRIORITY_ACTION_2]
- [ ] [MEDIUM_PRIORITY_ACTION_3]

### Low Priority (When Time Permits)
- [ ] [LOW_PRIORITY_ACTION_1]
- [ ] [LOW_PRIORITY_ACTION_2]
- [ ] [LOW_PRIORITY_ACTION_3]
```

#### Context Optimization Actions
```markdown
## Context Optimization Actions

### Immediate Optimizations
1. **Reduce Context Noise**: [SPECIFIC_ACTIONS]
2. **Improve Relevance**: [SPECIFIC_ACTIONS]
3. **Increase Density**: [SPECIFIC_ACTIONS]

### Strategic Optimizations
1. **Layer Restructuring**: [RESTRUCTURING_PLAN]
2. **Template Updates**: [TEMPLATE_UPDATE_PLAN]
3. **Validation Improvements**: [VALIDATION_IMPROVEMENT_PLAN]

### Automation Opportunities
1. **Context Refresh**: [AUTOMATION_PLAN]
2. **Quality Monitoring**: [MONITORING_PLAN]
3. **Performance Tracking**: [TRACKING_PLAN]
```

## Health Score Calculation

### Feature Health Score Algorithm
```javascript
function calculateFeatureHealthScore(feature) {
  const weights = {
    qualityGates: 0.3,
    contextQuality: 0.25,
    dependencyHealth: 0.2,
    implementationProgress: 0.15,
    performanceMetrics: 0.1
  };
  
  const scores = {
    qualityGates: calculateQualityGateScore(feature),
    contextQuality: calculateContextQualityScore(feature),
    dependencyHealth: calculateDependencyHealthScore(feature),
    implementationProgress: calculateProgressScore(feature),
    performanceMetrics: calculatePerformanceScore(feature)
  };
  
  return Object.entries(weights).reduce((total, [key, weight]) => {
    return total + (scores[key] * weight);
  }, 0);
}
```

### Project Health Score Algorithm
```javascript
function calculateProjectHealthScore(project) {
  const features = project.features;
  const avgFeatureHealth = features.reduce((sum, feature) => 
    sum + calculateFeatureHealthScore(feature), 0) / features.length;
  
  const projectFactors = {
    avgFeatureHealth: avgFeatureHealth * 0.4,
    dependencyHealth: calculateOverallDependencyHealth(project) * 0.3,
    contextQuality: calculateOverallContextQuality(project) * 0.2,
    performanceMetrics: calculateOverallPerformance(project) * 0.1
  };
  
  return Object.values(projectFactors).reduce((sum, score) => sum + score, 0);
}
```

## Alert System

### Alert Levels
- **🚨 Critical**: Immediate action required (Health Score <4)
- **⚠️ Warning**: Attention needed (Health Score 4-6)
- **ℹ️ Info**: For awareness (Health Score 6-8)
- **✅ Good**: All systems healthy (Health Score >8)

### Alert Types
- **Context Degradation**: Context quality below thresholds
- **Dependency Conflicts**: Circular or conflicting dependencies
- **Performance Issues**: Performance metrics below targets
- **Quality Gate Failures**: Validation failures above acceptable limits
- **Implementation Blockers**: Features blocked for extended periods

## Best Practices

### Regular Monitoring
1. **Daily**: Check active feature status
2. **Weekly**: Review overall project health
3. **Monthly**: Conduct comprehensive dependency analysis
4. **Quarterly**: Perform context optimization review

### Proactive Maintenance
1. **Context Hygiene**: Regularly clean and optimize context
2. **Dependency Management**: Monitor and resolve dependencies promptly
3. **Performance Monitoring**: Track performance trends
4. **Quality Assurance**: Maintain quality gate standards

### Response Protocols
1. **Critical Issues**: Immediate response within 1 hour
2. **High Priority**: Response within 1 day
3. **Medium Priority**: Response within 1 week
4. **Low Priority**: Response within 1 month 