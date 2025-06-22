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
