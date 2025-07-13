# Migration Guide: Eliminating Command Duplication

## 🎯 Problem Solved

**Before v2.0.1**: Installing Context Engineering System both globally (`~/.claude/`) and per-project created duplicate commands, causing confusion and conflicts.

**After v2.0.1**: Following SuperClaude's proven approach - commands installed ONCE globally, projects only get configurations.

## 🚀 New Architecture

### Before (Problematic)
```
~/.claude/CLAUDE.md           # Commands + global config
~/.claude/commands/           # Command definitions

project/CLAUDE.md             # DUPLICATE commands + project config  ❌
project/workflow/             # Workflow structure
```

### After (Clean)
```
~/.claude/CLAUDE.md           # Commands + global config
~/.claude/commands/           # Command definitions (ONLY HERE)

project/CLAUDE.md             # ONLY project config (no commands) ✅  
project/workflow/             # Workflow structure
```

## 📋 Migration Steps

### For New Installations

```bash
# Step 1: Install commands globally (required)
./install-context-engine.sh --global

# Step 2: Add project config (optional)
./install-context-engine.sh --project ./my-project
```

### For Existing Users

#### Option A: Clean Migration (Recommended)
```bash
# 1. Backup your current setup
cp -r ~/.claude ~/.claude-backup
cp CLAUDE.md CLAUDE.md.backup  # if in project

# 2. Clean install globally
./install-context-engine.sh --global --force

# 3. Migrate project configurations
# The system will automatically create clean project configs
./install-context-engine.sh --project .
```

#### Option B: Manual Migration
```bash
# 1. Keep your global installation as-is
# 2. Replace project CLAUDE.md with config-only version
# 3. Remove command definitions from project files
```

### Auto-Detection Features

The new system automatically:
- **Detects existing global installations**
- **Warns before creating duplicates**
- **Provides migration recommendations**
- **Prevents command conflicts**

## 🔍 How to Verify Migration

### Check for Duplicates
```bash
# This should ONLY show global commands
ls ~/.claude/commands/

# This should NOT contain command definitions
cat ./CLAUDE.md  # In your project
```

### Test Commands
```bash
# Commands should work from any project directory
cd /any/project/
/context-engineer "test feature"  # Should work
/context-status                   # Should work
```

## 📝 Project CLAUDE.md Template

After migration, your project `CLAUDE.md` should look like:

```markdown
# Project Configuration - Context Engineering System

This project uses the global Context Engineering System installed at: ~/.claude
Commands are provided globally and available in all projects automatically.

## Project Metadata
- **Project Name**: my-awesome-project
- **Installation Date**: 2025-07-13
- **Context Engine Version**: 2.0.1
- **Global Installation**: ~/.claude

## Project-Specific Context

### Technology Stack
- Framework: React Native
- State Management: Zustand
- Navigation: React Navigation
- Styling: Styled Components

### Development Standards
- All components must have TypeScript definitions
- All features must include unit tests
- Follow semantic versioning for releases

### Custom Templates
- react_native_screen: "Create new app screen with navigation"
- api_integration: "Add new API endpoint integration"

---
*Project powered by Context Engineering System v2.0.1*
*Commands: /context-engineer, /execute-context, /context-status*
```

## ⚠️ Troubleshooting

### Problem: Commands not found
**Solution**: Ensure global installation exists
```bash
./install-context-engine.sh --global
```

### Problem: Still seeing duplicates
**Solution**: Clean project CLAUDE.md
```bash
# Remove command definitions from project CLAUDE.md
# Keep only project-specific configurations
```

### Problem: Migration not working
**Solution**: Force clean installation
```bash
# Backup and clean install
cp -r ~/.claude ~/.claude-backup
./install-context-engine.sh --global --force
```

## 🎉 Benefits After Migration

- ✅ **Zero Command Duplication**: Commands defined once, work everywhere
- ✅ **Cleaner Architecture**: Clear separation of concerns
- ✅ **Easier Maintenance**: Single source of truth for commands
- ✅ **Better User Experience**: No more confusion about which commands to use
- ✅ **Future-Proof**: Following proven SuperClaude architecture

## 🆘 Need Help?

If you encounter issues during migration:

1. **Check System Status**: Run `./install-context-engine.sh --verify`
2. **Review Installation Report**: Check `~/.claude/installation-report.md`
3. **Force Clean Install**: Use `--force` flag to override existing files
4. **Backup First**: Always backup before major changes

---

*Migration Guide for Context Engineering System v2.0.1*
*Inspired by SuperClaude's proven anti-duplication architecture*