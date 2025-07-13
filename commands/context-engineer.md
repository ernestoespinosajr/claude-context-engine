# /context-engineer Command

## Purpose
Analyze & create comprehensive feature implementation plan with intelligent context architecture.

## Syntax
```
/context-engineer "[feature description]" [flags]
```

## Enhanced Process

1. **Feature Analysis**: Detect project type, language, framework & dependencies
2. **Context Research**: Build 11-layer context architecture focused on feature
3. **Token Optimization**: Apply UltraCompressed mode if context >75%
4. **PRP Generation**: Create Product Requirements Prompt w/ implementation blueprint
5. **Dependency Mapping**: Identify feature dependencies & conflicts
6. **Template Selection**: Choose appropriate templates based on tech stack
7. **Plan Creation**: Generate detailed implementation plan w/ validation gates

## Flags

### Universal Flags
- `--plan`: Generate detailed implementation plan
- `--think`: Show reasoning process
- `--uc`: Ultra-compressed mode (70% token reduction)
- `--compress`: Standard compression (50% token reduction)
- `--cache`: Utilize MCP caching

### Command-Specific Flags
- `--analyze-deps`: Deep dependency analysis
- `--tech-stack`: Detailed tech stack analysis
- `--security-focus`: Enhanced security considerations

## Output
Creates feature PRP in `/workflow/planned/[feature-name].md`

## Examples

```bash
# Basic feature planning
/context-engineer "Add user authentication system"

# With dependency analysis
/context-engineer "Implement real-time chat" --analyze-deps

# Security-focused planning
/context-engineer "Add payment processing" --security-focus

# Ultra-compressed mode
/context-engineer "Create admin dashboard" --uc
```

## Integration
- Automatically integrates with workflow management
- Creates structured feature requirements
- Links to appropriate templates and personas
- Generates validation checkpoints