# ⚡ Quick Start - 5 Minutes Setup

> Get your React Native project with Claude Code automation running in 5 minutes!

## 🎯 What You'll Get

✅ **Automated task management** from PRD to completion  
✅ **10 specialized slash commands** for development workflow  
✅ **XML-enforced best practices** and quality gates  
✅ **Two-phase development** methodology (Frontend → Backend)  
✅ **Complete design system** and component templates  

---

## ⚡ Step 1: Clone and Setup (1 minute)

### 1. Clonar el Repositorio

Abre tu terminal y clona este repositorio en tu máquina local:

```bash
git clone https://github.com/ernestoespinosajr/claude-code-react-native-system.git
cd claude-code-react-native-system

# Copy to your project directory
cp -r templates/* /path/to/your/react-native-project/
cp -r commands/* /path/to/your/react-native-project/.claude/commands/

# Or if starting fresh:
npx create-expo-app MyApp --template
cd MyApp
cp -r ../claude-code-react-native-system/templates/* ./
mkdir -p .claude/commands
cp -r ../claude-code-react-native-system/commands/* .claude/commands/
```

## 📝 Step 2: Customize PRD (2 minutes)

Edit `PRD.md` with your project info:

```markdown
# Product Requirements Document - MyAwesomeApp

## 🎯 Visión del Proyecto
My app helps users [solve what problem] by [doing what].

## 🚀 Funcionalidades Core
### Authentication
- Login/Register with email
- Password recovery

### Main Feature
- [Your main feature description]
- [Key user stories]

## 📱 Stack Tecnológico
- Frontend: React Native + Expo SDK 53+
- Backend: Supabase/Firebase
- State: Zustand + TanStack Query
```

**💡 Tip**: Keep it simple for now - you can expand later!

## 🔧 Step 3: Verify Structure (30 seconds)

```bash
# Verify you have these files:
ls -la CLAUDE.md PRD.md                    # ✅ Should exist
ls -la .claude/commands/                    # ✅ Should have 10 .md files
ls -la src/ assets/images/                  # ✅ Should exist

# If missing any:
mkdir -p src/{components,screens,utils} assets/images
```

## 🚀 Step 4: Start Claude Code (30 seconds)

1. **Open Claude Code** in your project directory
2. **⚠️ IMPORTANT**: Restart Claude Code after copying files
3. **Test slash commands**:
   ```
   Type: /parse-prd
   ```
   If it works → ✅ You're ready!  
   If error → Restart Claude Code again

## 🎯 Step 5: Generate Tasks (1 minute)

Run these commands in sequence:

```bash
# 1. Generate initial task backlog
/parse-prd

# 2. Analyze task complexity (with web research)
/analyze-complexity

# 3. Break complex tasks into subtasks
/expand-all

# 4. Get context and start developing
/emergency-context
/start-task
```

**🎉 Done! You now have**:
- ✅ Organized task backlog in `claude_tasks.md`
- ✅ Complexity analysis for each task  
- ✅ Subtasks broken down to 1-4 hours each
- ✅ First task ready to start

---

## 🔥 Quick Command Reference

| Command | What it does | When to use |
|---------|--------------|-------------|
| `/parse-prd` | Generate tasks from PRD | **Once** at project start |
| `/analyze-complexity` | Research task difficulty | After parse-prd or new tasks |
| `/expand-task [name]` | Break task into subtasks | For complex tasks (score ≥6) |
| `/start-task` | Begin working on next task | When ready for new task |
| `/task-progress` | Update current progress | **During development** |
| `/complete-task` | Finish and document task | When task is done |
| `/emergency-context` | Recover full context | **Start of each session** |

## 🎯 Development Flow

### Daily Workflow:
```bash
# Morning
/emergency-context     # Load where you left off

# During work  
/task-progress        # Update progress as you code

# When done
/complete-task        # Document achievements
/start-task          # Begin next task
```

### When You Discover New Tasks:
```bash
/add-discovered-task  # Automatically categorizes and prioritizes
```

---

## ⚠️ Common Quick Fixes

### Slash commands not working?
```bash
# 1. Restart Claude Code completely
# 2. Verify files exist:
ls -la .claude/commands/*.md

# 3. If still broken, recreate:
mkdir -p .claude/commands
# Copy command files again
```

### No tasks generated from `/parse-prd`?
```bash
# Check PRD.md has content:
cat PRD.md

# Make sure it includes:
# - Project description
# - Features list
# - Technical specifications
```

### Commands working but no context?
```bash
/emergency-context    # This loads full project context
```

---

## 🚀 What's Next?

### First Day Goals:
- [ ] `/parse-prd` generates 10-15 tasks
- [ ] `/analyze-complexity` identifies 3-5 complex tasks  
- [ ] `/expand-all` creates 30+ specific subtasks
- [ ] Complete first subtask (usually "Project Setup")

### First Week Goals:
- [ ] Complete Phase 1 setup tasks
- [ ] Build 2-3 core screens with dummy data
- [ ] Establish component library
- [ ] App running on simulator

### Advanced Features:
- **Custom templates**: Modify templates for your team
- **Team workflows**: Share command patterns
- **Integration**: Connect with your existing tools
- **Automation**: Extend with additional scripts

---

## 📚 Need More Help?

- **Full Documentation**: Check main `README.md`
- **Detailed Setup**: See `docs/setup-guide.md`
- **Commands Reference**: See `docs/commands-reference.md`
- **Troubleshooting**: See `docs/troubleshooting.md`
- **Examples**: Check `examples/` directory

## 💡 Pro Tips

### 🎯 Maximum Productivity:
1. **Always start sessions** with `/emergency-context`
2. **Update progress frequently** with `/task-progress`
3. **Break large tasks** before starting them
4. **Document learnings** - the system gets smarter!

### 🛡️ Quality Gates:
- System **automatically stops** if environment incomplete
- **Must confirm** before major changes (dependencies, etc.)
- **Phase 1 complete** before Phase 2 backend work
- **All subtasks tested** before marking complete

### ⚡ Speed Hacks:
- Use **tab completion** for file references
- **Copy-paste** common patterns from `claude_self_improve.md`
- **Reuse components** - system tracks what's available
- **Follow suggestions** - Claude learns your patterns

---

## 🎉 Success Indicators

After setup, you should see:

✅ **In claude_tasks.md**: 20-40 organized, prioritized tasks  
✅ **In Claude responses**: Automatic task tracking and updates  
✅ **In development**: Predictable 1-4 hour work chunks  
✅ **In progress**: Clear next steps always available  
✅ **In quality**: Consistent patterns and documentation  

**🚀 Happy coding with your AI-powered development workflow!**

---

*Setup time: ~5 minutes | First task completion: ~1-2 hours | Full productivity: Same day*