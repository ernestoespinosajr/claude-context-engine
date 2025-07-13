# Flags Compatibility Matrix

## Universal Flags (All Commands)

| Flag | CE | EC | CS | Description | Token Impact |
|------|----|----|----|-----------  |--------------|
| `--plan` | ✅ | ✅ | ✅ | Show execution plan | +10% |
| `--think` | ✅ | ✅ | ✅ | Basic reasoning | +15% |
| `--uc` | ✅ | ✅ | ✅ | UltraCompressed (70% reduction) | -70% |
| `--compress` | ✅ | ✅ | ✅ | Standard compression (50% reduction) | -50% |
| `--cache` | ✅ | ✅ | ✅ | Use MCP caching | -20% |
| `--verbose` | ✅ | ✅ | ✅ | Detailed output | +25% |
| `--quiet` | ✅ | ✅ | ✅ | Minimal output | -30% |

## Command-Specific Flags

### Context Engineer Flags
| Flag | Compatible | Description | Use Case |
|------|-----------|-------------|----------|
| `--analyze-deps` | ✅ | Deep dependency analysis | Complex features |
| `--tech-stack` | ✅ | Detailed tech analysis | New projects |
| `--security-focus` | ✅ | Enhanced security review | Auth features |
| `--lang=[language]` | ✅ | Language-specific planning | Multi-lang projects |
| `--framework=[fw]` | ✅ | Framework-specific approach | Framework migration |
| `--template=[name]` | ✅ | Use specific template | Standardized features |
| `--complexity=[level]` | ✅ | Set complexity level (1-10) | Scope management |

### Execute Context Flags  
| Flag | Compatible | Description | Use Case |
|------|-----------|-------------|----------|
| `--validate` | ✅ | Strict validation mode | Production features |
| `--test` | ✅ | Include test generation | QA requirements |
| `--benchmark` | ✅ | Performance benchmarking | Performance features |
| `--incremental` | ✅ | Step-by-step implementation | Large features |
| `--rollback` | ✅ | Enable rollback capability | Risky changes |
| `--parallel` | ✅ | Parallel processing | Independent components |
| `--isolate` | ✅ | Strict file isolation | Critical features |
| `--watch` | ✅ | Continuous monitoring | Long-running tasks |

### Context Status Flags
| Flag | Compatible | Description | Use Case |
|------|-----------|-------------|----------|
| `--deep` | ✅ | Comprehensive analysis | Detailed diagnostics |
| `--metrics` | ✅ | Performance metrics | Performance monitoring |
| `--recommendations` | ✅ | Optimization suggestions | System improvement |
| `--health` | ✅ | System health check | Regular monitoring |
| `--workflow-overview` | ✅ | Show all workflows | Project management |
| `--cache-stats` | ✅ | MCP cache statistics | Performance analysis |
| `--token-metrics` | ✅ | Token usage analysis | Efficiency monitoring |

## Persona Integration

| Persona Flag | CE | EC | CS | Auto-Triggers |
|--------------|----|----|----|--------------| 
| `--persona-architect` | ✅ | ✅ | ✅ | architecture, design, patterns |
| `--persona-security` | ✅ | ✅ | ✅ | auth, security, vulnerability |
| `--persona-performance` | ✅ | ✅ | ✅ | optimize, speed, performance |
| `--persona-testing` | ✅ | ✅ | ✅ | test, validate, quality |
| `--persona-devops` | ✅ | ✅ | ✅ | deploy, pipeline, infrastructure |
| `--persona-frontend` | ✅ | ✅ | ✅ | ui, frontend, interface |
| `--persona-backend` | ✅ | ✅ | ✅ | api, backend, server |
| `--persona-mobile` | ✅ | ✅ | ✅ | mobile, ios, android |
| `--persona-ai` | ✅ | ✅ | ✅ | ai, ml, model |
| `--persona-data` | ✅ | ✅ | ✅ | data, analytics, metrics |

## MCP Integration

| MCP Flag | CE | EC | CS | Purpose | Cache Duration |
|----------|----|----|----|---------| --------------|
| `--mcp-context7` | ✅ | ✅ | ✅ | Context optimization | 1 hour |
| `--mcp-sequential` | ✅ | ✅ | ✅ | Step-by-step thinking | Session |
| `--mcp-magic` | ✅ | ✅ | ✅ | Workflow automation | 30 minutes |
| `--mcp-puppeteer` | ❌ | ✅ | ✅ | UI testing | Session |

**Aliases**:
- `--mc7` = `--mcp-context7`
- `--mseq` = `--mcp-sequential`  
- `--mmag` = `--mcp-magic`
- `--mpup` = `--mcp-puppeteer`

## Flag Combinations

### High Performance Combinations
```bash
# Ultra-efficient planning
/context-engineer "feature" --uc --cache --mcp-context7

# Fast implementation  
/execute-context feature --uc --cache --parallel

# Quick status check
/context-status --uc --cache --health
```

### Quality-Focused Combinations
```bash
# Comprehensive planning
/context-engineer "feature" --persona-architect --validate --security-focus

# Quality implementation
/execute-context feature --validate --test --benchmark --persona-testing

# Deep analysis
/context-status feature --deep --metrics --recommendations
```

### Development Workflow
```bash
# Plan with specialist
/context-engineer "auth system" --persona-security --think --plan

# Implement with validation
/execute-context auth-system --validate --test --incremental

# Monitor progress
/context-status auth-system --metrics --workflow-overview
```

## Incompatible Combinations

| Flag 1 | Flag 2 | Reason |
|--------|--------|--------|
| `--uc` | `--verbose` | Contradictory output levels |
| `--quiet` | `--think` | Contradictory verbosity |
| `--compress` | `--uc` | Redundant compression |
| `--rollback` | `--parallel` | Rollback complexity |

## Performance Impact

| Flag Category | Token Impact | Processing Time | Memory Usage |
|---------------|--------------|-----------------|--------------|
| Compression (`--uc`) | -70% | Baseline | Baseline |
| Caching (`--cache`) | -20% | -30% | +10% |
| Analysis (`--deep`) | +40% | +50% | +20% |
| MCP Integration | +15% | +25% | +15% |
| Persona Activation | +10% | +15% | +5% |

---

*Flag compatibility matrix for optimal Context Engineering usage*