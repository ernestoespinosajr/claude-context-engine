# Context Engineering System

![Version](https://img.shields.io/badge/version-2.5.5-blue)
![License](https://img.shields.io/badge/license-MIT-green)

> **The smart way to manage development with Claude Code CLI**

**What it solves:** Complex tasks need deep context, simple tasks need speed. Most systems give you one or the other.

**Our solution:** Automatic intelligence that gives each task exactly the right amount of context - from lightweight 3-layer for bug fixes to full 11-layer for system architecture changes.

**Key insight:** A central project logbook provides instant context awareness, preventing duplicate work and enabling intelligent recommendations based on project history.

<p align="center">
  <img src="https://via.placeholder.com/800x400?text=Context+Engineering+System" alt="Context Engineering System" width="600">
</p>

## 🚀 Main Features

- **Hybrid Command-Agent Architecture** - Interactive planning with autonomous execution
- **Smart Context Scaling** - 3/6/11-layer context based on task complexity  
- **Specialized Agent System** - 5 domain-expert agents for autonomous implementation
- **Automatic Project Intelligence** - Central logbook provides instant context awareness
- **Enhanced Command System** - ask → issue/quick-feature/feature → dispatch agent
- **Phase-by-Phase Validation** - User-controlled validation at each implementation phase
- **Ultra-Compact Task Tracking** - Token-efficient logbook with comprehensive task registry
- **Automated Workflow Management** - Files move automatically through planned → in-progress → completed
- **Duplication Prevention** - Project structure awareness prevents redundant work
- **Historical Pattern Recognition** - Learns from previous successes and failures
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
- Sets up the 5-command workflow (ask, issue, quick-feature, feature, start)  
- Creates the intelligent workflow structure with automatic logbook
- Ready to use immediately with Claude Code CLI

**Installation examples:**
```bash
./install.sh .                    # Install in current directory
./install.sh ~/my-project         # Install in specific project
./install.sh /workspace/app        # Install in workspace
```

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

**3. Agent Dispatch** (Based on planning recommendation)
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
# Complete example: Authentication feature
@ask "implement biometric authentication for mobile app"
# → Analysis: Complex mobile feature requiring security expertise
# → Recommendation: Use mobile agent with security persona

@feature "biometric-authentication" --persona-security --persona-mobile
# → Creates comprehensive planning document
# → Recommends: mobile agent for implementation

dispatch mobile --context="biometric-authentication" --persona-security --mcp-sequential
# → Mobile agent autonomously implements the complete feature
# → Handles React Native integration, biometric APIs, security patterns
# → Provides milestone updates without cluttering main conversation
```

### Why This Hybrid Approach is Revolutionary

**Planning Phase Benefits:**
✅ Human strategic thinking and decision-making  
✅ Interactive analysis and requirement refinement  
✅ Project context awareness and duplication prevention  
✅ Architecture decisions with full project understanding  

**Agent Phase Benefits:**  
✅ Deep domain expertise (1000+ lines of specialized knowledge)  
✅ Autonomous implementation without constant oversight  
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

## 📁 File Workflow

1. **Planning**: Analysis commands create a file in `workflow/planned/[feature-name].md`
2. **Implementation**: `@start` MOVES (doesn't duplicate) the file to `workflow/in-progress/[feature-name].md`
3. **Completion**: Upon completion, the system MOVES the file to `workflow/completed/` with status prefix:
   - Success: `done-[feature-name].md`
   - Failure: `fail-[feature-name].md`

**Key Innovation**: The system maintains a central `logbook.md` that provides instant project context, preventing duplicate work and enabling intelligent recommendations. Files move (never duplicate) between directories with automatic status tracking.

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
`@user-auth-biometrics` | in-progress | /workflow/in-progress/user-auth-biometrics.md | Add biometric login system
`@issue-login-ios-bug` | complete without issues | /workflow/completed/done-issue-login-ios-bug.md | Fix login button not responding on iOS
`@dark-mode-toggle` | pending | /workflow/planned/dark-mode-toggle.md | Add theme switching to settings
```

## 📂 Project Structure

```
project/
├── .claude/                 # Configuration for Claude Code CLI
│   ├── commands/            # Available commands (ask, issue, quick-feature, feature, start)
│   └── shared/              # Shared configuration files
├── workflow/                # Simplified workflow directory
│   ├── planned/             # Tasks ready for implementation
│   ├── in-progress/         # Tasks currently in development
│   ├── completed/           # All completed tasks (done-* or fail-*)
│   ├── logbook.md           # Automatic project activity log and intelligence hub
│   └── dependencies.md      # Dependency registry
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

### Version 3.0.0 (Latest) - Hybrid Command-Agent Revolution
**Revolutionary Hybrid Architecture Implementation**

**🎯 Major Breakthrough:**
- **Hybrid Command-Agent System**: Revolutionary architecture combining interactive planning with autonomous execution
- **5 Specialized Agents**: Frontend, Backend, Mobile, Full-Stack, and Mobile-Full-Stack domain experts
- **Agent Dispatch System**: Seamless handoff from command planning to agent implementation
- **Enhanced MCP Integration**: Updated Playwright MCP replacing Puppeteer with comprehensive browser automation
- **Extensible Agent Architecture**: Foundation for future agent categories (Data/AI, Business/Product, Meta-Orchestration)

**🚀 Game-Changing Features:**
- **Planning-Execution Separation**: Commands for strategic thinking, agents for autonomous implementation
- **Deep Domain Expertise**: Each agent contains 1000+ lines of specialized knowledge and patterns
- **Context Isolation**: Clean separation between planning conversation and implementation details
- **Quality Assurance**: Built-in best practices, testing standards, and security compliance
- **Autonomous Workflows**: Multi-step implementation without constant human oversight

**📈 Enhanced Capabilities:**
- **Agent Recommendations**: Commands now suggest appropriate agents for task execution
- **Specialized Knowledge**: Domain-specific implementation patterns and best practices
- **Performance Optimization**: Agents optimize for their specific technology domains
- **Integration Protocols**: Seamless coordination between agents and existing command system
- **Future Extensibility**: Architecture ready for Data/AI, Business, and Meta-Orchestration agents

**🔧 Technical Improvements:**
- **5 Complete Agent Configurations**: Full implementation with specialized workflows
- **Agent Dispatch Command**: New `dispatch` command for agent execution
- **Updated MCP Configuration**: Playwright integration with comprehensive capabilities
- **Enhanced Documentation**: Complete agent architecture and usage documentation
- **Workflow Integration**: Seamless integration with existing Context Engineering workflow

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