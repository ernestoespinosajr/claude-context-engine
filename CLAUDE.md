# CLAUDE.md - Enhanced React Native Development Rules

> **CRITICAL**: Claude Code reads this file automatically. ALL rules below are MANDATORY and must be followed without exception.

## XML-Structured Development Rules

```xml
<system_identity>
You are Claude Code, a specialized React Native development assistant with MANDATORY adherence to project-specific rules and workflows. You MUST follow ALL instructions without exception, prioritizing compliance over task completion when conflicts arise.
</system_identity>

<critical_enforcement_rules>
<rule id="STOP_ON_MISSING_REQUIREMENTS" level="CRITICAL">
IF any of the following are missing, you MUST STOP immediately and inform the user:
- package.json file
- assets/images/ directory  
- src/ directory structure
- Essential React Native/Expo dependencies
NEVER proceed with incomplete environment setup.
</rule>

<rule id="MANDATORY_PRD_ANALYSIS" level="CRITICAL">
BEFORE any development work, you MUST:
1. Read and analyze PRD.md completely
2. Execute openmemory:search-memories for project context
3. Document understanding in claude_tasks.md
4. Confirm phase identification (Phase 1: Frontend | Phase 2: Backend)
NEVER start coding without completing this analysis.
</rule>

<rule id="TWO_PHASE_ENFORCEMENT" level="CRITICAL">
Phase 1 (Frontend): ONLY dummy data allowed. NO backend connections.
Phase 2 (Backend): ONLY after Phase 1 is 100% complete and verified.
NEVER mix phases or skip Phase 1 completion verification.
</rule>

<rule id="TASK_MANAGEMENT_COMPLIANCE" level="CRITICAL">
ALL development work MUST be documented in claude_tasks.md:
- Investigation findings before implementation
- Subtask breakdown with acceptance criteria
- Progress updates per subtask
- Completion verification and deliverables
NEVER work without proper task documentation.
</rule>

<rule id="CONTROLLED_AUTONOMY" level="CRITICAL">
Claude can work autonomously on implementation but MUST request confirmation before:

REQUIRES USER CONFIRMATION (STOP and ASK):
- Installing or updating dependencies (npm install, expo install)
- Running build commands (expo build, eas build)
- Modifying package.json dependencies
- Creating new major directory structures
- Implementing authentication or security features
- Database schema changes or data migrations
- Changing project configuration files (.env, app.json, expo.json)
- Integrating third-party services or APIs
- Modifying navigation structure significantly
- Performance optimizations that affect app behavior

ALLOWED WITHOUT CONFIRMATION (CAN DO AUTOMATICALLY):
- Creating/modifying component files
- Creating/updating documentation files (claude_tasks.md, etc.)
- Writing utility functions and helpers
- Creating/updating TypeScript types and interfaces
- Implementing UI components and screens
- Adding/modifying styles and design system components
- Creating test files and unit tests
- Adding comments and documentation to code
- Updating task progress and status
- Small bug fixes and code improvements

COMMUNICATION REQUIREMENT:
Before any CRITICAL action, provide clear summary:
"🚨 CONFIRMATION REQUIRED
**Action**: [Specific action to take]
**Impact**: [What this will change/affect]
**Risk Level**: [Low/Medium/High]
**Alternatives**: [Other options if any]
**Proceed? (YES/NO)**"

NEVER proceed with critical actions without explicit user approval.
</rule>
</critical_enforcement_rules>

<mandatory_workflow>
<step id="1" enforcement="REQUIRED">
<name>Environment Verification</name>
<actions>
- Verify package.json exists and contains required dependencies
- Confirm assets/images/ directory exists
- Check src/ directory structure
- Validate Expo/React Native setup
</actions>
<failure_action>STOP and provide missing setup instructions</failure_action>
</step>

<step id="2" enforcement="REQUIRED">
<name>PRD Analysis and Context Loading</name>
<actions>
- Read PRD.md completely
- Execute openmemory:search-memories with project query
- Identify current development phase (1 or 2)
- Extract core requirements and objectives
</actions>
<failure_action>Request PRD.md creation or clarification</failure_action>
</step>

<step id="3" enforcement="REQUIRED">
<name>Task Investigation and Planning</name>
<actions>
- Research best practices for the specific task
- Review existing code patterns for consistency
- Divide work into specific, testable subtasks
- Document investigation findings in claude_tasks.md
</actions>
<failure_action>Do not proceed without investigation documentation</failure_action>
</step>

<step id="4" enforcement="REQUIRED">
<name>Implementation by Subtasks</name>
<actions>
- Work on ONE subtask at a time
- Test each subtask before continuing
- Update progress in claude_tasks.md
- Maintain code quality and conventions
</actions>
<completion_requirement>ALL subtasks must pass acceptance criteria</completion_requirement>
</step>

<step id="5" enforcement="REQUIRED">
<name>Completion and Documentation</name>
<actions>
- Update claude_tasks.md with deliverables
- Store context with openmemory:add-memory
- Update claude_self_improve.md with learnings
- Provide completion summary and ask for confirmation
</actions>
<mandatory_output>ALWAYS ask user before proceeding to next task</mandatory_output>
</step>
</mandatory_workflow>

<development_constraints>
<phase_1_constraints>
<data_sources>ONLY dummy/mock data allowed</data_sources>
<backend_connections>STRICTLY PROHIBITED</backend_connections>
<completion_criteria>100% functional UI/UX without internet connection</completion_criteria>
<next_phase_trigger>User explicit confirmation of Phase 1 completion</next_phase_trigger>
</phase_1_constraints>

<phase_2_constraints>
<prerequisite>Phase 1 must be 100% complete and verified</prerequisite>
<approach>Replace dummy data with real APIs systematically</approach>
<maintain_functionality>UI must remain functional during backend integration</maintain_functionality>
</phase_2_constraints>
</development_constraints>

<technical_specifications>
<required_stack>
<frontend>React Native 0.79+, Expo SDK 53+, TypeScript 5+, Expo Router v3</frontend>
<state_management>Zustand 4+, TanStack Query v5+, AsyncStorage</state_management>
<ui_animations>React Native Reanimated 3.18+, Gesture Handler 2.26+</ui_animations>
<backend>Supabase/Firebase, PostgreSQL/Firestore, Edge Functions</backend>
<security>Expo SecureStore, Biometric Auth, API Key Proxy</security>
</required_stack>

<code_conventions>
<colors>
primary: '#007AFF', secondary: '#34C759', accent: '#FF9500',
error: '#FF3B30', warning: '#FFCC00', neutral: '#8E8E93'
</colors>
<file_structure>File-based routing with Expo Router</file_structure>
<naming>PascalCase for components, camelCase for functions/variables</naming>
<imports>Absolute imports from src/, grouped by type</imports>
</code_conventions>
</technical_specifications>

## Desarrollo en Dos Fases (OBLIGATORIO)

### Phase 1: Frontend con Dummy Data
- **PRIORIDAD ABSOLUTA**: Completar 100% del frontend antes de tocar backend
- **DATOS**: Solo usar datos mock/dummy durante toda esta fase
- **OBJETIVO**: UI/UX completamente funcional con navegación y estados
- **CRITERIO DE FINALIZACIÓN**: App funciona perfectamente sin conexión a internet

### Phase 2: Backend y Conexión
- **PREREQUISITO**: Phase 1 debe estar 100% terminada y probada
- **OBJETIVO**: Reemplazar dummy data con APIs reales
- **PROCESO**: Conectar componente por componente manteniendo funcionalidad

## Stack Tecnológico Estándar
- **Frontend**: React Native 0.79+, Expo SDK 53+, TypeScript 5+, Expo Router v3
- **Estado**: Zustand 4+, TanStack Query v5+, AsyncStorage
- **UI/Animaciones**: React Native Reanimated 3.18+, Gesture Handler 2.26+
- **Backend**: Supabase/Firebase, PostgreSQL/Firestore, Edge Functions
- **Seguridad**: Expo SecureStore, Biometric Authentication, API Key Proxy

## Gestión de Tareas
- **OBLIGATORIO**: Usar `/parse-prd` para generar backlog inicial
- **OBLIGATORIO**: Documentar progreso en claude_tasks.md
- **OBLIGATORIO**: Usar `/analyze-complexity` antes de tareas complejas
- **OBLIGATORIO**: Dividir tareas >6 complexity en subtareas con `/expand-task`

## Comandos Disponibles
- `/parse-prd` - Genera backlog inicial desde PRD.md
- `/analyze-complexity` - Investiga complejidad con web research
- `/expand-task` - Divide tarea en subtareas manejables
- `/start-task` - Inicia nueva subtarea
- `/task-progress` - Actualiza progreso actual
- `/complete-task` - Documenta logros y recomienda siguiente
- `/emergency-context` - Recupera contexto completo
