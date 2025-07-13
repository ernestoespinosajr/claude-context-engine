# /execute-context Command

## Purpose
Implement planned feature with focused context & continuous validation.

## Syntax
```
/execute-context [feature-name] [flags]
```

## Enhanced Process

1. **Context Loading**: Load feature PRP & build optimized 11-layer context
2. **Auto Workflow**: Move from `/workflow/planned/` → `/workflow/in-progress/active/`
3. **Environment Setup**: Prepare development environment & dependencies
4. **Feature Implementation**: Execute w/ continuous validation & compression
5. **Isolated Development**: Only modify files related to current feature
6. **Quality Gates**: Run validation checks at each implementation phase
7. **Auto Completion**: Move to `/workflow/completed/` on successful validation
8. **Documentation**: Update feature progress & document decisions

## Flags

### Universal Flags
- `--plan`: Show implementation plan before execution
- `--think`: Show reasoning process during implementation
- `--uc`: Ultra-compressed mode (70% token reduction)
- `--compress`: Standard compression (50% token reduction)
- `--cache`: Utilize MCP caching

### Command-Specific Flags
- `--validate`: Strict validation mode
- `--test`: Include test generation
- `--benchmark`: Performance benchmarking

## Output
Implements feature & automatically manages workflow files

## Examples

```bash
# Execute planned feature
/execute-context user-authentication

# With strict validation
/execute-context real-time-chat --validate

# Include testing
/execute-context payment-processing --test --validate

# Performance-focused implementation
/execute-context admin-dashboard --benchmark --uc
```

## Workflow Integration
- Automatically moves workflow files
- Updates progress tracking
- Creates implementation logs
- Manages feature dependencies
- Triggers validation gates