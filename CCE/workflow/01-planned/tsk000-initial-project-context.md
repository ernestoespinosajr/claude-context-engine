# Initial Project Context Analysis & Intelligence Bootstrap
*Task ID: tsk000-initial-project-context*
*Context Reference: Built-in bootstrap task*
*Created: System Installation*
*Planning by: Context Engineering System v3.1.0*

## 🚀 Welcome to Context Engineering System!

This is your **first task** designed to transform the system from templates to intelligent project-specific knowledge. After completion, your logbook and dependencies will contain real information about your project.

## Task Overview

**Purpose**: Analyze your project comprehensively and populate the Context Engineering System with real project intelligence, replacing template placeholders with actual project data.

**What this task will accomplish:**
1. **Project Structure Analysis** - Map your actual codebase structure
2. **Dependency Discovery** - Identify all project dependencies and integrations  
3. **Technology Stack Detection** - Analyze your tech stack and frameworks
4. **Component Mapping** - Identify existing components, services, and modules
5. **Intelligence Population** - Update logbook.md and dependencies.md with real data
6. **First Experience** - Learn how the Context Engineering System works on your own project

## Analysis Scope

### 📁 **Project Structure Analysis**
Analyze and document:
- **Root directory structure** - Main folders and organization
- **Source code organization** - How code is structured (src/, components/, services/, etc.)
- **Configuration files** - package.json, requirements.txt, Cargo.toml, etc.
- **Documentation structure** - README, docs/, etc.
- **Build and deployment files** - Dockerfile, CI/CD configs, etc.

### 📦 **Dependency Discovery & Analysis**
Identify and catalog:
- **Runtime dependencies** - Libraries and frameworks used
- **Development dependencies** - Build tools, testing frameworks, linters
- **System dependencies** - Databases, external services, APIs
- **Integration points** - Third-party services, payment processors, authentication
- **Infrastructure dependencies** - Cloud services, hosting, CDNs

### 🏗️ **Technology Stack Detection**
Analyze and document:
- **Frontend technologies** - React, Vue, Angular, vanilla JS, CSS frameworks
- **Backend technologies** - Node.js, Python, Java, database systems
- **Mobile technologies** - React Native, native iOS/Android, Flutter
- **DevOps technologies** - Docker, CI/CD, monitoring, deployment platforms

### 🧩 **Component & Service Mapping**
Identify existing:
- **UI Components** - Reusable interface elements
- **Services** - Business logic services, API clients, utilities
- **Modules** - Feature modules, shared libraries
- **APIs** - Existing endpoints, GraphQL schemas, REST APIs
- **Database schemas** - Tables, models, data structures

## Expected Outcomes

### 📊 **Updated Logbook.md**
Replace template with:
- **Real project structure** - Actual directories and organization
- **Components registry** - Existing components discovered in your codebase
- **Services registry** - Actual services and modules found
- **Technology stack summary** - Your actual tech stack
- **Project overview metrics** - Real codebase statistics

### 📋 **Updated Dependencies.md** 
Replace template with:
- **Auto-discovered technical dependencies** - From package.json, requirements.txt, etc.
- **Integration dependencies** - APIs, services, external integrations found
- **Infrastructure dependencies** - Deployment, hosting, database dependencies
- **Development dependencies** - Build tools, testing frameworks discovered

### 🎯 **Project Intelligence Baseline**
Create foundation for:
- **Smart context recovery** - System knows your actual project structure
- **Intelligent recommendations** - Based on your real technology stack
- **Component reuse detection** - Knows what components already exist
- **Dependency conflict prevention** - Aware of existing dependency constraints

## Implementation Steps

### Phase 1: Project Discovery
1. **Scan project root** - Identify main directories and file structure
2. **Analyze package managers** - Parse package.json, requirements.txt, Cargo.toml, etc.
3. **Identify frameworks** - Detect React, Vue, Django, Express, etc.
4. **Map configuration files** - Find build configs, environment files, deployment configs

### Phase 2: Code Analysis  
1. **Component discovery** - Find reusable UI components
2. **Service identification** - Locate business logic services and utilities
3. **API mapping** - Identify existing endpoints and API structures
4. **Database analysis** - Find models, schemas, migration files

### Phase 3: Intelligence Population

#### 📊 **Logbook.md Population Instructions**
**Replace template sections with real data:**

1. **Project Structure Section** - Update with actual directory tree:
   ```markdown
   project/
   ├── [actual directories found]
   ├── src/components/           # [List actual components found]
   ├── src/services/            # [List actual services found]  
   ├── [actual package.json, requirements.txt, etc.]
   ```

2. **Components Registry** - Replace placeholder with discovered components:
   ```markdown
   **Components Registry**: 
   - [ComponentName] - [Path] - [Purpose/Description]
   - [Button] - src/components/Button.jsx - Reusable button component
   - [Modal] - src/components/Modal.vue - Modal dialog component
   ```

