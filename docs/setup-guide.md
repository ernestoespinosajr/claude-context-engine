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
