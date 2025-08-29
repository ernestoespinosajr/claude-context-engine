# Context Engineering System

![Version](https://img.shields.io/badge/version-3.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

> **The smart way to manage development with Claude Code CLI**

**What it solves:** Complex tasks need deep context, simple tasks need speed. Most systems give you one or the other.

**Our solution:** Automatic intelligence that gives each task exactly the right amount of context - from lightweight 3-layer for bug fixes to full 11-layer for system architecture changes.

**Key insight:** A central project logbook provides instant context awareness, preventing duplicate work and enabling intelligent recommendations based on project history.

<p align="center">
  <img src="https://via.placeholder.com/800x400?text=Context+Engineering+System" alt="Context Engineering System" width="600">
</p>

## 🚀 Main Features

### 🧠 **Intelligent Context Discovery System (NEW!)**
- **Logbook-First Intelligence** - Always starts with project intelligence hub for instant context awareness
- **Smart Pattern Matching** - Matches user questions against task logs, components, and dependencies
- **Context Recovery** - Never lose context across sessions with intelligent task detection
- **Auto-Issue Documentation** - Automatically documents problems and fixes during execution
- **Dependency Discovery** - Real-time discovery and tracking of project dependencies

### 🎯 **Professional File Organization**
- **Dual Coding System** - `ct###-` context files + `tsk###-` task files for instant recognition
- **Numbered Workflow Directories** - 00-Context → 01-Planned → 02-In-Progress → 03-Completed
- **Context Persistence** - Permanent reference files that maintain project knowledge
- **Status Suffix Convention** - Clean completion tracking with `-completed/-failed` suffixes

### ⚡ **Core System Features**
- **Hybrid Command-Agent Architecture** - Interactive planning with autonomous execution
- **Smart Context Scaling** - 3/6/11-layer context based on task complexity  
- **8 Specialized Agents** - Domain-expert agents for autonomous implementation
- **Enhanced Command System** - ask → issue/quick-feature/feature → dispatch agent
- **Phase-by-Phase Validation** - User-controlled validation at each implementation phase
- **Self-Documenting Workflow** - Automatic issue tracking and knowledge capture
- **Advanced persona system** with specialists in security, performance, etc.
- **MCP integration** with 8 specialized modules: Context7, Sequential, Playwright, Fetch, Linear, Stripe, Supabase, and Vercel

## 📋 Prerequisites

- Claude Desktop or Claude Code CLI
- Git
- Bash 3.0+

## 💻 Installation

**Simple one-command installation:**

```bash
# Clone the repository
git clone https://github.com/user/context-engineering-system.git

# Navigate to the directory
cd context-engineering-system

# Install to your project (one command!)
./install.sh /path/to/your-project
```

**What it does:**
- Copies the complete Context Engineering System to your project
- Sets up the 5-command workflow (ask, issue, quick-feature, feature, dispatch)  
- Creates the intelligent workflow structure with automatic logbook
- Ready to use immediately with Claude Code CLI

**Installation examples:**
```bash
./install.sh .                    # Install in current directory
./install.sh ~/my-project         # Install in specific project
./install.sh /workspace/app        # Install in workspace
```

## 🚀 First-Time Setup (Essential!)

**After installation, run this ONE command to transform your project:**

```bash
# This analyzes your project and populates the system with real intelligence
dispatch context-manager --context="tsk000-initial-project-context" --persona-architect --mcp-context7
```

### What This Bootstrap Task Does:
- **🔍 Analyzes your entire project** - Structure, dependencies, technology stack
- **📊 Populates logbook.md** - Replaces templates with your actual project information  
- **📋 Updates dependencies.md** - Real dependency tracking instead of placeholders
- **🧩 Maps existing components** - Catalogs your current codebase elements
- **🎓 First user experience** - Learn the system by seeing it work on your project
- **⚡ Immediate value** - Instant project intelligence ready for use

### After Bootstrap Completion:
- **Intelligent context recovery** - System knows your actual project structure
- **Smart recommendations** - Based on your real technology stack  
- **Component reuse detection** - Prevents duplicate work on existing elements
- **Ready for real tasks** - System configured specifically for your project

**Why run this first?** The bootstrap task transforms the Context Engineering System from generic templates to intelligent, project-specific knowledge that provides immediate value.

## 🔧 Usage

The Context Engineering System uses a **hybrid command-agent approach** combining interactive planning with autonomous execution:

### Hybrid Workflow - The Revolutionary Approach

**Planning Phase (Commands)** → **Execution Phase (Agents)**
- Commands for strategic thinking and analysis
- Agents for autonomous implementation and specialized expertise

### Phase 1: Interactive Planning & Analysis

**1. Smart Analysis**
```bash
@ask "[task description]"
```
- Analyzes complexity and recommends approach
- Suggests appropriate specialized agent for execution
- Prevents duplication and identifies reusable components
- Provides ready-to-execute commands with agent recommendations

**2. Strategic Planning** (Choose based on @ask recommendation)
```bash
@issue "[bug description]"        # Simple tasks (3-layer context)
@quick-feature "[feature]"         # Medium features (6-layer context) 
@feature "[complex feature]"       # System changes (11-layer context)
```
- Creates comprehensive planning documents
- Defines requirements, architecture, and quality gates
- **Recommends appropriate agent** for autonomous execution
- Registers task in project logbook

### Phase 2: Autonomous Agent Execution

**3. Unified Task Execution** (Based on planning recommendation)
```bash
dispatch [agent] --context="[task-name]" [--persona-flags] [--mcp-flags]
```

**Available Specialized Agents:**

**Core Development:**
- `frontend` 🎨 - React/Vue/Angular UI development specialist
- `backend` ⚙️ - APIs, databases, server-side architecture expert  
- `mobile` 📱 - React Native, native features, cross-platform specialist
- `full-stack` 🌐 - End-to-end web applications integration master

**Meta & Orchestration:**
- `context-manager` 🧠 - Information architecture and knowledge management expert
- `multi-agent-coordinator` 🎯 - Multi-agent workflow orchestration specialist

**Business & Product:**  
- `technical-writer` 📝 - Technical documentation and knowledge creation specialist

**Data & AI:**
- `ai-engineer` 🤖 - AI system architecture and implementation expert

### Revolutionary Hybrid Workflow

```bash
# Step 0: First-time setup (run once after installation)
dispatch context-manager --context="tsk000-initial-project-context" --persona-architect --mcp-context7
# → Analyzes your project and populates system with real intelligence
# → Transforms templates to project-specific knowledge

# Step 1: Normal workflow example - Authentication feature
@ask "implement biometric authentication for mobile app"
# → Analysis: Complex mobile feature requiring security expertise  
# → Creates: 00-Context/ct001-biometric-authentication-mobile.md
# → Recommendation: Use mobile agent with security persona

@feature "ct001-biometric-authentication-mobile" --persona-security --persona-mobile
# → References context analysis and creates: 01-planned/tsk001-biometric-authentication-mobile.md
# → Comprehensive planning document with context integration
# → Recommends: mobile agent for implementation

dispatch mobile --context="tsk001-biometric-authentication-mobile" --persona-security --mcp-sequential
# → Mobile agent autonomously implements the complete feature with full workflow management
# → Moves to: 02-in-progress/tsk001-biometric-authentication-mobile.md (with issue tracking)
# → Handles logbook updates, file lifecycle, and phase-by-phase validation
# → Provides React Native integration, biometric APIs, security patterns
# → Completion: 03-completed/tsk001-biometric-authentication-mobile-completed.md
```

### Why This Hybrid Approach is Revolutionary

**Planning Phase Benefits:**
✅ Human strategic thinking and decision-making  
✅ Interactive analysis and requirement refinement  
✅ Project context awareness and duplication prevention  
✅ Architecture decisions with full project understanding  

**Agent Phase Benefits:**  
✅ Deep domain expertise (1000+ lines of specialized knowledge)  
✅ Autonomous implementation with complete workflow management  
✅ Mandatory logbook integration and file lifecycle tracking  
✅ Phase-by-phase validation with user control points  
✅ Clean context separation (no implementation pollution)  
✅ Consistent quality through embedded best practices

### 🔮 Future Agent Categories (Roadmap)

Our extensible agent architecture can expand to include specialized domains:

**🧠 Data & AI Specialists:**
- `data-engineer` - Data pipeline architect and ETL specialist
- `ai-engineer` - AI system deployment and integration expert
- `ml-engineer` - Machine learning model development specialist

**📊 Business & Product Experts:**
- `product-manager` - Product strategy and roadmap specialist  
- `business-analyst` - Requirements analysis and business process expert
- `ux-researcher` - User research and usability testing specialist

**🎯 Meta-Orchestration Masters:**
- `agent-organizer` - Multi-agent coordination and workflow orchestration
- `context-manager` - Context optimization and memory management expert
- `workflow-orchestrator` - Complex workflow automation specialist

**🔍 Research & Analysis Specialists:**
- `research-analyst` - Market research and competitive analysis expert
- `data-researcher` - Data analysis and insights generation specialist

This extensible architecture allows teams to add domain-specific agents as their needs evolve, maintaining the hybrid command-agent pattern while scaling expertise horizontally.

### Available Personas

- `--persona-security`: Security and authentication specialist
- `--persona-performance`: Optimization and performance specialist
- `--persona-frontend`: User interface and UX specialist
- `--persona-backend`: APIs and services specialist
- `--persona-architect`: Systems architecture specialist
- `--persona-data`: Database and modeling specialist
- `--persona-mobile`: Mobile development specialist
- `--persona-deployment`: DevOps and deployment specialist
- `--persona-testing`: Testing and QA specialist

### MCP Modules

**Core Analysis & Context:**
- `--mcp-context7`: Advanced context management and optimization
- `--mcp-sequential`: Structured thinking for complex problem solving
- `--mcp-playwright`: Web automation, testing, and browser interaction

**Integration & Services:**
- `--mcp-fetch`: Web content retrieval and external documentation analysis
- `--mcp-linear`: Project management and issue tracking integration
- `--mcp-stripe`: Payment processing and financial operations
- `--mcp-supabase`: Database operations and backend insights (read-only)
- `--mcp-vercel`: Deployment management and hosting integration

## 📁 Enhanced File Workflow & Context System

### 🔄 **Intelligent Context-First Workflow**
1. **Context Analysis**: `@ask` creates `00-Context/ct###-[task-name].md` with comprehensive analysis
2. **Task Planning**: Planning commands create `01-planned/tsk###-[task-name].md` referencing context
3. **Execution**: `dispatch` MOVES file to `02-in-progress/tsk###-[task-name].md` with issue tracking
4. **Completion**: System MOVES to `03-completed/tsk###-[task-name]-completed.md` with full documentation

### 🧠 **Context Discovery Hierarchy**
```bash
User Question → logbook.md (intelligence hub) → dependencies.md (relationships) → specific task files → context-aware response
```

### 🎯 **Professional File Organization**
```
workflow/
├── 00-Context/        # ct###-* (permanent analysis files)
├── 01-planned/        # tsk###-* (planning phase)  
├── 02-in-progress/    # tsk###-* (active development with issue tracking)
└── 03-completed/      # tsk###-*-completed/failed (final status)
```

### 📊 **Automatic Documentation**
- **Issue Tracking**: Problems and fixes documented in real-time during execution
- **Dependency Discovery**: Auto-discovered dependencies update dependencies.md
- **Context Persistence**: Never lose context across sessions with intelligent recovery
- **Pattern Learning**: System learns from every fix and documents insights

**Key Innovation**: The system maintains a central `logbook.md` that provides instant project intelligence, while automatically documenting every issue, fix, and discovery during task execution. Context files provide permanent reference while task files move through lifecycle.

## 🧠 Project Intelligence

The system's **logbook.md** acts as a central intelligence hub with ultra-compact tracking:

- **📊 Real-time Statistics**: Success rates, complexity trends, active work
- **📋 Task Log Registry**: Comprehensive task tracking with ultra-compact format
- **🏗️ Project Structure Awareness**: Components and services registry prevents duplicates
- **🔍 Pattern Recognition**: Learns what approaches work vs. what fails  
- **🚫 Duplication Prevention**: Checks existing work before creating new tasks
- **📈 Progress Tracking**: Visual insight into project evolution
- **🎯 Smart Recommendations**: @ask uses logbook data for intelligent guidance

**Example Task Log entries:**
```markdown
## Task Log
`tsk001-user-auth-biometrics` | in-progress | /workflow/02-in-progress/tsk001-user-auth-biometrics.md | Add biometric login system | ct001-user-auth-biometrics
`tsk002-login-ios-bug` | completed | /workflow/03-completed/tsk002-login-ios-bug-completed.md | Fix login button not responding on iOS | ct002-login-ios-bug  
`tsk003-dark-mode-toggle` | pending | /workflow/01-planned/tsk003-dark-mode-toggle.md | Add theme switching to settings | ct003-dark-mode-toggle

## Context Files
`ct001-user-auth-biometrics` | 2025-01-29 | /workflow/00-Context/ct001-user-auth-biometrics.md | Analysis Complete
`ct002-login-ios-bug` | 2025-01-29 | /workflow/00-Context/ct002-login-ios-bug.md | Analysis Complete
`ct003-dark-mode-toggle` | 2025-01-29 | /workflow/00-Context/ct003-dark-mode-toggle.md | Analysis Complete
```

## 📂 Project Structure

```
project/
├── .claude/                 # Configuration for Claude Code CLI
│   ├── commands/            # Available commands (ask, issue, quick-feature, feature, dispatch)
│   ├── agents/              # 8 specialized agents for autonomous execution
│   └── shared/              # Shared configuration files
├── workflow/                # Intelligent workflow directory with dual coding
│   ├── 00-Context/          # ct###-* Context analysis files (permanent reference)
│   ├── 01-planned/          # tsk###-* Task planning files (moves through lifecycle)
│   ├── 02-in-progress/      # tsk###-* Active development with issue tracking
│   ├── 03-completed/        # tsk###-*-completed/failed Final status with full docs
│   ├── logbook.md           # Project intelligence hub with context discovery
│   └── dependencies.md      # Auto-discovered dependency tracking
└── ...                      # Project files
```

## 🤝 Contributing

To contribute to the development of this system:

1. Fork the repository
2. Create a branch for your feature (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is under the MIT License - see the [LICENSE](LICENSE) file for more details.

## 📋 Changelog

### Version 3.1.0 (Latest) - Intelligent Context Discovery & Self-Documenting Workflow
**Revolutionary Context Management with Zero Context Loss**

**🎯 Major Breakthrough:**
- **Intelligent Context Discovery System**: Logbook-first intelligence hierarchy that never loses context
- **Professional Dual Coding System**: `ct###-` context files + `tsk###-` task files for instant recognition  
- **Numbered Workflow Directories**: 00-Context → 01-Planned → 02-In-Progress → 03-Completed
- **Self-Documenting Execution**: Automatic issue tracking and dependency discovery during task execution
- **Context Persistence**: Never lose context across sessions with intelligent pattern matching
- **Enhanced Dependencies Tracking**: Real-time discovery and documentation of all project dependencies

**🧠 Game-Changing Intelligence Features:**
- **Logbook-First Context Recovery**: Always starts with project intelligence hub for instant awareness
- **Smart Pattern Matching**: Matches user questions against task logs, components, and dependencies  
- **Auto-Issue Documentation**: Problems and fixes automatically documented during execution
- **Dependency Discovery**: Real-time detection and tracking of technical/integration dependencies
- **Context Persistence Checkpoints**: Maintains context across all sessions and interruptions
- **Professional File Organization**: Sequential numbering with clear type recognition

**📈 Revolutionary Workflow Benefits:**
- **Zero Context Loss**: Intelligent context recovery prevents lost productivity from session breaks
- **Self-Healing Documentation**: System automatically captures every issue, fix, and discovery
- **Project Intelligence**: Centralized logbook provides instant project overview and pattern recognition
- **Professional Organization**: Clean file structure with dual coding system for enterprise projects  
- **Context-Aware Responses**: Every interaction leverages full project history and context
- **Automated Learning**: System learns from every fix and documents insights for future reference

**🔧 Technical Improvements:**
- **Enhanced Logbook Structure**: Dual tracking for context files and task files with relationships
- **Improved Dependencies.md**: Auto-discovery tables for technical, integration, and tool dependencies
- **Context Recovery System**: Universal pattern matching and intelligent context restoration
- **Issue Tracking Templates**: Built-in problem/solution documentation during task execution
- **Professional Naming Convention**: Sequential numbering with status suffixes for clean organization

**💼 Enterprise-Ready Features:**
- **Professional Project Management**: Sequential task/context numbering for large-scale projects
- **Comprehensive Documentation**: Every fix, decision, and discovery automatically captured
- **Team Collaboration Ready**: Clear file organization and complete context tracking for teams
- **Scalable Architecture**: Handles dozens of concurrent tasks with organized workflow structure

### Version 3.0.1 - Unified Dispatch System
**Streamlined Command Architecture with Complete Workflow Integration**

**🎯 Major Breakthrough:**
- **Unified Dispatch Command**: Single execution command combining agent specialization with complete workflow management
- **8 Specialized Agents**: Frontend, Backend, Mobile, Full-Stack, Context-Manager, Multi-Agent-Coordinator, Technical-Writer, AI-Engineer
- **Mandatory Workflow Compliance**: All agents enforce logbook integration, file lifecycle, and phase validation
- **Eliminated Redundancy**: Removed start command - dispatch now handles all execution with agent specialization
- **Enhanced MCP Integration**: Updated Playwright MCP replacing Puppeteer with comprehensive browser automation
- **Extensible Agent Architecture**: Foundation for future agent categories (Data/AI, Business/Product, Meta-Orchestration)

**🚀 Game-Changing Features:**
- **Unified Task Execution**: Single dispatch command handles both agent specialization and complete workflow management
- **Mandatory Workflow Compliance**: All agents enforce logbook updates, file lifecycle, and validation checkpoints
- **Deep Domain Expertise**: Each agent contains 1000+ lines of specialized knowledge and patterns
- **Complete Lifecycle Management**: From task initialization to completion documentation and statistics
- **Quality Assurance**: Built-in best practices, testing standards, and security compliance
- **Phase-by-Phase Control**: User validation required between implementation phases

**📈 Enhanced Capabilities:**
- **Agent Recommendations**: Commands now suggest appropriate agents for task execution
- **Specialized Knowledge**: Domain-specific implementation patterns and best practices
- **Complete Workflow Integration**: Agents handle logbook updates, file management, and completion tracking
- **Mandatory Quality Gates**: Agent-specific quality requirements enforced for every execution
- **Performance Optimization**: Agents optimize for their specific technology domains
- **Future Extensibility**: Architecture ready for additional specialized agents

**🔧 Technical Improvements:**
- **8 Complete Agent Configurations**: Full implementation with mandatory workflow compliance
- **Unified Dispatch Command**: Single command for all task execution with agent specialization
- **Eliminated Redundancy**: Removed start command to prevent confusion and duplication
- **Updated MCP Configuration**: Playwright integration with comprehensive capabilities
- **Enhanced Documentation**: Complete agent architecture and usage documentation
- **Mandatory Compliance**: All agents enforce identical workflow management requirements

**💼 Real-World Impact:**
- **Development Team Efficiency**: 10x productivity boost through specialized autonomous agents
- **Code Quality**: Consistent implementation of best practices across all domains
- **Context Management**: Clean conversation flows without implementation clutter
- **Scalable Architecture**: Foundation for enterprise-level multi-agent coordination

### Version 2.5.5
**MCP Integration Synchronization Update**

**🎯 Key Improvements:**
- **MCP Flag Validation**: Synchronized all MCP flags with actual available servers in `.mcp.json`
- **Removed Non-Existent Modules**: Eliminated `--mcp-magic` references (server not available)
- **Added 5 New MCP Integrations**: `--mcp-fetch`, `--mcp-linear`, `--mcp-stripe`, `--mcp-supabase`, `--mcp-vercel`
- **Enhanced @ask Command**: Now provides copy-paste ready commands with accurate MCP recommendations
- **Updated Documentation**: All workflow examples now use only verified, working MCP servers

**📈 Benefits:**
- 100% accurate MCP flag recommendations in @ask command
- No more failed commands due to non-existent MCP servers
- Expanded integration capabilities with 8 total MCP modules
- Better task-to-MCP matching for optimal workflow enhancement

**🔧 What Changed:**
- **Removed**: All references to `--mcp-magic` (non-existent server)
- **Added**: Documentation for `fetch`, `linear`, `stripe`, `supabase`, `vercel` MCP modules
- **Updated**: All command examples in `ask.md`, `mcp.yml`, and `flags.yml`
- **Enhanced**: MCP selection logic with proper use cases and token impact assessments

### Version 2.5.2
**Logbook Optimization Update**

**🎯 Key Improvements:**
- **Streamlined Logbook Structure**: Removed redundant task breakdown sections that duplicated information already captured in the ultra-compact Task Log
- **Optimized Task Log Positioning**: Moved the Task Log section after Project Structure for better organization, placing the most frequently updated content in logical order
- **Enhanced Focus**: Simplified logbook to focus on the essential ultra-compact format: `@taskname` | Status | Path | Achievement Goal
- **Verified Command Consistency**: Confirmed all 5 commands (@ask, @issue, @quick-feature, @feature, @start) follow identical ultra-compact logbook update behavior

**📈 Benefits:**
- Faster context loading for Claude Code CLI
- Cleaner, more focused project intelligence hub
- Improved logbook maintainability and readability
- Consistent task tracking across all workflow commands

**🔧 What Changed:**
- Removed: Redundant "In Progress Tasks", "Recently Planned", "Recently Completed", and "Task Categories Summary" sections
- Reorganized: Task Log now appears after Project Structure section
- Optimized: Logbook now focuses on core intelligence without information duplication

## 📚 Additional Documentation

- [11-layer architecture guide](docs/context-engine-glossary.md)
- [Commands reference](docs/commands-reference.md)
- [Flags matrix](docs/flags-matrix.md)
- [Token metrics guide](docs/token-metrics.md)