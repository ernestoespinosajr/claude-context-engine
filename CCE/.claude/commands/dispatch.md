# Dispatch Command - Agent Execution System
**Version**: Context Engineering System v3.0  
**Purpose**: Dispatch specialized agents for autonomous implementation based on planning context

---

**IMPORTANT**: This command should only be used AFTER completing the planning phase with @ask/@feature/@issue/@quick-feature commands.

## Command Execution
Execute: immediate agent dispatch with context handoff  
Legend: 🤖 Generated based on agent specialization  
Purpose: "[Dispatch][Agent] for autonomous implementation of planned task"

## Usage

### Basic Dispatch Syntax
```bash
dispatch [agent-name] --context="[task-name]" [--persona-flags] [--mcp-flags]
```

### Available Agents

**Core Development:**
- `frontend` 🎨 - Web frontend development, UI/UX implementation  
- `backend` ⚙️ - Server-side logic, APIs, database architecture
- `mobile` 📱 - Mobile app development, React Native, native features
- `full-stack` 🌐 - End-to-end web applications, frontend-backend integration

**Meta & Orchestration:**
- `context-manager` 🧠 - Information architecture and knowledge management
- `multi-agent-coordinator` 🎯 - Multi-agent workflow orchestration

**Business & Product:**
- `technical-writer` 📝 - Technical documentation and knowledge creation

**Data & AI:**
- `ai-engineer` 🤖 - AI system architecture and implementation

### Example Dispatch Commands
```bash
# Frontend feature implementation
dispatch frontend --context="dark-mode-toggle" --persona-frontend --mcp-playwright

# Backend API development  
dispatch backend --context="user-authentication-api" --persona-security --mcp-supabase

# Mobile app development
dispatch mobile --context="biometric-login" --persona-mobile --persona-security

# Full-stack feature
dispatch full-stack --context="real-time-chat" --persona-frontend --persona-backend --mcp-playwright --mcp-supabase

# AI system implementation
dispatch ai-engineer --context="recommendation-engine" --persona-data --mcp-sequential

# Technical documentation
dispatch technical-writer --context="api-documentation" --mcp-fetch --mcp-context7

# Multi-agent coordination
dispatch multi-agent-coordinator --context="complex-workflow" --mcp-sequential --mcp-context7
```

## Agent Selection Guide

### Frontend Agent 🎨
**Use when task involves:**
- React, Vue, Angular UI components
- CSS styling and responsive design
- Frontend state management
- Browser APIs and client-side features
- UI/UX implementation and accessibility

**Example tasks:**
- Component library development
- Dashboard UI implementation  
- Progressive web app features
- Client-side form validation
- Animation and interaction design

### Backend Agent ⚙️
**Use when task involves:**
- REST APIs and GraphQL services
- Database design and operations
- Authentication and authorization
- Server-side business logic
- Third-party integrations

**Example tasks:**
- API endpoint development
- Database schema design
- Authentication system implementation
- Payment processing integration
- Microservices architecture

### Mobile Agent 📱  
**Use when task involves:**
- React Native app development
- Native device features (camera, GPS, biometrics)
- Cross-platform mobile solutions
- App store deployment
- Mobile-specific UI patterns

**Example tasks:**
- Mobile app UI development
- Camera and photo features
- Push notification implementation
- Offline functionality
- Biometric authentication

### Full-Stack Agent 🌐
**Use when task involves:**
- End-to-end web feature development
- Frontend-backend integration
- Real-time features (WebSockets)
- Complete user workflows
- Database-to-UI data flow

**Example tasks:**
- Real-time collaboration features  
- User authentication flows
- File upload and management systems
- Dashboard with backend integration
- E-commerce checkout process

### Mobile Full-Stack Agent 📱🌐
**Use when task involves:**
- Mobile apps with custom APIs
- Mobile-backend real-time features
- Push notification systems
- Mobile-optimized backend services
- Cross-platform mobile solutions

**Example tasks:**
- Mobile chat applications
- Mobile payment systems
- Location-based mobile apps
- Mobile-first social platforms
- IoT mobile applications

## Context Handoff Process

### 1. Planning Context Transfer
The agent receives complete planning context including:
- Requirements and acceptance criteria
- Architecture decisions and constraints  
- Technical specifications and dependencies
- Quality gates and success metrics
- Risk assessment and mitigation strategies

### 2. Agent Initialization
- Load specialized agent configuration
- Apply recommended persona specializations
- Configure appropriate MCP modules
- Set up agent-specific context optimization
- Initialize quality assurance standards

### 3. Autonomous Execution
- Agent works independently in separate context
- Makes implementation decisions based on expertise
- Follows established patterns and best practices
- Handles errors and edge cases autonomously
- Provides progress updates without verbose explanations

### 4. Quality Assurance
- Agent validates implementation against acceptance criteria
- Runs automated tests and quality checks
- Ensures security and performance standards
- Documents implementation decisions and changes
- Prepares deployment-ready code

## Agent Collaboration Patterns

### Sequential Agent Workflows
```bash
# Backend-first development
dispatch backend --context="user-api"
# After backend completion:
dispatch frontend --context="user-interface" --depends-on="user-api"
```

