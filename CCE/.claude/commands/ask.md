# Ask Command - Smart Task Consultation

**Purpose**: Analyze task complexity, suggest appropriate approach, and provide intelligent recommendations for features, bugs, and improvements.

---

@include shared/universal-constants.yml#Universal_Legend

## Command Execution
Execute: immediate. --plan→show plan first
Legend: Generated based on symbols used in command
Purpose: "[Analyze][Task] in $ARGUMENTS"

Intelligent task analysis and routing system that prevents duplication, suggests optimal approaches, and provides context-aware recommendations.

@include shared/flag-inheritance.yml#Universal_Always
@include shared/critical-thinking.yml#Critical_Thinking_Framework

Examples:
- `@ask "implement user authentication with biometrics"` - Complex feature analysis
- `@ask "fix login button not responding on iOS"` - Bug analysis and routing
- `@ask "add dark mode toggle to settings"` - UI/UX feature consultation
- `@ask "optimize database queries for better performance"` - Performance improvement analysis

## Process

### 1. Task Intelligence & Analysis

#### Logbook Analysis (Priority 1)
- **Quick Scan**: First check `workflow/logbook.md` for instant project overview
- **Pattern Recognition**: Identify similar completed tasks and their outcomes
- **Success/Failure Analysis**: Learn from previous task patterns
- **Dependency Awareness**: Understand current project dependencies and conflicts

#### Historical Context Check (Priority 2)
- **Detailed Search**: If needed, search individual task files for detailed implementation patterns
- **Duplication Prevention**: Identify existing components, patterns, or solutions that can be reused
- **Knowledge Mining**: Extract lessons learned from previous similar tasks
- **Component Mapping**: Map reusable components and architectural decisions

#### Complexity Assessment
- **Scope Analysis**: Understand the full scope and impact of the requested task
- **Technical Complexity**: Evaluate technical challenges and requirements
- **Cross-System Impact**: Assess how the task affects other parts of the system
- **Resource Requirements**: Estimate time, skills, and resources needed

#### Context Classification
Using smart analysis to determine task category:

**Bug Fix Indicators:**
- Error messages, crashes, or broken functionality
- "fix", "bug", "issue", "broken", "not working"
- Specific platform or browser issues
- Performance degradation

**Quick Feature Indicators:**
- UI/UX changes, simple additions
- "add", "toggle", "button", "theme", "style"
- Single-screen or component changes
- Configuration or settings changes

**Complex Feature Indicators:**
- New system integration, multi-component features
- "authentication", "payment", "real-time", "sync"
- Cross-platform requirements
- Database schema changes

### 2. Smart Recommendations

#### Command Route Suggestion
```markdown
## Recommendation Analysis

### Task Classification: [Bug Fix | Quick Feature | Complex Feature]

**Complexity Score**: [1-10]
- Technical Complexity: [1-10]
- Integration Complexity: [1-10] 
- Testing Complexity: [1-10]
- Time Investment: [1-10]

**Recommended Command**: `@[issue|quick-feature|feature]`

**Reasoning**: [Detailed explanation of why this classification and command]
```

#### Persona & Subagent Suggestions
Based on task analysis, recommend:
- **Primary Persona**: Most relevant specialist (e.g., --persona-security for auth)
- **Secondary Persona**: Supporting specialist if needed
- **Subagent Alternative**: When isolated task execution would be better
- **Hybrid Approach**: Combination of approaches for complex scenarios

#### Historical Context Integration
```markdown
## Similar Previous Work

### Found Implementations:
- **[Feature/Task Name]** (Status: Completed/In-Progress)
  - Location: `workflow/[directory]/[filename].md`
  - Similarity: [High|Medium|Low]
  - Reusable Components: [List of reusable parts]
  - Lessons Learned: [Key insights from previous implementation]

### Reuse Opportunities:
- **Components**: [List of existing components that can be reused]
- **Patterns**: [Architectural patterns already established]
- **Dependencies**: [Shared dependencies that are already implemented]
```

