# Quick Feature Command - Medium Features & UI/UX Changes

**Purpose**: Handle medium-complexity features and UI/UX changes using focused 6-layer context approach that balances depth with efficiency.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: plan-only. Create plan in workflow/planned/ and update logbook
Legend: Generated based on symbols used in command
Purpose: "[Plan][Feature] for $ARGUMENTS"

Creates detailed feature plan with 6-layer context analysis and registers in logbook. Use @start to execute the planned feature.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@quick-feature "add dark mode toggle to settings"` - UI theme feature
- `@quick-feature "implement user profile editing"` - Single-screen functionality
- `@quick-feature "add export functionality to reports"` - Feature enhancement
- `@quick-feature "create onboarding tutorial flow"` - Multi-step UI workflow

## Focused Context Architecture (6-Layer)

### Layer 1: Feature Goals & Requirements
**Focus**: Clear understanding of what needs to be built and why
- **Feature Purpose**: Why this feature is needed and what problem it solves
- **User Stories**: How users will interact with this feature
- **Acceptance Criteria**: Specific, measurable criteria for completion
- **Success Metrics**: How we'll measure if the feature is successful
- **Scope Boundaries**: What's included and excluded from this feature

### Layer 2: User Experience Context
**Focus**: How users will interact with and experience the feature
- **User Journey**: Step-by-step user experience flow
- **UI/UX Requirements**: Visual design and interaction patterns
- **Accessibility Considerations**: Ensuring feature works for all users
- **Mobile/Responsive Needs**: How feature adapts across devices
- **Error Handling**: How errors and edge cases are handled

### Layer 3: Technical Implementation
**Focus**: Technical approach and integration with existing systems
- **Architecture Overview**: High-level technical approach
- **Component Design**: Key components and their interactions
- **Data Requirements**: Data models, storage, and API needs
- **Integration Points**: How feature connects with existing systems
- **Technology Stack**: Technologies and libraries to be used

### Layer 4: Dependencies & Integration
**Focus**: What the feature depends on and what depends on it
- **System Dependencies**: Existing systems this feature needs
- **External Dependencies**: Third-party services or APIs required
- **Database Changes**: Schema modifications or new tables needed
- **API Modifications**: New endpoints or changes to existing ones
- **Impact on Existing Features**: How this affects current functionality

### Layer 5: Implementation Strategy
**Focus**: Practical plan for building and deploying the feature
- **Development Phases**: Logical breakdown of implementation phases
- **Testing Strategy**: How feature will be tested and validated
- **Deployment Plan**: How feature will be rolled out to users
- **Performance Considerations**: Expected performance impact and optimization
- **Security Considerations**: Security implications and requirements

### Layer 6: Quality & Validation
**Focus**: Ensuring feature meets quality standards and user needs
- **Quality Gates**: Specific checkpoints for validating progress
- **User Acceptance Testing**: How users will validate the feature
- **Performance Benchmarks**: Expected performance metrics
- **Documentation Requirements**: User and technical documentation needed
- **Rollback Strategy**: Plan for reverting if issues arise

## Process

### 1. Feature Analysis & Planning
- **Requirements Gathering**: Understand exactly what needs to be built
- **User Research**: Understand user needs and existing behavior patterns
- **Technical Feasibility**: Verify the feature is technically achievable
- **Complexity Assessment**: Confirm this is medium complexity (not simple issue or complex feature)

### 2. Design & Architecture
- **User Experience Design**: Create user flows and interaction patterns
- **Technical Design**: Plan component architecture and data flow  
- **Integration Planning**: Understand how feature fits with existing systems
- **Risk Assessment**: Identify potential challenges and mitigation strategies

### 3. Implementation Planning
- **Phase Breakdown**: Divide feature into logical implementation phases
- **Resource Requirements**: Estimate time, skills, and dependencies needed
- **Testing Strategy**: Plan unit, integration, and user testing approach
- **Documentation Plan**: Identify what documentation is needed

### 4. Validation Strategy
- **Acceptance Criteria Validation**: Ensure all criteria can be met
- **User Experience Validation**: Plan how to validate UX meets user needs
- **Technical Validation**: Plan how to validate technical implementation
- **Performance Validation**: Ensure feature meets performance requirements

## Feature Classification

### UI/UX Features
- New screens or views
- Design system updates
- User interaction improvements
- Responsive design enhancements
- Accessibility improvements

### Functional Features
- Single-purpose functionality additions
- Workflow enhancements
- Data manipulation features
- Reporting and analytics additions
- Configuration and settings features

### Integration Features
- Third-party service integrations
- Internal system connections
- API enhancements
- Data synchronization features
- Import/export functionality

### Enhancement Features
- Performance improvements
- User experience optimizations
- Feature extensions
- Workflow streamlining
- Automation additions

## File Handling

### Feature Documentation
Create focused feature file in `workflow/planned/[feature-name].md`:

```markdown
# Quick Feature: [Feature Name]