3. **Services Registry** - Replace placeholder with discovered services:
   ```markdown
   **Services Registry**:
   - [ServiceName] - [Path] - [Purpose/Description] 
   - [AuthService] - src/services/auth.js - Authentication and user management
   - [APIClient] - src/services/api.js - HTTP client for backend communication
   ```

4. **Technology Stack Summary** - Add to Project Evolution section:
   ```markdown
   ### Technology Stack Evolution
   **Current Stack** (discovered [date]):
   - **Frontend**: [React 18.2.0, Vue 3.x, etc.]  
   - **Backend**: [Node.js, Python Django, etc.]
   - **Database**: [PostgreSQL, MongoDB, etc.]
   - **Infrastructure**: [Docker, AWS, Vercel, etc.]
   ```

#### 📋 **Dependencies.md Population Instructions**  
**Replace all template tables with discovered dependencies:**

1. **Technical Dependencies Table** - Populate from package.json/requirements.txt:
   ```markdown
   | Dependency | Discovered During | Task ID | Reason | Status |
   |------------|-------------------|---------|---------|---------|
   | React | Bootstrap Analysis | tsk000 | Frontend framework | Installed |
   | Express | Bootstrap Analysis | tsk000 | Backend server | Installed |
   | PostgreSQL | Bootstrap Analysis | tsk000 | Primary database | Installed |
   ```

2. **Integration Dependencies** - From API calls, external services:
   ```markdown
   | Integration | Task ID | Complexity | Documentation | Status |
   |-------------|---------|------------|---------------|---------|
   | Stripe API | tsk000 | Medium | [Link to Stripe docs] | Active |
   | Auth0 | tsk000 | High | [Link to Auth0 setup] | Active |
   ```

3. **Library/Tool Dependencies** - Development and build tools:
   ```markdown
   | Library/Tool | Version | Task ID | Purpose | Installation Notes |
   |--------------|---------|---------|---------|-------------------|
   | Webpack | 5.x | tsk000 | Build tool | npm install |  
   | Jest | 29.x | tsk000 | Testing framework | npm install --save-dev |
   ```

4. **Task Dependencies Section** - Update with actual project info:
   ```markdown
   ### [Actual Project Name] 
   - **Task ID**: (Future tasks will reference this analysis)
   - **Status**: Bootstrap Complete
   - **Technical Dependencies**: [List major frameworks/libraries]
   - **Integration Dependencies**: [List external services]  
   - **Architecture Notes**: [Key architectural decisions discovered]
   ```

### Phase 4: System Validation
1. **Test context recovery** - Verify system can intelligently find project elements
2. **Validate component registry** - Ensure discovered components are properly cataloged
3. **Check dependency accuracy** - Verify all major dependencies captured
4. **First workflow test** - Create a simple follow-up task to test the system

## Quality Gates

- [ ] **Project structure completely mapped** - All major directories and organization documented
- [ ] **All dependencies discovered** - Runtime, development, and system dependencies identified
- [ ] **Technology stack documented** - Complete tech stack analysis with versions
- [ ] **Components and services cataloged** - Existing codebase elements properly registered
- [ ] **Logbook populated with real data** - No more template placeholders
- [ ] **Dependencies.md contains actual project info** - Real dependency relationships documented
- [ ] **System intelligence validated** - Context recovery works with real project data
- [ ] **First user experience completed** - User understands how the system works

## Agent Recommendations

**Recommended Agent**: `context-manager` - Specializes in information architecture and knowledge management
**Why this agent**: 
- Expert in project analysis and structure mapping
- Designed for knowledge organization and intelligence systems
- Handles complex information discovery and documentation
- Perfect for bootstrap and initialization tasks

**Dispatch Command**: 
```bash
dispatch context-manager --context="tsk000-initial-project-context" --persona-architect --mcp-context7
```

**Agent Benefits for this task**:
- **Deep Analysis**: Comprehensive project structure and dependency analysis
- **Knowledge Architecture**: Expert at organizing and structuring project information  
- **Template Population**: Skilled at transforming templates into real project intelligence
- **System Bootstrap**: Specialized in initialization and setup workflows

## 🎓 Learning Outcomes

After completing this task, you will have:
1. **Experienced the full workflow** - From dispatch through completion with documentation
2. **Seen automatic issue tracking** - How the system documents problems and solutions
3. **Understood context persistence** - How the system maintains project knowledge
4. **Created project intelligence baseline** - Real project data powering the system
5. **Ready-to-use system** - Fully configured for your specific project

## Next Steps After Completion

1. **Explore your updated logbook.md** - See your real project intelligence
2. **Review populated dependencies.md** - Understand your project's dependency landscape  
3. **Try asking project-specific questions** - Test the context recovery system
4. **Create your first real task** - Use @ask to analyze a feature or bug
5. **Experience the intelligent workflow** - See how context-aware responses work

---

**Welcome to intelligent project management with Context Engineering System!** 🚀

*This task will transform your project from template placeholders to intelligent, context-aware project management.*