# MCP Installation and Configuration Guide

## 🔌 What are MCP Servers?

**MCP (Model Context Protocol)** servers extend Claude's capabilities by providing specialized tools and integrations. Think of them as "plugins" that give Claude superpowers for specific tasks.

## 🚀 Automatic Installation Process

The Context Engineering System handles MCP installation **completely automatically**:

### Step 1: Installation Creates Configuration

When you run:
```bash
./install-context-engine.sh --global
```

The installer **automatically creates** `~/.claude/.mcp.json`:

> **Important**: MCP servers are configured at the project level. The `.mcp.json` file must be present in your working project directory for MCP features to work. Use `./install-context-engine.sh --project .` to automatically set up MCP in your project.

```json
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"],
      "description": "Sequential thinking assistance for complex problem solving"
    },
    "puppeteer": {
      "command": "npx", 
      "args": ["-y", "@modelcontextprotocol/server-puppeteer"],
      "description": "Browser automation and web interaction capabilities"
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp"],
      "description": "Up-to-date code documentation for LLMs and AI code editors"
    },
    "magic": {
      "command": "npx",
      "args": ["-y", "@magicuidesign/mcp"],
      "description": "Official MCP server for Magic UI components and design system"
    }
  }
}
```

### Step 2: Claude Desktop Auto-Downloads

**No manual installation needed!** When you first use an MCP flag:

```bash
/context-engineer "Add browser automation feature" --mcp-puppeteer
```

Claude Desktop will:
1. 🔍 **Detect** the MCP server configuration
2. 📦 **Download** the server automatically via `npx`
3. 🚀 **Launch** the server in the background
4. ✅ **Connect** and start using the capabilities

### Step 3: Project Setup (Automatic)

The installer can automatically set up MCP for specific projects:

```bash
# Automatic project setup (includes .mcp.json copy)
./install-context-engine.sh --project /path/to/your/project

# Or from within your project directory
./install-context-engine.sh --project .
```

This automatically:
- Creates project workflow structure
- Copies `.mcp.json` to your project directory
- Sets up project-specific configuration
- Ensures MCP servers are available for that project

## 🔧 Available MCP Servers

### 🧠 Sequential Thinking
- **Purpose**: Advanced problem-solving and step-by-step reasoning
- **Usage**: `--mcp-sequential` or `--mseq`
- **Best for**: Complex logic, multi-step solutions, debugging
- **Example**: 
  ```bash
  /context-engineer "Optimize database performance" --mcp-sequential --think-hard
  ```

### 🌐 Puppeteer
- **Purpose**: Browser automation and web interaction
- **Usage**: `--mcp-puppeteer` or `--mpup`
- **Best for**: UI testing, web scraping, screenshot capture
- **Example**:
  ```bash
  /execute-context frontend-testing --mcp-puppeteer --persona-testing
  ```

### 📚 Context7
- **Purpose**: Up-to-date code documentation for LLMs and AI code editors
- **Usage**: `--mcp-context7` or `--mc7`
- **Best for**: Getting current documentation, library-specific code examples, version-specific implementations
- **Example**:
  ```bash
  /context-engineer "Implement Next.js 14 server components" --mcp-context7
  ```

### ✨ Magic UI
- **Purpose**: Official MCP server for Magic UI components and design system
- **Usage**: `--mcp-magic` or `--mmag`
- **Best for**: UI component development, design system integration, React component generation
- **Example**:
  ```bash
  /context-engineer "Add animated hero section" --mcp-magic --persona-architect
  ```

## ✅ Verification and Testing

### Check Configuration
```bash
# View global MCP configuration template
cat ~/.claude/.mcp.json

# View project MCP configuration (after running --project setup)
cat .mcp.json

# Check if file exists and is valid JSON
python3 -m json.tool .mcp.json
```

### Test MCP Functionality
```bash
# Test sequential thinking
/context-engineer "Complex algorithm optimization" --mcp-sequential

# Test puppeteer (requires browser)
/execute-context ui-automation --mcp-puppeteer --test

# Test context7 documentation
/context-engineer "Implement React hooks" --mcp-context7

# Test magic UI components
/context-engineer "Create animated landing page" --mcp-magic
```

### Verify in Claude Desktop
1. **Open Claude Desktop**
2. **Look for MCP indicators** in the interface
3. **Use commands with MCP flags**
4. **Check for enhanced capabilities**