## Feature Summary
[Brief description of what's being built and why]

## User Stories
- As a [user type], I want [goal] so that [benefit]
- As a [user type], I want [goal] so that [benefit]

## Acceptance Criteria
- [ ] [Specific measurable criterion]
- [ ] [Specific measurable criterion]
- [ ] [Specific measurable criterion]

## User Experience Flow
1. [User action/step]
2. [System response]
3. [User action/step]
4. [Final outcome]

## Technical Implementation
- **Architecture**: [High-level approach]
- **Components**: [Key components to build]
- **Data Requirements**: [Data models and storage]
- **APIs**: [New or modified endpoints]

## Dependencies
- **System Dependencies**: [What we depend on]
- **External Dependencies**: [Third-party requirements]
- **Blocked by**: [What needs to happen first]

## Implementation Phases
### Phase 1: [Phase Name]
- [What gets built in this phase]
- [Acceptance criteria for this phase]

### Phase 2: [Phase Name]
- [What gets built in this phase]
- [Acceptance criteria for this phase]

## Testing Strategy
- **Unit Tests**: [What needs unit testing]
- **Integration Tests**: [What needs integration testing]
- **User Testing**: [How users will validate]

## Quality Gates
- [ ] Functional requirements met
- [ ] UI/UX requirements met
- [ ] Performance requirements met
- [ ] Security requirements met
- [ ] Documentation completed

## Success Metrics
- [How success will be measured]
- [Key performance indicators]

## Risk Assessment
- **Technical Risks**: [Potential technical challenges]
- **UX Risks**: [Potential user experience issues]
- **Integration Risks**: [Potential integration problems]
- **Mitigation**: [How risks will be addressed]
```

### Workflow Integration
- **Planning**: Feature files start in `workflow/planned/`
- **Execution**: Move to `workflow/in-progress/` during @start
- **Completion**: Move to `workflow/completed/` with status prefix when done
- **Naming**: `[descriptive-feature-name].md` format (no special prefix)

## Quality Gates

### Level 1: Functional Validation
- All acceptance criteria are met
- Feature works as specified in user stories
- Error handling works correctly
- Edge cases are handled appropriately

### Level 2: User Experience Validation
- User flow is intuitive and efficient
- UI is consistent with design system
- Feature is accessible to all users
- Mobile/responsive behavior works correctly

### Level 3: Technical Validation
- Code follows project conventions
- Performance meets requirements
- Integration with existing systems works
- Security requirements are met

### Level 4: Quality & Documentation
- Unit and integration tests added
- User documentation created
- Technical documentation updated
- Code review completed

## Integration with Personas

### Common Persona Combinations
- **UI/UX Features**: `--persona-frontend` for design and implementation
- **Data Features**: `--persona-backend --persona-data` for backend integration
- **User Features**: `--persona-frontend --persona-testing` for user-focused features
- **Performance Features**: `--persona-performance` for optimization focus

### Persona Benefits
- **Specialized Templates**: Persona-specific planning templates
- **Focused Expertise**: Domain-specific best practices
- **Quality Validation**: Persona-specific quality checks
- **Risk Mitigation**: Domain-specific risk assessment

## Best Practices

### Right-Sizing Features
- **Single Purpose**: Each quick feature should have one clear purpose
- **User-Centric**: Focus on specific user needs and workflows
- **Measurable**: Include clear success criteria and metrics
- **Testable**: Ensure feature can be thoroughly tested

### Efficient Implementation
- **Incremental Development**: Build in logical phases
- **Early Validation**: Validate approach early with stakeholders
- **Reuse Existing**: Leverage existing components and patterns
- **Performance Conscious**: Consider performance impact from the start

### Quality Focus
- **User Testing**: Include real user validation
- **Cross-Browser**: Ensure compatibility across platforms
- **Accessibility**: Build inclusively from the start
- **Documentation**: Document both technical and user aspects

## Output Requirements

Every @quick-feature response MUST include:

```markdown
# 🚀 Quick Feature: [Feature Name]

## Feature Overview
[What's being built and why]

## User Experience
[How users will interact with this feature]

## Technical Approach
[High-level implementation strategy]

## 🤖 Agent Execution Recommendation

**Recommended Agent**: `[frontend|backend|mobile|full-stack|context-manager|multi-agent-coordinator|technical-writer|ai-engineer]`

**Agent Specialization Benefits**:
- **Domain Expertise**: [Specific domain knowledge the agent brings to this feature]
- **Pattern Recognition**: [Existing patterns and best practices the agent can apply]
- **Autonomous Development**: [Multi-component implementation the agent can handle independently]
- **Quality Integration**: [Built-in quality checks and validations the agent provides]

**Agent Dispatch Strategy**:
```bash
# After this planning is approved, execute with specialized agent:
dispatch [recommended-agent] --context="[feature-name]" [--persona-flags] [--mcp-flags]
```

**Why Agent for Quick Features?**
- ✅ **Complexity Management**: Feature involves multiple components or systems
- ✅ **Domain Specialization**: Requires specific frontend/backend/mobile expertise
- ✅ **Implementation Efficiency**: Agent can work autonomously through multi-step process
- ✅ **Context Isolation**: Keeps implementation details separate from planning conversation
- ✅ **Consistent Quality**: Agent applies established patterns and best practices

**Agent vs Command Decision**:
- **Use Agent**: Multi-component features, UI/UX work, integration requirements
- **Use @start**: Single-component changes, configuration updates, simple additions

## Implementation Phases
[Logical breakdown of development phases]

## Quality Assurance
[How quality will be ensured]

## Success Metrics
[How success will be measured]
```

## MANDATORY TASK LOG REGISTRATION

IMMEDIATELY after creating a quick feature plan, you MUST update `workflow/logbook.md`:

### Step 1: Register in Task Log Section
Add entry in **Task Log** section with exact ultra-compact format:
```markdown
`@dark-mode-toggle` | pending | /workflow/planned/dark-mode-toggle.md | Add theme switching to settings
`@export-reports` | pending | /workflow/planned/export-reports.md | Add CSV/PDF export to reports
`@user-profile-edit` | pending | /workflow/planned/user-profile-edit.md | User profile editing screen
```

**Format Rules**:
- Task name: kebab-case, descriptive but short
- Achievement goal: 1-6 words max, user benefit focused  
- No extra spaces, under 50 characters total for goal

### Step 2: Update Logbook Statistics
- Increment "Planned" count in Quick Overview
- Add to "By Type" → Quick Features counter
- Add to appropriate complexity range (typically 4-6)
- Update "Last Activity" timestamp
- Add any dependencies to Dependencies Overview

### Step 3: Check Project Structure
Before creating the feature plan, scan the **Project Structure** section in logbook.md to ensure:
- No duplicate components are being created
- Existing services/components can be reused
- UI patterns and design system consistency

## User Feedback Requirements

At the beginning of EVERY response, include:
1. Confirmation this is being treated as a quick feature
2. Brief summary of feature goals and user benefit
3. Estimated complexity and development time
4. Any concerns about scope creep or hidden complexity
5. Clear next steps for implementation

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates