# Context Engineer Command

## Purpose
Analyze feature requirements and create comprehensive implementation plans using advanced Context Engineering principles.

## Usage
```
/context-engineer "[feature description]"
```

## Process

### 1. Feature Analysis
- **Project Detection**: Analyze project structure, language, and framework
- **Scope Analysis**: Understand feature requirements and complexity
- **Context Gathering**: Collect relevant information for 11-layer architecture
- **Template Selection**: Choose appropriate templates based on technology stack

### 2. Context Engineering (11-Layer Architecture)

#### Layer 1: System Instructions
```
You are a feature implementation specialist for [DETECTED_LANGUAGE/FRAMEWORK].
- Follow [LANGUAGE]-specific best practices and conventions
- Implement clean, maintainable, and scalable code
- Ensure proper error handling and validation
- Focus on [FEATURE_TYPE] implementation patterns
- Maintain consistency with existing project architecture
```

#### Layer 2: Goals
```
Feature: [FEATURE_NAME]
Primary Objective: [FEATURE_DESCRIPTION]
Success Criteria:
- [CRITERION_1]
- [CRITERION_2]
- [CRITERION_3]
Quality Targets:
- Code coverage: 90%+
- Performance: [PERFORMANCE_TARGETS]
- User experience: [UX_REQUIREMENTS]
```

#### Layer 3: Constraints
```
Technical Constraints:
- Language: [DETECTED_LANGUAGE]
- Framework: [DETECTED_FRAMEWORK]  
- Dependencies: [EXISTING_DEPENDENCIES]
- Platform: [TARGET_PLATFORM]
- Performance: [PERFORMANCE_CONSTRAINTS]
- Security: [SECURITY_REQUIREMENTS]
```

#### Layer 4: Historical Context
```
Related Past Implementations:
- [SIMILAR_FEATURES_COMPLETED]
- [LESSONS_LEARNED]
- [PATTERNS_DISCOVERED]
- [PERFORMANCE_OPTIMIZATIONS]
Architecture Decisions:
- [PAST_ARCHITECTURAL_CHOICES]
- [RATIONALE_FOR_DECISIONS]
```

#### Layer 5: External Context
```
API Documentation:
- [RELEVANT_API_DOCS]
- [INTEGRATION_PATTERNS]
Third-party Libraries:
- [REQUIRED_LIBRARIES]
- [LIBRARY_DOCUMENTATION]
Platform Documentation:
- [PLATFORM_SPECIFIC_DOCS]
- [DEPLOYMENT_REQUIREMENTS]
```

#### Layer 6: Domain Knowledge
```
[LANGUAGE] Best Practices:
- [CODING_STANDARDS]
- [ARCHITECTURAL_PATTERNS]
[FRAMEWORK] Conventions:
- [FRAMEWORK_PATTERNS]
- [PERFORMANCE_OPTIMIZATION]
Testing Methodologies:
- [TESTING_FRAMEWORK]
- [TESTING_PATTERNS]
```

#### Layer 7: Project Context
```
Project Overview:
- Type: [PROJECT_TYPE]
- Architecture: [ARCHITECTURE_PATTERN]
- Structure: [DIRECTORY_STRUCTURE]
Current Dependencies:
- [DEPENDENCY_LIST]
- [VERSION_CONSTRAINTS]
Build System:
- [BUILD_TOOLS]
- [DEPLOYMENT_PIPELINE]
```

#### Layer 8: Feature Context
```
Feature Dependencies:
- Required Features: [PREREQUISITE_FEATURES]
- Conflicting Features: [CONFLICTING_FEATURES]
- Integration Points: [INTEGRATION_INTERFACES]
Related Components:
- [RELATED_COMPONENTS]
- [SHARED_UTILITIES]
- [CROSS_FEATURE_COMMUNICATION]
```

#### Layer 9: Session Context
```
Development Session:
- Active Files: [CURRENTLY_OPEN_FILES]
- Recent Changes: [RECENT_MODIFICATIONS]
- Current Focus: [CURRENT_WORK_AREA]
Development Flow:
- [DEVELOPMENT_MOMENTUM]
- [ACTIVE_DEBUGGING_CONTEXT]
```

#### Layer 10: Immediate Context
```
Current Feature Focus:
- Feature: [FEATURE_NAME]
- Phase: Planning
- Priority: [FEATURE_PRIORITY]
- Complexity: [COMPLEXITY_SCORE]
Immediate Requirements:
- [IMMEDIATE_REQUIREMENTS]
- [QUICK_WINS]
- [CRITICAL_PATH_ITEMS]
```

#### Layer 11: User Query
```
User Request: "[ORIGINAL_USER_REQUEST]"
Specific Requirements:
- [PARSED_REQUIREMENTS]
- [CLARIFICATIONS_NEEDED]
- [PREFERENCES_INDICATED]
Context Overrides:
- [USER_SPECIFIED_CONSTRAINTS]
- [PREFERENCE_MODIFICATIONS]
```

### 3. PRP Generation

Create comprehensive Product Requirements Prompt using the structure:

