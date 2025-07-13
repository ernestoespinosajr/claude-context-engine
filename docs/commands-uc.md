# Commands Reference - UltraCompressed

## Core Commands

### `/context-engineer` - Feature Planning
**Purpose**: Plan & analyze features w/ context optimization  
**Syntax**: `/context-engineer "feature" [flags]`

**Process**: Analysis → Context Build → Token Opt → PRP Gen → Plan Create  
**Output**: Feature PRP → `/workflow/planned/[feature].md`

**Flags**:
- `--plan` - Show impl plan
- `--uc` - 70% token reduction  
- `--persona-X` - Specialist mode
- `--mcp-X` - Tool integration
- `--think` - Show reasoning

**Examples**:
```bash
/context-engineer "auth system" --persona-security --uc
/context-engineer "optimize db" --persona-performance --mcp-context7
```

### `/execute-context` - Implementation  
**Purpose**: Implement planned features w/ validation  
**Syntax**: `/execute-context [feature] [flags]`

**Process**: Load PRP → Move Workflow → Setup → Implement → Validate → Complete  
**Output**: Feature impl + workflow automation

**Flags**:
- `--validate` - Strict validation
- `--test` - Include testing
- `--mcp-X` - Tool integration  
- `--uc` - Compressed mode

**Examples**:
```bash
/execute-context auth-system --validate --test
/execute-context ui-components --mcp-puppeteer --uc
```

### `/context-status` - Monitoring
**Purpose**: Monitor feature health & project status  
**Syntax**: `/context-status [feature] [flags]`

**Process**: Health Check → Workflow Status → Deps → Quality → Metrics → Report  
**Output**: Status report w/ recommendations

**Flags**:
- `--deep` - Comprehensive analysis
- `--metrics` - Show performance data
- `--health` - System health check
- `--uc` - Compressed report

**Examples**:
```bash
/context-status --health --metrics
/context-status auth-system --deep --persona-security
```

## Flag Matrix

| Flag | CE | EC | CS | Effect |
|------|----|----|-------|--------|
| `--uc` | ✅ | ✅ | ✅ | 70% token reduction |
| `--plan` | ✅ | ✅ | ✅ | Show execution plan |
| `--think` | ✅ | ✅ | ✅ | Show reasoning |
| `--validate` | ✅ | ✅ | ✅ | Strict validation |
| `--test` | ✅ | ✅ | ❌ | Include testing |
| `--persona-X` | ✅ | ✅ | ✅ | Specialist mode |
| `--mcp-X` | ✅ | ✅ | ✅ | Tool integration |

## Persona Integration

| Persona | Symbol | Trigger Keywords | Best For |
|---------|--------|------------------|----------|
| architect | 🏗️ | design, structure, patterns | System design |
| security | 🔒 | auth, secure, vulnerability | Security features |
| performance | ⚡ | optimize, speed, cache | Performance work |
| testing | 🧪 | test, validate, quality | QA & testing |
| devops | 🚀 | deploy, pipeline, infra | Deployment |
| frontend | 🎨 | ui, interface, ux | UI development |
| backend | ⚙️ | api, server, db | Backend work |
| mobile | 📱 | mobile, ios, android | Mobile dev |

## MCP Integration

| MCP | Use Case | Auto-Trigger | Cache |
|-----|----------|--------------|-------|
| Context7 | Context optimization | Context >75% | 1h |
| Sequential | Complex problems | Multi-step tasks | Session |
| Magic | Automation | Repetitive patterns | 30min |
| Puppeteer | UI testing | Frontend validation | Session |

## Workflow States

```
planned/ → in-progress/active/ → completed/successful/
        ↘ in-progress/paused/ → in-progress/active/
```

**Auto-Movement**:
- `CE` → Creates in `planned/`
- `EC` → Moves to `in-progress/active/`  
- Success → Moves to `completed/successful/`

## Token Efficiency

**UC Mode Triggers**:
- Context usage >75%
- Long sessions >2h
- Large codebases >10k files

**Reduction Targets**:
- Headers: 60-80%
- Content: 70-75%
- Overall: ~70%

**Symbols**: ✅❌⚠️ℹ️🔄⏳⚡🔒📁📄🔧🧪  
**Abbrev**: cfg impl perf ops val env auth db

---

*UltraCompressed reference optimized for token efficiency*