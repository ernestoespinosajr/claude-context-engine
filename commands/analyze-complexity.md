## Analizar Complejidad de Tareas

EXECUTE this workflow to analyze task complexity with research-backed insights:

### STEP 1: Task Selection
Identify tasks to analyze:
- **All tasks**: Analyze entire backlog from claude_tasks.md
- **Specific task**: Analyze single task by name
- **Category**: Analyze tasks in specific category (UI, Backend, etc.)
- **Phase**: Analyze Phase 1 or Phase 2 tasks only

### STEP 2: Research Phase (CRITICAL)
For each task, conduct web research using web_search:
- Search for "React Native [task topic] best practices implementation"
- Search for "Expo [specific feature] development complexity"
- Research common challenges and pitfalls
- Identify required dependencies and setup complexity
- Find time estimates from development communities

### STEP 3: Complexity Analysis
Based on research findings, evaluate each task on:

**Technical Complexity (1-10 scale):**
- 1-3: Simple, straightforward implementation
- 4-6: Moderate, requires some research/setup
- 7-8: Complex, multiple moving parts
- 9-10: Very complex, high risk of blockers

**Research Required (1-5 scale):**
- 1: Well-known patterns, clear documentation
- 2: Some investigation needed
- 3: Moderate research required
- 4: Significant research and planning
- 5: Extensive research, experimental

**Dependency Risk (1-5 scale):**
- 1: No external dependencies
- 2: Common, well-supported libraries
- 3: Some third-party dependencies
- 4: Complex integrations required
- 5: High-risk dependencies or custom solutions

### STEP 4: Update claude_tasks.md
Add complexity scores to each analyzed task:

```
### 🔍 [TASK_NAME] - [PRIORITY] - Phase [1/2]
**Complexity Score**: [X/10] ⭐ (Technical: X | Research: X | Dependencies: X)
**Research Findings**:
- Key insight 1 from web research
- Challenge identified: [specific issue found]
- Recommended approach: [best practice discovered]
- Dependencies required: [list from research]
- Estimated effort: [X hours/days based on research]
**Expansion Recommended**: [YES/NO] - [reasoning]
**Risk Factors**: [potential blockers found in research]
```

### STEP 5: Generate Complexity Report
Create complexity summary:

```
## 📊 COMPLEXITY ANALYSIS REPORT
**Analysis Date**: [Current Date]
**Tasks Analyzed**: [Number]

### 🔴 HIGH COMPLEXITY (7-10)
[List tasks requiring careful planning]

### 🟡 MEDIUM COMPLEXITY (4-6)  
[List tasks needing moderate attention]

### 🟢 LOW COMPLEXITY (1-3)
[List straightforward tasks]

### 📋 RECOMMENDATIONS
- **Expand immediately**: [Tasks needing subdivision]
- **Research first**: [Tasks requiring more investigation]
- **Quick wins**: [Low complexity tasks for momentum]
- **Phase adjustments**: [Tasks that might need phase changes]
```

### STEP 6: Memory Storage
Execute `openmemory:add-memory` with:
"Complexity analysis completed. High-risk tasks: [list]. Research insights: [key findings]"

ALWAYS provide actionable recommendations based on research findings.
