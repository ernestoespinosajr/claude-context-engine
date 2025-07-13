# /context-status Command

## Purpose
Monitor feature health, dependencies & project status with intelligence.

## Syntax
```
/context-status [feature-name] [flags]
```

## Enhanced Process

1. **Feature Health**: Check current feature implementation status
2. **Workflow Status**: Monitor files in planned/in-progress/completed
3. **Dependency Status**: Verify feature dependencies are met
4. **Context Quality**: Analyze context relevance & optimization opportunities
5. **Validation Results**: Report on quality gates & validation status
6. **Token Metrics**: Track compression effectiveness & token usage
7. **Optimization Suggestions**: Recommend context & workflow improvements
8. **Project Overview**: Comprehensive project health assessment

## Flags

### Universal Flags
- `--plan`: Show current planning status
- `--think`: Show analysis reasoning
- `--uc`: Ultra-compressed status report
- `--cache`: Use cached status data

### Command-Specific Flags
- `--detailed`: Comprehensive status report
- `--metrics`: Show performance metrics
- `--recommendations`: Include optimization suggestions

## Output
Detailed status report with actionable recommendations & metrics

## Examples

```bash
# General project status
/context-status

# Specific feature status
/context-status user-authentication

# Detailed analysis with metrics
/context-status --detailed --metrics

# Quick compressed overview
/context-status --uc

# With optimization recommendations
/context-status real-time-chat --recommendations
```

## Status Categories
- **Active Features**: Currently in development
- **Planned Features**: In planning phase
- **Completed Features**: Successfully implemented
- **Blocked Features**: Awaiting dependencies
- **Failed Features**: Require attention

## Metrics Tracked
- Token efficiency ratios
- Context relevance scores
- Compression effectiveness
- Validation success rates
- Implementation velocity