### Parallel Agent Development
```bash
# Simultaneous development (when possible)
dispatch backend --context="chat-api" &
dispatch frontend --context="chat-ui" --api-contract="chat-api"
```

### Agent Handoff Workflows  
```bash
# Mobile agent → Backend agent collaboration for API needs
dispatch mobile --context="mobile-app-ui"
# If backend API needed:
dispatch backend --context="mobile-app-backend" --extends="mobile-app-ui"
```

## Quality Gates and Validation

### Agent Validation Requirements
Each agent must satisfy these quality gates before completion:

**Code Quality:**
- ✅ Type safety and error handling
- ✅ Code follows established patterns
- ✅ Comprehensive testing coverage
- ✅ Documentation and examples provided

**Performance Standards:**
- ✅ Meets performance benchmarks  
- ✅ Optimized for target platform
- ✅ Efficient resource utilization
- ✅ Scalability considerations addressed

**Security Compliance:**
- ✅ Input validation and sanitization
- ✅ Authentication and authorization
- ✅ Data protection measures
- ✅ Vulnerability assessment completed

**Integration Testing:**
- ✅ API contracts validated
- ✅ End-to-end workflows tested
- ✅ Error scenarios handled gracefully
- ✅ Deployment readiness confirmed

## Error Handling and Recovery

### Agent Error Resolution
Agents handle errors autonomously through:

**Automatic Recovery:**
- Retry failed operations with exponential backoff
- Fallback to alternative implementation approaches  
- Graceful degradation for non-critical features
- Self-correction based on error patterns

**Escalation Triggers:**
- External service dependencies unavailable
- Conflicting requirements or constraints discovered
- Security vulnerabilities requiring architectural changes
- Performance targets cannot be achieved with current approach

**Recovery Communication:**
- Clear explanation of issue and attempted solutions
- Alternative approaches considered and their trade-offs
- Recommendation for path forward with rationale
- Impact assessment on overall project timeline

## Progress Monitoring

### Agent Progress Updates
Agents provide milestone-based progress reporting:

**Implementation Phases:**
- 🏗️ **Architecture Phase**: Initial setup and structure
- 🔧 **Core Implementation**: Primary functionality development  
- 🧪 **Testing Phase**: Comprehensive testing and validation
- ⚡ **Optimization Phase**: Performance and security tuning
- 📦 **Deployment Phase**: Production readiness preparation

**Status Communication:**
- Milestone completion with acceptance criteria validation
- Performance metrics and benchmarks achieved
- Integration points validated and tested
- Quality gates passed with evidence
- Next phase dependencies identified

### Monitoring Commands
```bash
# Check agent status
agent status [agent-name]

# View agent progress  
agent progress [task-name]

# Get agent logs
agent logs [agent-name] --task="[task-name]"

# Agent health check
agent health [agent-name]
```

## Best Practices

### When to Dispatch Agents
✅ **Dispatch agents when:**
- Task complexity requires deep domain expertise
- Multi-step implementation across multiple files/systems
- Performance optimization requiring specialized knowledge
- Integration patterns requiring domain-specific understanding
- Quality assurance demanding comprehensive testing strategies

❌ **Don't dispatch agents for:**
- Simple configuration changes
- Single-file modifications
- Basic text or documentation updates
- Tasks requiring constant human decision-making
- Exploratory research or investigation tasks

### Agent Selection Strategy
1. **Analyze Task Domain**: Determine primary technical domain (frontend, backend, mobile)
2. **Assess Complexity**: Complex tasks benefit most from agent specialization
3. **Consider Integration**: Complex tasks may need agent coordination or full-stack agents
4. **Evaluate Timeline**: Agents work best for tasks requiring sustained focus
5. **Check Dependencies**: Ensure planning context provides sufficient detail

### Context Quality for Agents
**High-Quality Context Includes:**
- Clear requirements and acceptance criteria
- Technical constraints and dependencies  
- Architecture decisions already made
- Quality standards and performance targets
- Security and compliance requirements

**Poor Context Signals:**
- Vague or incomplete requirements
- Missing technical specifications
- Unclear success criteria
- Ambiguous architecture decisions
- Conflicting or contradictory constraints

## Integration with Command System

### Command-Agent Workflow
```mermaid
graph TD
    A[@ask] --> B[@feature/@issue/@quick-feature]
    B --> C[Planning Complete]
    C --> D[dispatch agent]
    D --> E[Agent Autonomous Implementation]
    E --> F[Quality Validation]
    F --> G[Deployment Ready]
```

### Workflow Phases
1. **Analysis Phase**: Use @ask for task consultation and approach recommendation
2. **Planning Phase**: Use @feature/@issue/@quick-feature for detailed planning
3. **Agent Selection**: Choose appropriate agent based on planning analysis
4. **Execution Phase**: Dispatch agent with complete planning context
5. **Validation Phase**: Agent validates implementation against quality gates
6. **Completion Phase**: Agent delivers production-ready implementation

---

**Context Engineering Integration**: The dispatch system seamlessly integrates with the existing Context Engineering workflow, providing autonomous implementation capabilities while maintaining the strategic planning and analysis strengths of the command system.

**Quality Assurance**: Every agent dispatch includes comprehensive quality validation, ensuring that autonomous implementation meets or exceeds the standards of manual implementation while significantly reducing human oversight requirements.