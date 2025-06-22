# 📚 Archivos de Documentación - docs/

## 📂 docs/setup-guide.md

```markdown
# 🔧 Setup Guide - Claude Code React Native System

## 📊 Overview

This comprehensive guide covers all aspects of setting up and configuring the Claude Code React Native System for your development workflow.

## 🎯 Prerequisites

### Required Software
- **Node.js**: Version 18.0+ 
- **npm/yarn**: Latest version
- **Expo CLI**: `npm install -g @expo/cli`
- **Claude Code**: Latest version from Anthropic
- **Git**: For version control
- **VS Code**: Recommended editor (optional)

### Development Environment
- **iOS Development**: Xcode 14+ (macOS only)
- **Android Development**: Android Studio + SDK
- **Physical Devices**: iOS/Android devices for testing
- **Simulators**: iOS Simulator / Android Emulator

### Claude Code Configuration
- **Account**: Valid Claude account with Code access
- **Workspace**: Dedicated workspace for your project
- **Memory**: Enable conversation memory for context persistence

## 🚀 Installation Methods

### Method 1: Automated Setup (Recommended)
```bash
# Clone the system
git clone https://github.com/[username]/claude-code-react-native-system.git
cd claude-code-react-native-system

# Run automated setup
./scripts/setup-project.sh

# Follow the interactive prompts
```

### Method 2: Manual Setup
```bash
# 1. Clone repository
git clone https://github.com/[username]/claude-code-react-native-system.git

# 2. Navigate to your project
cd /path/to/your/react-native-project