## 🛠️ Prerequisites

### Required Software
- **Node.js v16+**: For `npx` command
  ```bash
  node --version  # Should show v16.0.0 or higher
  ```

- **Claude Desktop**: Latest version
  ```bash
  # Update Claude Desktop from the application
  # Or download from official website
  ```

### System Requirements
- **Internet connection**: For downloading MCP servers
- **Sufficient disk space**: ~50MB for MCP servers
- **Modern operating system**: macOS 10.15+, Windows 10+, Linux

## 🔧 Troubleshooting

### Problem: MCP servers not loading

**Symptoms**: Commands with MCP flags don't show enhanced behavior

**Solutions**:
1. **Check Node.js**:
   ```bash
   node --version
   npm --version
   ```

2. **Verify MCP configuration**:
   ```bash
   # Check global template
   cat ~/.claude/.mcp.json
   
   # Check project configuration (if using --project setup)
   cat .mcp.json
   ```
   
3. **Ensure project setup was run**:
   ```bash
   # If .mcp.json is missing, run project setup
   ./install-context-engine.sh --project .
   ```

4. **Restart Claude Desktop**:
   - Close completely
   - Reopen application
   - Try MCP command again

### Problem: Slow MCP response

**Symptoms**: Long delays when using MCP flags

**Solutions**:
1. **Check network connection**
2. **Update Node.js** to latest LTS version
3. **Clear npm cache**:
   ```bash
   npm cache clean --force
   ```

### Problem: Permission errors

**Symptoms**: `npx` commands fail with permission errors

**Solutions**:
1. **Fix npm permissions**:
   ```bash
   npm config set prefix ~/.npm-global
   export PATH=~/.npm-global/bin:$PATH
   ```

2. **Use Node version manager**:
   ```bash
   # Install nvm (if not already installed)
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   
   # Install and use latest Node.js
   nvm install node
   nvm use node
   ```

### Problem: MCP configuration corrupted

**Symptoms**: JSON parsing errors

**Solutions**:
1. **Backup current config**:
   ```bash
   cp .mcp.json .mcp.json.backup
   ```

2. **Recreate configuration**:
   ```bash
   ./install-context-engine.sh --update --force
   ```

## 🎯 Best Practices

### When to Use MCP Servers

1. **Sequential Thinking** (`--mcp-sequential`):
   - Complex algorithms
   - Multi-step problem solving
   - Debugging difficult issues
   - Performance optimization

2. **Puppeteer** (`--mcp-puppeteer`):
   - UI testing automation
   - Web scraping projects
   - Screenshot automation
   - Browser-based testing

4. **Context7** (`--mcp-context7`):
   - Getting up-to-date library documentation
   - Version-specific code examples
   - Framework-specific implementations
   - Current best practices research

5. **Magic UI** (`--mcp-magic`):
   - UI component development
   - Design system integration
   - Animated component creation
   - React component library usage

### Performance Tips

1. **Use MCP flags selectively** - only when needed
2. **Combine with personas** for domain expertise
3. **Cache results** when possible
4. **Monitor resource usage** during development

### Security Considerations

1. **MCP servers run locally** - no data sent to external services
2. **Downloaded via npm** - verify package authenticity
3. **Sandboxed execution** - limited system access
4. **Regular updates** - keep MCP servers current

## 🔄 Updates and Maintenance

### Updating MCP Servers
```bash
# Clear npm cache
npm cache clean --force

# Update Context Engineering System (includes MCP config)
./install-context-engine.sh --update

# Restart Claude Desktop
# MCP servers will auto-update on next use
```

### Monitoring MCP Health
```bash
# Check MCP configuration validity
python3 -m json.tool .mcp.json >/dev/null && echo "✅ MCP config valid" || echo "❌ MCP config invalid"

# Test Node.js and npx
npx --version

# Verify project MCP config exists
ls -la .mcp.json
```

---

## 📚 Additional Resources

- **MCP Official Documentation**: [Model Context Protocol Docs](https://modelcontextprotocol.io/)
- **Claude Desktop Help**: In-app help documentation
- **Context Engineering Guide**: `docs/commands-reference.md`
- **Troubleshooting**: `docs/troubleshooting.md`

---

*MCP servers extend Claude's capabilities automatically - no manual setup required!*