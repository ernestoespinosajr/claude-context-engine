# Context Engine

The Context Engine implements the 11-Layer Context Window Architecture for optimal AI performance and feature-focused development.

## Architecture Overview

The Context Engine manages context in 11 distinct layers, each serving a specific purpose in the AI's decision-making process:

```
Layer 11: User Query (Current Request)
Layer 10: Immediate Context (Current Feature)
Layer 9: Session Context (Development Session)
Layer 8: Feature Context (Related Features)
Layer 7: Project Context (Current Project)
Layer 6: Domain Knowledge (Technical Expertise)
Layer 5: External Context (APIs, Dependencies)
Layer 4: Historical Context (Past Decisions)
Layer 3: Constraints (Technical Limitations)
Layer 2: Goals (Feature Objectives)
Layer 1: System Instructions (Core Behavior)
```

## Directory Structure

```
context-engine/
├── layers/              # Individual layer managers
├── managers/            # Context orchestration
├── templates/           # Context templates by language
├── validators/          # Context validation rules
└── optimizers/          # Context optimization algorithms
```

## Layer Responsibilities

### Layer 1: System Instructions
- Core AI behavior and personality
- Development philosophy and principles
- Quality standards and best practices
- Language-agnostic development patterns

### Layer 2: Goals
- Feature-specific objectives
- Success criteria and validation gates
- Quality metrics and performance targets
- User experience requirements

### Layer 3: Constraints
- Technical limitations and boundaries
- Resource constraints (time, memory, dependencies)
- Platform-specific restrictions
- Security and compliance requirements

### Layer 4: Historical Context
- Past feature implementations
- Lessons learned and pattern discoveries
- Architecture decisions and rationale
- Performance optimizations made

### Layer 5: External Context
- API documentation and examples
- Third-party library information
- Platform-specific documentation
- Integration requirements and patterns

### Layer 6: Domain Knowledge
- Language-specific best practices
- Framework conventions and patterns
- Testing methodologies and tools
- Performance optimization techniques

### Layer 7: Project Context
- Current project structure and architecture
- Existing codebase patterns and conventions
- Technology stack and dependencies
- Development workflow and tooling

### Layer 8: Feature Context
- Related features and dependencies
- Integration points and interfaces
- Shared components and utilities
- Cross-feature communication patterns

### Layer 9: Session Context
- Current development session state
- Recently modified files and changes
- Active debugging and testing context
- Development flow and momentum

### Layer 10: Immediate Context
- Current feature being worked on
- Active files and code sections
- Recent changes and modifications
- Current validation and testing state

### Layer 11: User Query
- Current user request or command
- Specific implementation requirements
- Clarifications and preferences
- Context modifications and overrides

## Context Optimization

### Dynamic Layer Weighting
- More relevant layers receive higher priority
- Context density optimization based on query type
- Automatic layer relevance scoring
- Memory usage optimization

### Feature-Focused Filtering
- Context limited to current feature scope
- Irrelevant project information filtered out
- Enhanced signal-to-noise ratio
- Reduced cognitive load on AI

### Adaptive Context Sizing
- Context window utilization optimization
- Automatic truncation of less relevant information
- Progressive detail levels based on importance
- Real-time context relevance scoring

## Usage

The Context Engine is automatically used by:
- `/context-engineer` - Layer construction and feature planning
- `/execute-context` - Dynamic context management during development
- `/context-status` - Context health monitoring and optimization

## Performance Metrics

### Context Quality Indicators
- **Relevance Score**: How relevant the context is to current query
- **Density Score**: Information density vs. noise ratio
- **Completeness Score**: Coverage of necessary information
- **Efficiency Score**: Context window utilization efficiency

### Optimization Targets
- **90%+ Relevance**: Most context should be directly relevant
- **<10% Noise**: Minimal irrelevant information
- **100% Completeness**: All necessary information present
- **80%+ Efficiency**: Optimal context window usage 