# 3. Copy templates
cp -r ../claude-code-react-native-system/templates/* ./

# 4. Copy commands
mkdir -p .claude/commands
cp -r ../claude-code-react-native-system/commands/* .claude/commands/

# 5. Create directory structure
mkdir -p src/{components,screens,utils,types} assets/images
```

### Method 3: Integration into Existing Project
```bash
# For existing React Native/Expo projects
cd existing-project

# Copy only essential files
cp ../claude-code-react-native-system/templates/CLAUDE.md ./
cp ../claude-code-react-native-system/templates/claude_tasks.md ./
cp -r ../claude-code-react-native-system/commands .claude/

# Merge with existing structure
```

## 📝 Configuration Steps

### Step 1: Project Requirements Document (PRD)
1. **Edit PRD.md** with your project specifics:
   ```markdown
   # Product Requirements Document - [Your App Name]
   
   ## Vision
   [Describe what your app does and why]
   
   ## Core Features
   [List main functionalities]
   
   ## Technical Stack
   [Confirm or modify the tech stack]
   ```

2. **Include Essential Sections**:
   - Project vision and objectives
   - Target users and use cases
   - Core features and user stories
   - Technical specifications
   - Development phases

### Step 2: Functional Requirements
1. **Review functional-requirements.md**
2. **Customize modules** to match your app:
   - Authentication requirements
   - Core business logic
   - Data management needs
   - Integration requirements

### Step 3: UI/UX Specifications
1. **Update ui-ux-specifications.md**:
   - Brand colors and themes
   - Typography preferences
   - Component specifications
   - Design guidelines

2. **Create Design Assets**:
   ```bash
   # Add your assets to:
   assets/images/        # App images
   assets/icons/         # Icon assets
   assets/fonts/         # Custom fonts (if any)
   ```

### Step 4: Claude Code Configuration
1. **Verify CLAUDE.md** is in project root
2. **Restart Claude Code** after copying files
3. **Test slash commands**:
   ```
   /parse-prd          # Should work without errors
   /emergency-context  # Should load project context
   ```

## 🔧 Advanced Configuration

### Environment Variables
Create `.env` file for environment-specific configuration:
```bash
# Development
EXPO_PUBLIC_API_URL=http://localhost:3000
EXPO_PUBLIC_ENV=development

# Production
EXPO_PUBLIC_API_URL=https://api.yourapp.com
EXPO_PUBLIC_ENV=production
```

### TypeScript Configuration
Ensure `tsconfig.json` includes proper paths:
```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@/components/*": ["src/components/*"],
      "@/screens/*": ["src/screens/*"],
      "@/utils/*": ["src/utils/*"],
      "@/types/*": ["src/types/*"]
    }
  }
}
```

### Development Scripts
Add to `package.json`:
```json
{
  "scripts": {
    "start": "expo start",
    "android": "expo start --android",
    "ios": "expo start --ios",
    "web": "expo start --web",
    "test": "jest",
    "lint": "eslint . --ext .ts,.tsx",
    "type-check": "tsc --noEmit"
  }
}
```

### Git Configuration
Configure `.gitignore` for React Native + Claude System:
```gitignore
# Claude Code System (choose what to track)
# claude_tasks.md          # Uncomment to ignore task tracking
# claude_self_improve.md   # Uncomment to ignore learning docs

# Development
node_modules/
.expo/
.env*.local
```

## 👥 Team Setup

### Multi-Developer Configuration
1. **Standardize Setup**:
   - Use setup script for consistency
   - Share customized templates via Git
   - Document team-specific conventions

2. **Task Management Strategy**:
   - Decide if `claude_tasks.md` is shared or personal
   - Set up task review processes
   - Define completion criteria standards

3. **Code Review Integration**:
   - Include Claude-generated patterns in reviews
   - Share learnings via `claude_self_improve.md`
   - Establish quality gates

### CI/CD Integration
Example GitHub Actions workflow:
```yaml
name: Claude System Validation
on: [push, pull_request]

jobs:
  validate-setup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Validate Claude System
        run: |
          test -f CLAUDE.md || exit 1
          test -d .claude/commands || exit 1
          test -f claude_tasks.md || exit 1
```

## 🔍 Verification and Testing

### Setup Verification Checklist
- [ ] All template files copied and customized
- [ ] Directory structure created completely
- [ ] Claude Code commands working (`/parse-prd`)
- [ ] Project-specific information updated
- [ ] Development environment functional

### Testing the Setup
```bash
# 1. Test command functionality
# In Claude Code:
/parse-prd              # Should generate tasks
/analyze-complexity     # Should research and analyze
/emergency-context      # Should load full context

# 2. Test development workflow
/start-task            # Should select first task
/task-progress         # Should update documentation
/complete-task         # Should document and suggest next

# 3. Verify file structure
ls -la CLAUDE.md PRD.md claude_tasks.md
ls -la .claude/commands/
ls -la src/ assets/
```

## 🚨 Common Setup Issues

### Claude Commands Not Working
**Symptoms**: `/parse-prd` shows "command not found"
**Solutions**:
1. Restart Claude Code completely
2. Verify `.claude/commands/` directory exists
3. Check command files have content:
   ```bash
   ls -la .claude/commands/
   head .claude/commands/parse-prd.md
   ```

### Templates Not Customized
**Symptoms**: Files still contain `[PLACEHOLDER]` text
**Solutions**:
1. Run setup script with proper permissions
2. Manually replace placeholders:
   ```bash
   sed -i 's/\[NOMBRE_DEL_PROYECTO\]/MyApp/g' *.md
   ```

### Missing Dependencies
**Symptoms**: Development server won't start
**Solutions**:
1. Install React Native dependencies:
   ```bash
   npm install
   # or
   yarn install
   ```
2. Clear cache:
   ```bash
   npx expo start --clear
   ```

## 🎯 Next Steps After Setup

1. **Generate Initial Tasks**: Run `/parse-prd`
2. **Analyze Complexity**: Run `/analyze-complexity`
3. **Break Down Tasks**: Run `/expand-all`
4. **Start Development**: Run `/start-task`
5. **Establish Workflow**: Use daily commands consistently

## 📚 Additional Resources

- **Quick Start**: See `QUICK_START.md` for 5-minute setup
- **Commands Reference**: See `docs/commands-reference.md`
- **Troubleshooting**: See `docs/troubleshooting.md`
- **Examples**: Check `examples/` directory for sample projects

---

**Setup Support**: If you encounter issues not covered here, please check troubleshooting guide or open an issue on GitHub.
```

---

## 📂 docs/commands-reference.md

```markdown
# 📋 Commands Reference - Claude Code React Native System

## 📊 Overview

Complete reference for all slash commands available in the Claude Code React Native System. Each command is designed for specific phases of development workflow.

## 🚀 Project Setup Commands

### `/parse-prd`
**Purpose**: Generate initial task backlog from PRD.md  
**Usage**: `Run once at project start`  
**Prerequisites**: PRD.md must exist with project requirements

**What it does**:
- Reads and analyzes PRD.md completely
- Extracts core features and requirements
- Separates tasks into Phase 1 (Frontend) and Phase 2 (Backend)
- Creates organized task list in claude_tasks.md
- Assigns priorities and estimates
- Stores project context in memory

**Example Output**:
```markdown
# 📋 CLAUDE TASKS - MyApp
*Generated from PRD.md on 2025-01-15*

## 🏗️ SETUP TASKS - Phase 1
### 📦 Project Base Setup - CRITICAL - Phase 1
**Description**: Initialize and configure React Native/Expo project
**Estimated Effort**: Medium (4-6 hours)
```

**When to use**:
- ✅ First time setting up project
- ✅ When PRD.md is significantly updated
- ❌ During regular development (use other commands)

**Troubleshooting**:
- If no tasks generated: Check PRD.md has sufficient detail
- If error occurs: Ensure PRD.md exists and is readable
- If categories missing: Add more specific features to PRD

---

### `/analyze-complexity`
**Purpose**: Analyze task complexity with web research  
**Usage**: `After /parse-prd or when adding new complex tasks`  
**Parameters**: Optional task name to analyze specific task

**What it does**:
- Conducts web research for each task using web_search
- Researches React Native/Expo best practices
- Identifies common challenges and solutions
- Assigns complexity scores (1-10 scale)
- Documents research findings
- Recommends tasks for expansion

**Complexity Scoring**:
- **1-3**: Simple, straightforward implementation
- **4-6**: Moderate, requires some research/setup
- **7-8**: Complex, multiple moving parts
- **9-10**: Very complex, high risk of blockers

**Example Usage**:
```
/analyze-complexity                    # Analyze all tasks
/analyze-complexity Authentication     # Analyze specific task
```

**Research Areas**:
- Technical complexity and implementation approaches
- Required dependencies and setup requirements
- Common gotchas and potential blockers
- Time estimates from development communities
- Best practices and patterns

---

### `/expand-task [task-name]`
**Purpose**: Break down complex task into manageable subtasks  
**Usage**: `For tasks with complexity score ≥6`  
**Parameters**: Task name to expand

**What it does**:
- Researches optimal implementation approach
- Breaks task into 1-4 hour subtasks
- Defines clear acceptance criteria for each subtask
- Sets up dependency chains between subtasks
- Maintains logical development sequence

**Subtask Criteria**:
- Maximum 4 hours estimated time
- Clear, specific deliverable
- Testable outcome
- Minimal dependencies between subtasks

**Example**:
```
/expand-task Authentication System

# Results in:
#### Subtask 1: Setup Auth Dependencies (1h)
#### Subtask 2: Create Login Form UI (2h)
#### Subtask 3: Add Form Validation (1.5h)
#### Subtask 4: Implement Auth Context (2h)
```

---

### `/expand-all`
**Purpose**: Expand all high-complexity tasks automatically  
**Usage**: `After complexity analysis, before starting development`

**What it does**:
- Identifies all tasks with complexity ≥6
- Runs expansion process for each complex task
- Creates comprehensive subtask breakdown
- Updates dependency chains across all tasks
- Generates development timeline recommendations

**Benefits**:
- Converts large, intimidating tasks into manageable work
- Provides realistic time estimates
- Enables better project planning
- Reduces risk of getting stuck on complex implementations

---

## 🔄 Daily Development Commands

### `/emergency-context`
**Purpose**: Quickly recover full project context  
**Usage**: `Start of every development session`

**What it loads**:
- Project overview from PRD.md
- Current task status from claude_tasks.md
- Recent progress and decisions from memory
- Current development phase (1 or 2)
- Next priority tasks and blockers

**Output Format**:
```
## 🚨 EMERGENCY CONTEXT RECOVERY
**Project**: MyApp - Social Media Platform
**Current Phase**: Phase 1 (Frontend Only)
**Active Task**: Create LoginScreen Component (2h)
**Last Progress**: UI layout completed, working on validation
**Next Priority**: Complete validation → Add error handling → Start RegisterScreen
**Blockers**: None
**Ready to Proceed**: YES
```

---

### `/start-task`
**Purpose**: Begin working on next logical task  
**Usage**: `When ready to start new task`  
**Prerequisites**: Task backlog must exist (run /parse-prd first)

**Selection Criteria**:
- All dependencies completed
- Current phase compliance (Phase 1 vs Phase 2)
- Priority level and criticality
- Logical development sequence

**What it does**:
- Analyzes available tasks
- Selects optimal next task
- Loads task context and requirements
- Sets up workspace mentally for Claude
- Documents task start in claude_tasks.md

---

### `/task-progress`
**Purpose**: Update progress on current task  
**Usage**: `During development after significant progress`

**What it tracks**:
- Completed subtasks and achievements
- Current work in progress
- Files modified/created
- Blockers encountered
- Time invested vs estimated
- Next steps in sequence

**Auto-Documentation**:
```markdown
## 🔄 Create LoginScreen - IN PROGRESS
**Last Updated**: 2025-01-15 14:30
**Progress**: 60% - UI completed, validation in progress
**Completed Subtasks**:
- [✅] Form layout and styling
- [✅] Input field components
**In Progress**:
- [🔄] Form validation logic
**Files Modified**: src/screens/LoginScreen.tsx, src/utils/validation.ts
```

---

### `/complete-task`
**Purpose**: Mark task as completed with full documentation  
**Usage**: `When all acceptance criteria are met`

**Comprehensive Documentation**:
- Detailed list of deliverables achieved
- Files created/modified with descriptions
- Key technical achievements and solutions
- Lessons learned and patterns discovered
- Impact on other tasks (dependencies unblocked)
- Testing completed and quality metrics
- Time analysis (actual vs estimated)

**Auto-Updates**:
- claude_tasks.md with completion record
- claude_self_improve.md with patterns and learnings
- Memory storage with project progress
- Dependency chain updates for blocked tasks

**Next Steps**:
- Analyzes task backlog for logical next task
- Provides specific recommendation
- **Always asks for user confirmation** before proceeding

---

### `/add-discovered-task`
**Purpose**: Add new task discovered during development  
**Usage**: `When you realize something needs to be done that wasn't planned`

**Smart Categorization**:
- Analyzes task context and requirements
- Determines appropriate category (Setup, UI, Backend, etc.)
- Assigns priority based on impact and dependencies
- Sets correct development phase (1 or 2)
- Links to related tasks automatically

**Categories**:
- **SETUP**: Environment, dependencies, configuration
- **CORE_FEATURES**: Main app functionality
- **UI_COMPONENTS**: Reusable components and design system
- **NAVIGATION**: Routing and navigation
- **STATE_MANAGEMENT**: Data flow and state
- **TESTING**: Unit tests, integration tests
- **OPTIMIZATION**: Performance, bundle size
- **DOCUMENTATION**: README, guides, comments

---

## 🔧 Maintenance Commands

### `/sync-tasks`
**Purpose**: Reorganize and clean up task backlog  
**Usage**: `Weekly or when task list becomes disorganized`

**Cleanup Operations**:
- Marks completed work that wasn't properly closed
- Identifies blocked tasks that might now be unblocked
- Updates priorities based on recent discoveries
- Removes orphaned or outdated tasks
- Reorganizes by current project phase

**Reorganization**:
```markdown
## 🏁 CURRENT SPRINT
[Active work]

## 📋 READY TO START - PHASE 1
[Frontend tasks ready to begin]

## ❌ BLOCKED
[Tasks waiting on dependencies]

## ✅ COMPLETED
[Finished work with deliverables]
```

---

## 🎯 Advanced Usage Patterns

### Command Sequences

#### **Project Initialization**:
```bash
/parse-prd              # Generate task backlog
/analyze-complexity     # Research all tasks
/expand-all            # Break down complex tasks
/emergency-context     # Load full context
/start-task           # Begin first task
```

#### **Daily Development Flow**:
```bash
/emergency-context     # Start of session
/task-progress        # Update current work
/complete-task        # When finished
/start-task          # Begin next task
```

#### **Weekly Maintenance**:
```bash
/sync-tasks           # Clean up task list
/emergency-context    # Refresh full context
```

### Command Combinations

#### **For Complex Features**:
```bash
/add-discovered-task   # Add the complex feature
/analyze-complexity [feature-name]  # Research complexity
/expand-task [feature-name]         # Break into subtasks
```

#### **When Stuck or Blocked**:
```bash
/emergency-context     # Reload full context
/sync-tasks           # Clean up any confusion
/start-task          # Find alternative task
```

## 🚨 Error Handling

### Common Command Errors

#### **Command Not Found**
```
Error: /parse-prd is not recognized
```
**Solutions**:
1. Restart Claude Code completely
2. Verify `.claude/commands/parse-prd.md` exists
3. Check file has content (not empty)

#### **Missing Prerequisites**
```
Error: claude_tasks.md must exist with task backlog
```
**Solutions**:
1. Run `/parse-prd` first to generate tasks
2. Check PRD.md exists and has content
3. Verify project setup is complete

#### **Context Loading Issues**
```
Warning: No project context found in memory
```
**Solutions**:
1. Run `/emergency-context` to reload
2. Check PRD.md and claude_tasks.md exist
3. Re-run `/parse-prd` if necessary

### Command-Specific Troubleshooting

#### `/parse-prd` Issues
- **No tasks generated**: PRD.md needs more detail
- **Wrong categories**: Update PRD features section
- **Missing phases**: Ensure Phase 1/2 distinction clear

#### `/analyze-complexity` Issues
- **No research results**: Check internet connection
- **Incomplete analysis**: Re-run for specific tasks
- **Wrong complexity scores**: Review research findings

#### `/start-task` Issues
- **No available tasks**: Check dependencies and blockers
- **Wrong task selected**: Review priority and phase settings
- **Task already in progress**: Use `/task-progress` instead

## 📚 Best Practices

### Command Usage Guidelines
1. **Always start sessions** with `/emergency-context`
2. **Use `/task-progress` frequently** during development
3. **Complete tasks properly** with `/complete-task`
4. **Add discovered tasks immediately** with `/add-discovered-task`
5. **Maintain organization** with weekly `/sync-tasks`

### Quality Assurance
- Every task should have clear acceptance criteria
- All completed tasks should be tested
- Documentation should be updated continuously
- Patterns should be recorded in claude_self_improve.md

### Performance Tips
- Use tab completion for file references in Claude Code
- Keep task descriptions specific and actionable
- Break large tasks before starting work
- Document decisions immediately to preserve context

---

**Command Support**: For command-specific issues, check the troubleshooting guide or the individual command files in `.claude/commands/`
```

---

## 📂 docs/troubleshooting.md

```markdown
# 🚨 Troubleshooting Guide - Claude Code React Native System

## 📊 Overview

Comprehensive troubleshooting guide for common issues encountered when using the Claude Code React Native System. Solutions are organized by problem category and include step-by-step fixes.

## 🔧 Setup and Installation Issues

### Claude Code Commands Not Working

#### Symptom: `/parse-prd` shows "command not found"
**Most Common Cause**: Claude Code needs restart after copying command files

**Solutions (in order of likelihood)**:

1. **Restart Claude Code Completely** (90% success rate)
   ```bash
   # Close Claude Code entirely
   # Reopen Claude Code in your project directory
   # Try command again: /parse-prd
   ```

2. **Verify Command Files Exist**
   ```bash
   ls -la .claude/commands/
   # Should show: parse-prd.md, start-task.md, etc.
   
   # If missing:
   cp -r /path/to/claude-system/commands/* .claude/commands/
   ```

3. **Check Command File Content**
   ```bash
   head -5 .claude/commands/parse-prd.md
   # Should show command content, not empty
   
   # If empty, re-copy files:
   rm -rf .claude/commands/*
   cp -r /path/to/claude-system/commands/* .claude/commands/
   ```

4. **Verify Directory Structure**
   ```bash
   # Check exact structure:
   .claude/
   └── commands/
       ├── parse-prd.md
       ├── start-task.md
       ├── emergency-context.md
       └── [other command files]
   ```

5. **Permission Issues (Linux/macOS)**
   ```bash
   chmod 644 .claude/commands/*.md
   chmod 755 .claude/commands/
   ```

#### Symptom: Commands work but give errors
**Typical Error**: "cache_control cannot be set for empty text blocks"

**Solution**:
```bash
# This usually means command files are corrupted or partially copied
# Solution: Clean and re-copy
rm -rf .claude/
mkdir -p .claude/commands
cp -r /path/to/claude-system/commands/* .claude/commands/
# Restart Claude Code
```

---

### Project Structure Issues

#### Symptom: "Missing requirements" error when starting
**Error Message**: "package.json file missing" or "src/ directory missing"

**Diagnosis**:
```bash
# Check what's actually missing:
ls -la package.json      # Should exist for React Native projects
ls -la src/              # Should exist for source code
ls -la assets/images/    # Should exist for app assets
```

**Solutions**:

1. **For New Projects**:
   ```bash
   # Create React Native/Expo project first:
   npx create-expo-app MyApp --template
   cd MyApp
   # Then run Claude system setup
   ```

2. **For Existing Projects Missing Structure**:
   ```bash
   # Create missing directories:
   mkdir -p src/{components,screens,utils,types}
   mkdir -p assets/images
   
   # Verify package.json exists and has React Native deps:
   cat package.json | grep "react-native\|expo"
   ```

3. **For Non-React Native Projects**:
   ```bash
   # Initialize React Native project:
   npx @react-native-community/cli init MyApp
   # Or Expo:
   npx create-expo-app MyApp
   ```

---

### Template and File Issues

#### Symptom: Template files contain placeholders like `[NOMBRE_DEL_PROYECTO]`
**Cause**: Setup script didn't run or failed to customize templates

**Manual Fix**:
```bash
# Replace placeholders manually:
PROJECT_NAME="MyActualApp"
DATE=$(date +"%Y-%m-%d")

# Replace in all markdown files:
find . -name "*.md" -type f -exec sed -i.bak \
  -e "s/\[NOMBRE_DEL_PROYECTO\]/$PROJECT_NAME/g" \
  -e "s/\[Fecha actual\]/$DATE/g" \
  {} \;

# Clean backup files:
find . -name "*.md.bak" -delete
```

#### Symptom: PRD.md is empty or generic
**Impact**: `/parse-prd` won't generate meaningful tasks

**Solution**:
```markdown
# Edit PRD.md with actual project content:
# Product Requirements Document - MyApp

## 🎯 Project Vision
MyApp helps [target users] to [solve specific problem] by [providing solution].

## 🚀 Core Features
### Authentication
- User registration and login
- Password recovery

### Main Feature 1
- [Specific functionality]
- [User stories]

### Main Feature 2
- [Specific functionality]
- [User stories]

## 📱 Technical Stack
- Frontend: React Native + Expo
- Backend: Supabase/Firebase
- State: Zustand + TanStack Query
```

---

## 🎯 Task Management Issues

### No Tasks Generated from `/parse-prd`

#### Symptom: Command runs but claude_tasks.md remains empty or generic
**Most Common Causes**:

1. **PRD.md lacks sufficient detail**
   ```bash
   # Check PRD content:
   wc -l PRD.md
   # Should have at least 50+ lines of meaningful content
   
   # Check for specific sections:
   grep -n "Features\|functionality\|requirements" PRD.md
   ```

2. **PRD.md missing key sections**
   ```markdown
   # Add these sections to PRD.md:
   ## 🚀 Funcionalidades Core
   ### Feature 1: Authentication
   - Login/register functionality
   - Password recovery
   
   ### Feature 2: [Your Main Feature]
   - Specific user stories
   - Detailed requirements
   ```

3. **Claude memory issues**
   ```bash
   # Try this sequence:
   /emergency-context    # Reset context
   /parse-prd           # Try again
   ```

#### Symptom: Generated tasks are too generic or incomplete
**Solution**: Enhance PRD with more specific requirements
```markdown
# Instead of:
## Features
- User management
- Data display

# Write:
## Features
### User Authentication (Phase 1 UI, Phase 2 Backend)
- Registration form with email/password validation
- Login screen with "remember me" option
- Password recovery with email verification
- User profile management with avatar upload

### Product Catalog (Phase 1 UI, Phase 2 API)
- Product listing with search and filtering
- Product detail view with images and reviews
- Shopping cart functionality
- Wishlist/favorites system
```

---

### Task Progress and Context Issues

#### Symptom: "No project context found" warnings
**Cause**: Memory not properly storing project information

**Solution Sequence**:
```bash
# 1. Clear and reload context:
/emergency-context

# 2. If still no context, regenerate:
/parse-prd
/emergency-context

# 3. Verify memory storage working:
# Check if Claude remembers project details from previous commands
```

#### Symptom: Tasks not updating progress properly
**Debug Steps**:
```bash
# 1. Check claude_tasks.md file:
cat claude_tasks.md | head -20
# Should show project tasks and current status

# 2. Verify write permissions:
ls -la claude_tasks.md
# Should be writable

# 3. Test manual update:
/task-progress
# Should update the file with current progress
```

#### Symptom: Completed tasks not marked as done
**Manual Fix**:
```bash
# Edit claude_tasks.md directly:
# Change: ## 🔄 TaskName - IN PROGRESS
# To:     ## ✅ TaskName - COMPLETED

# Then run:
/sync-tasks    # To clean up and reorganize
```

---

## 💻 Development Environment Issues

### React Native/Expo Specific Problems

#### Symptom: "Expo CLI not found" or development server won't start
**Solutions**:
```bash
# Install/update Expo CLI:
npm install -g @expo/cli

# Clear cache and restart:
npx expo start --clear

# Check project integrity:
npx expo doctor
```

#### Symptom: TypeScript errors after setup
**Common Fixes**:
```bash
# Install TypeScript dependencies:
npm install -D typescript @types/react @types/react-native

# Generate tsconfig.json if missing:
npx tsc --init

# Check path mappings in tsconfig.json:
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"]
    }
  }
}
```

#### Symptom: "Module not found" errors for src/ imports
**Solution**:
```bash
# Check babel.config.js has path resolution:
module.exports = {
  presets: ['babel-preset-expo'],
  plugins: [
    [
      'module-resolver',
      {
        root: ['./src'],
        alias: {
          '@': './src',
        },
      },
    ],
  ],
};

# Install babel plugin:
npm install --save-dev babel-plugin-module-resolver
```

---

### Performance and Memory Issues

#### Symptom: Claude Code becomes slow or unresponsive
**Solutions**:
1. **Clear Claude conversation history**
2. **Restart Claude Code**
3. **Check project file size**:
   ```bash
   du -sh .
   # If >500MB, check for large files:
   find . -size +10M -type f
   ```

#### Symptom: Commands timeout or take very long
**Debugging**:
```bash
# Check file sizes:
ls -lah *.md
# claude_tasks.md should be <1MB

# If files are huge, truncate history:
# Keep only recent entries in claude_tasks.md
```

---

## 🔍 Advanced Troubleshooting

### Debug Mode and Logging

#### Enable Detailed Debugging
```bash
# Add to PRD.md for debugging:
## DEBUG MODE
Debug: Enable detailed logging and error reporting

# This helps Claude provide more detailed error information
```

#### Manual Context Recovery
```bash
# If emergency-context fails, manually load context:
echo "Current project: $(basename $(pwd))"
echo "Files present:"
ls -la *.md
echo "Directory structure:"
tree -L 2 2>/dev/null || find . -type d -maxdepth 2
```

### File System Issues

#### Symptom: Permission denied errors
**Linux/macOS Solution**:
```bash
# Fix permissions:
chmod -R 755 .claude/
chmod 644 *.md
chmod 644 .claude/commands/*.md

# Check ownership:
ls -la .claude/
# Should be owned by your user, not root
```

#### Symptom: Files appear but Claude can't read them
**Solutions**:
```bash
# Check file encoding:
file *.md
# Should show "UTF-8 Unicode text"

# If wrong encoding, convert:
iconv -f ISO-8859-1 -t UTF-8 file.md > file_utf8.md
mv file_utf8.md file.md
```

### Network and API Issues

#### Symptom: `/analyze-complexity` fails with network errors
**Solutions**:
1. **Check internet connection**
2. **Retry the command**
3. **Use manual analysis**:
   ```
   # Instead of /analyze-complexity, manually research:
   Research [task name] implementation in React Native
   ```

#### Symptom: Web search features not working
**Workaround**: Provide research manually
```
Based on research, [TaskName] has these characteristics:
- Complexity: [1-10]
- Dependencies: [list]
- Estimated time: [hours]
- Key challenges: [list]
```

---

## 📊 Emergency Recovery Procedures

### Complete System Reset
**When everything is broken**:
```bash
# 1. Backup current work:
cp claude_tasks.md claude_tasks_backup.md
cp PRD.md PRD_backup.md

# 2. Clean slate:
rm -rf .claude/
rm CLAUDE.md claude_tasks.md claude_self_improve.md

# 3. Re-setup:
/path/to/claude-system/scripts/setup-project.sh --force

# 4. Restore customizations:
# Edit PRD.md with your project details
# Run /parse-prd to regenerate tasks
```

### Recover Lost Tasks
**If claude_tasks.md gets corrupted**:
```bash
# 1. Check git history:
git log --oneline claude_tasks.md
git show HEAD~1:claude_tasks.md > claude_tasks_recovered.md

# 2. If no git history, recreate from PRD:
/parse-prd    # Regenerates from PRD.md

# 3. Manually add any recent progress
```

### Context Recovery
**If Claude loses all project context**:
```bash
# Comprehensive context reload:
/emergency-context
# Then provide manual summary:
"Project: [name], Phase: [1/2], Current focus: [description], Last completed: [task]"
```

---

## 📞 Getting Help

### Self-Diagnosis Checklist
Before seeking help, verify:
- [ ] Claude Code restarted after setup
- [ ] All required files exist (CLAUDE.md, PRD.md, etc.)
- [ ] Command files present in `.claude/commands/`
- [ ] PRD.md has meaningful content
- [ ] Project is React Native/Expo based
- [ ] Permissions are correct (Linux/macOS)

### Information to Provide When Seeking Help
```bash
# System information:
echo "OS: $(uname -a)"
echo "Node: $(node --version)"
echo "Project type: $(ls package.json app.json expo.json 2>/dev/null)"
echo "Claude files: $(ls -la *.md .claude/commands/ 2>/dev/null)"
```

### Common Fixes Summary
1. **90% of issues**: Restart Claude Code
2. **Command errors**: Re-copy command files and restart
3. **No tasks generated**: Improve PRD.md detail
4. **Context lost**: Run `/emergency-context`
5. **Setup incomplete**: Re-run setup script with `--force`

---

**Support**: If issues persist after trying these solutions, please provide the diagnostic information above when seeking help.
```
