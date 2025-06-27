# Project Audit Command - Technological Assessment

## Purpose
Perform comprehensive technological audit of the project, evaluating architecture, code quality, dependencies, security, and opportunities for improvement.

## Usage
Run periodically (weekly or bi-weekly) to maintain project health and identify areas for improvement.

## Audit Categories

### 1. 🏗️ Architecture Analysis
**What to evaluate**:
- Project structure and organization
- Component hierarchy and relationships
- Navigation patterns and routing
- State management implementation
- Data flow patterns

**Questions to assess**:
- Is the folder structure logical and scalable?
- Are components properly separated by concerns?
- Is navigation intuitive and efficient?
- Is state management consistent and predictable?
- Are there circular dependencies or tight coupling issues?

### 2. 📦 Dependencies & Stack Health
**What to evaluate**:
- Package.json dependencies analysis
- Version compatibility and security
- Bundle size and performance impact
- Unused or redundant dependencies
- Missing critical dependencies

**Checks to perform**:
- Outdated packages that need updates
- Security vulnerabilities in dependencies
- License compatibility issues
- Alternative packages that might be better
- Dependencies that can be removed

### 3. 💡 Code Quality Assessment
**What to evaluate**:
- Code consistency and patterns
- TypeScript usage and type safety
- Error handling implementation
- Performance bottlenecks
- Code duplication and reusability

**Analysis areas**:
- Consistent naming conventions
- Proper TypeScript types and interfaces
- Error boundaries and try-catch usage
- Expensive operations and optimizations
- Reusable components and utilities

### 4. 🔒 Security & Best Practices
**What to evaluate**:
- Authentication and authorization
- Data validation and sanitization
- Secure storage practices
- API security considerations
- Privacy and data protection

**Security checks**:
- Sensitive data exposure
- Input validation completeness
- Secure token storage
- API endpoint security
- User data privacy compliance

### 5. 🚀 Performance & Optimization
**What to evaluate**:
- App startup time and bundle size
- Memory usage and leaks
- Rendering performance
- Network requests efficiency
- Image and asset optimization

**Performance metrics**:
- Bundle size analysis
- Render performance bottlenecks
- Unnecessary re-renders
- Network request optimization
- Asset loading strategies

### 6. 📱 User Experience & Accessibility
**What to evaluate**:
- Navigation intuitiveness
- Loading states and error handling
- Accessibility compliance
- Cross-platform consistency
- Offline functionality

**UX assessment**:
- User flow completeness
- Error message clarity
- Accessibility features
- Platform-specific optimizations
- Offline/poor network handling

## Audit Report Format

```markdown
# 🔍 PROJECT AUDIT REPORT
**Date**: [Current date]
**Project**: [Project name]
**Auditor**: Claude Code
**Phase**: [Current development phase]

## 📊 EXECUTIVE SUMMARY
**Overall Health Score**: [X]/10
**Critical Issues**: [Number]
**Recommendations**: [Number]
**Estimated Improvement Time**: [Hours/days]

## 🎯 KEY FINDINGS

### ✅ STRENGTHS
1. **[Strength 1]**: [Description and impact]
2. **[Strength 2]**: [Description and impact]
3. **[Strength 3]**: [Description and impact]

### ⚠️ AREAS FOR IMPROVEMENT
1. **[Issue 1]** - Priority: [HIGH/MEDIUM/LOW]
   - **Problem**: [Description]
   - **Impact**: [Potential consequences]
   - **Recommendation**: [Specific action]
   - **Effort**: [Time estimate]

2. **[Issue 2]** - Priority: [HIGH/MEDIUM/LOW]
   - **Problem**: [Description]
   - **Impact**: [Potential consequences]
   - **Recommendation**: [Specific action]
   - **Effort**: [Time estimate]

### 🚨 CRITICAL ISSUES
1. **[Critical Issue]** - URGENT
   - **Problem**: [Description]
   - **Risk**: [Security/Performance/Functionality risk]
   - **Action Required**: [Immediate steps needed]
   - **Timeline**: [When to fix]

## 📋 DETAILED ANALYSIS

### Architecture Score: [X]/10
[Detailed architecture assessment]

### Dependencies Score: [X]/10
[Dependencies and stack health analysis]

### Code Quality Score: [X]/10
[Code quality and maintainability assessment]

### Security Score: [X]/10
[Security and best practices evaluation]

### Performance Score: [X]/10
[Performance and optimization analysis]

### UX/Accessibility Score: [X]/10
[User experience and accessibility assessment]

## 🎯 ACTIONABLE RECOMMENDATIONS

### Immediate Actions (This Week)
1. [Action 1] - [Time estimate]
2. [Action 2] - [Time estimate]

### Short-term Improvements (Next 2 weeks)
1. [Improvement 1] - [Time estimate]
2. [Improvement 2] - [Time estimate]

### Long-term Enhancements (Next month)
1. [Enhancement 1] - [Time estimate]
2. [Enhancement 2] - [Time estimate]

## 📈 IMPROVEMENT ROADMAP
[Visual representation or timeline of improvements]

## 🔄 NEXT AUDIT
**Recommended Next Audit**: [Date]
**Focus Areas**: [Specific areas to monitor]
```

## Implementation Process

### 1. Comprehensive File Analysis
- Read and analyze all source files
- Review configuration files
- Examine package.json and dependencies
- Check documentation completeness

### 2. Web Research Integration
- Research current best practices for identified technologies
- Check for known security issues in dependencies
- Compare with industry standards
- Identify emerging patterns and tools

### 3. Automated Checks
- Dependency vulnerability scanning
- Bundle size analysis
- Code pattern recognition
- Performance anti-patterns detection

### 4. Prioritized Recommendations
- Rank issues by impact and effort
- Provide specific, actionable solutions
- Include implementation guidance
- Estimate time and complexity

## Integration with Development Workflow
- Add high-priority issues as new tasks in claude_tasks.md
- Update project documentation with findings
- Store audit results in claude_self_improve.md
- Schedule follow-up audits based on findings

## Success Metrics
- Project health score improvement over time
- Reduction in critical and high-priority issues
- Implementation of recommended improvements
- Maintenance of best practices compliance 