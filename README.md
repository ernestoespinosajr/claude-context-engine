# Context Engineering System

![Version](https://img.shields.io/badge/version-2.5.1-blue)
![License](https://img.shields.io/badge/license-MIT-green)

> **The smart way to manage development with Claude Code CLI**

**What it solves:** Complex tasks need deep context, simple tasks need speed. Most systems give you one or the other.

**Our solution:** Automatic intelligence that gives each task exactly the right amount of context - from lightweight 3-layer for bug fixes to full 11-layer for system architecture changes.

**Key insight:** A central project logbook provides instant context awareness, preventing duplicate work and enabling intelligent recommendations based on project history.

<p align="center">
  <img src="https://via.placeholder.com/800x400?text=Context+Engineering+System" alt="Context Engineering System" width="600">
</p>

## 🚀 Main Features

- **Smart Context Scaling** - 3/6/11-layer context based on task complexity
- **Automatic Project Intelligence** - Central logbook provides instant context awareness
- **Simplified 5-Command System** - ask → issue/quick-feature/feature → start
- **Phase-by-Phase Validation** - User-controlled validation at each implementation phase
- **Ultra-Compact Task Tracking** - Token-efficient logbook with comprehensive task registry
- **Automated Workflow Management** - Files move automatically through planned → in-progress → completed
- **Duplication Prevention** - Project structure awareness prevents redundant work
- **Historical Pattern Recognition** - Learns from previous successes and failures
- **Advanced persona system** with specialists in security, performance, etc.
- **MCP integration** with Context7, Sequential, Magic, and Puppeteer modules

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

The Context Engineering System uses a simple 5-command approach that scales context based on task complexity:

### Workflow Commands

**1. Smart Analysis**
```
@ask "[task description]"
```
- Checks project logbook for similar work
- Analyzes complexity and suggests approach
- Prevents duplication and identifies reusable components
- Recommends the right command for your task

**2. Task Creation** (Choose based on @ask recommendation)
```
@issue "[bug description]"        # Simple tasks (3-layer context)
@quick-feature "[feature]"         # Medium features (6-layer context) 
@feature "[complex feature]"       # System changes (11-layer context)
```

**3. Universal Execution**
```
@start "[task-name]"
```
- Executes any planned task with appropriate context level
- **Phase validation** - asks "test/continue/pause" after each phase
- **Progress tracking** - automatic ✅ markers and summaries
- **File management** - moves tasks through workflow directories
- Updates project logbook automatically

### Recommended Workflow

1. **Always start with @ask** for unfamiliar tasks
2. **Follow the recommendation** - use suggested command
3. **Execute with @start** when ready to implement

```bash
# Example workflow
@ask "add user authentication with biometrics"
# → Recommends: @feature (complex, security-focused)
@feature "add user authentication with biometrics" --persona-security
@start "user-authentication-biometrics"
```

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

- `--mcp-context7`: Improves context management with Context7
- `--mcp-sequential`: Enables sequential thinking for complex problems
- `--mcp-magic`: Activates advanced code generation capabilities
- `--mcp-puppeteer`: Enables web automation and interaction

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

## 📚 Additional Documentation

- [11-layer architecture guide](docs/context-engine-glossary.md)
- [Commands reference](docs/commands-reference.md)
- [Flags matrix](docs/flags-matrix.md)
- [Token metrics guide](docs/token-metrics.md)