### 3. Context-Aware Analysis

#### System Integration Points
- **Affected Components**: List all system components that will be touched
- **API Interfaces**: Existing APIs that need modification or new ones required
- **Database Changes**: Schema modifications or new tables needed
- **Security Implications**: Security considerations and requirements

#### Risk Assessment
- **Technical Risks**: Potential technical challenges and solutions
- **Integration Risks**: Risk of breaking existing functionality
- **Performance Risks**: Potential performance impact and mitigation
- **User Experience Risks**: UX considerations and usability impact

### 4. Alternative Approaches

#### Multiple Solution Paths
For each analyzed task, provide 2-3 alternative approaches:

```markdown
## Alternative Approaches

### Approach 1: [Name] (Recommended)
- **Method**: [High-level approach description]
- **Pros**: [Benefits and advantages]
- **Cons**: [Limitations and trade-offs]
- **Estimated Effort**: [Time/complexity estimate]

### Approach 2: [Name] (Alternative)
- **Method**: [Alternative approach description]
- **Pros**: [Benefits and advantages]  
- **Cons**: [Limitations and trade-offs]
- **Estimated Effort**: [Time/complexity estimate]

### Approach 3: [Name] (Minimal)
- **Method**: [Minimal viable approach]
- **Pros**: [Benefits and advantages]
- **Cons**: [Limitations and trade-offs]
- **Estimated Effort**: [Time/complexity estimate]
```

## Output Format

The response MUST follow this structure:

```markdown
# Task Analysis: [Task Description]

## 🎯 Quick Recommendation
**Command**: `@[issue|quick-feature|feature] "[task-name]" [--flags]`
**Reasoning**: [Brief explanation]

## 🔍 Analysis Summary
- **Complexity**: [1-10]
- **Category**: [Bug Fix | Quick Feature | Complex Feature]
- **Estimated Time**: [Time estimate]
- **Risk Level**: [Low | Medium | High]

## 📚 Historical Context
[Results from previous work search - what exists, what can be reused]

## 🧠 Recommended Approach
[Detailed recommendation with persona suggestions]

## 🔀 Alternative Options
[2-3 alternative approaches with trade-offs]

## ⚠️ Critical Considerations
[Important factors to consider before starting]

## 🚀 Next Steps
1. [Specific next steps if recommendation is accepted]
2. [What to prepare before starting]
3. [Dependencies to verify]
```

## Smart Features

### Auto-Discovery
- **Component Scanning**: Automatically scan codebase for existing similar components
- **Dependency Analysis**: Analyze package.json, requirements.txt, etc. for relevant dependencies
- **Pattern Recognition**: Identify established patterns in the codebase
- **Architecture Awareness**: Understand current system architecture and constraints

### Intelligence Integration
- **Learning from History**: Improve recommendations based on past project outcomes
- **Context Optimization**: Suggest the optimal context level for the task
- **Resource Optimization**: Recommend the most efficient approach based on available resources
- **Quality Prediction**: Predict potential quality issues based on similar past implementations

## Important Behaviors

### Before Any Recommendation
1. **Always check logbook first** for instant project context and similar tasks
2. **Search existing work** in workflow directories if deeper analysis needed
3. **Check for similar components** in the codebase  
4. **Identify reusable patterns** and established practices
5. **Assess true complexity** beyond surface requirements

### Critical Questions to Address
1. "Have we solved something similar before?"
2. "What existing components can be reused?"
3. "What's the simplest approach that meets requirements?"
4. "What are the hidden complexities not immediately obvious?"
5. "How does this fit with our existing architecture?"

### User Feedback Requirements
At the beginning of EVERY response, include:
1. Brief confirmation of what task is being analyzed
2. High-level complexity assessment (Simple/Medium/Complex)
3. Whether similar work was found in the project history
4. Primary recommendation with reasoning
5. Any critical considerations or warnings

@include shared/research-patterns.yml#Mandatory_Research_Flows

@include shared/universal-constants.yml#Standard_Messages_Templates