```markdown
# Feature: [FEATURE_NAME]

## Executive Summary
[HIGH_LEVEL_DESCRIPTION]

## Goal & Context
**Primary Objective**: [MAIN_GOAL]
**Business Value**: [BUSINESS_IMPACT]  
**Technical Scope**: [TECHNICAL_BOUNDARIES]

## 11-Layer Context Architecture
[COMPLETE_CONTEXT_FROM_LAYERS_1-11]

## Research Findings
**Technology Stack Analysis**:
- [TECHNOLOGY_ASSESSMENT]
- [FRAMEWORK_COMPATIBILITY]
- [PERFORMANCE_IMPLICATIONS]

**Implementation Patterns**:
- [RECOMMENDED_PATTERNS]
- [ALTERNATIVE_APPROACHES]
- [TRADE_OFF_ANALYSIS]

**Integration Requirements**:
- [INTEGRATION_POINTS]
- [API_REQUIREMENTS]
- [DATA_FLOW_PATTERNS]

## Implementation Blueprint

### Phase 1: Foundation Setup
**Objective**: [PHASE_1_GOAL]
**Tasks**:
1. [TASK_1]
2. [TASK_2]
3. [TASK_3]

**Validation Gates**:
- [ ] [VALIDATION_1]
- [ ] [VALIDATION_2]
- [ ] [VALIDATION_3]

### Phase 2: Core Implementation
**Objective**: [PHASE_2_GOAL]
**Tasks**:
1. [TASK_1]
2. [TASK_2]
3. [TASK_3]

**Validation Gates**:
- [ ] [VALIDATION_1]
- [ ] [VALIDATION_2]
- [ ] [VALIDATION_3]

### Phase 3: Integration & Testing
**Objective**: [PHASE_3_GOAL]
**Tasks**:
1. [TASK_1]
2. [TASK_2]
3. [TASK_3]

**Validation Gates**:
- [ ] [VALIDATION_1]
- [ ] [VALIDATION_2]
- [ ] [VALIDATION_3]

### Phase 4: Optimization & Documentation
**Objective**: [PHASE_4_GOAL]
**Tasks**:
1. [TASK_1]
2. [TASK_2]
3. [TASK_3]

**Validation Gates**:
- [ ] [VALIDATION_1]
- [ ] [VALIDATION_2]
- [ ] [VALIDATION_3]

## Quality Gates

### Level 1: Syntax & Structure
- [ ] Code compiles without errors
- [ ] Follows language conventions
- [ ] Proper file structure
- [ ] Dependencies resolved

### Level 2: Integration
- [ ] Integrates with existing codebase
- [ ] API contracts maintained
- [ ] Data flow validated
- [ ] No regression issues

### Level 3: Functional
- [ ] All requirements implemented
- [ ] Edge cases handled
- [ ] Error handling robust
- [ ] User experience meets standards

### Level 4: Performance & Quality
- [ ] Performance targets met
- [ ] Security requirements satisfied
- [ ] Code coverage >90%
- [ ] Documentation complete

## Dependencies
**Required Features**: [PREREQUISITE_FEATURES]
**Conflicting Features**: [CONFLICTING_FEATURES]
**External Dependencies**: [EXTERNAL_DEPENDENCIES]

## Risk Assessment
**High Risk**: [HIGH_RISK_ITEMS]
**Medium Risk**: [MEDIUM_RISK_ITEMS]
**Mitigation Strategies**: [MITIGATION_PLANS]

## Success Metrics
- **Functional**: [FUNCTIONAL_METRICS]
- **Performance**: [PERFORMANCE_METRICS]
- **Quality**: [QUALITY_METRICS]
- **User Experience**: [UX_METRICS]

## Quality Score: [CALCULATED_SCORE]/10
**Complexity**: [COMPLEXITY_ASSESSMENT]
**Readiness**: [IMPLEMENTATION_READINESS]
**Risk Level**: [RISK_ASSESSMENT]

---
*Generated by Context Engineer - Feature-Driven Development System*
*Timestamp: [GENERATION_TIMESTAMP]*
*Context Quality Score: [CONTEXT_QUALITY_SCORE]*
```

### 4. Dependency Analysis
- Check `/features/dependencies.md` for conflicts
- Identify prerequisite features
- Update dependency mapping
- Validate implementation order

### 5. Template Application
- Apply language-specific templates
- Customize for framework patterns
- Include best practices
- Add validation rules

### 6. Plan Validation
- Verify completeness
- Check for missing requirements
- Validate technical feasibility
- Confirm dependency resolution

## Output
- Creates feature PRP file in `/features/planned/[feature-name].md`
- Updates `/features/dependencies.md` with new relationships
- Generates context quality report
- Provides implementation readiness assessment

## Example Usage

```bash
# New project initialization
/context-engineer "Set up React Native project with TypeScript and navigation"

# Feature addition
/context-engineer "Add user authentication with JWT tokens and biometric login"

# Enhancement request
/context-engineer "Implement real-time chat with WebSocket and message persistence"

# Performance optimization
/context-engineer "Optimize image loading and implement lazy loading for better performance"
```

## Quality Assurance
- All generated PRPs must pass validation gates
- Context quality score must be >80%
- Implementation readiness must be "Ready"
- Dependencies must be resolved or clearly documented

## Best Practices
1. **Thorough Analysis**: Spend time understanding the complete context
2. **Clear Documentation**: Make PRPs self-explanatory and comprehensive
3. **Dependency Awareness**: Always check for conflicts and prerequisites
4. **Quality Focus**: Ensure all validation gates are meaningful and testable
5. **Context Optimization**: Continuously refine context relevance and density 