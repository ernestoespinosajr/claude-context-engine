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

The installer **automatically creates** `~/.claude/mcp.json`:

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
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"],
      "description": "Web content fetching and processing"
    }
  }
}
```

### Step 2: Claude Desktop Auto-Downloads

**No manual installation needed!** When you first use an MCP flag:

```bash
/context-engineer "Add web scraping feature" --mcp-fetch
```

Claude Desktop will:
1. 🔍 **Detect** the MCP server configuration
2. 📦 **Download** the server automatically via `npx`
3. 🚀 **Launch** the server in the background
4. ✅ **Connect** and start using the capabilities

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

### 📥 Fetch
- **Purpose**: Web content retrieval and processing
- **Usage**: `--mcp-fetch` or `--mfetch`
- **Best for**: API integration, web scraping, content analysis
- **Example**:
  ```bash
  /context-engineer "Add news feed integration" --mcp-fetch --persona-architect
  ```

## ✅ Verification and Testing

### Check Configuration
```bash
# View MCP configuration
cat ~/.claude/mcp.json

# Check if file exists and is valid JSON
python3 -m json.tool ~/.claude/mcp.json
```

### Test MCP Functionality
```bash
# Test sequential thinking
/context-engineer "Complex algorithm optimization" --mcp-sequential

# Test puppeteer (requires browser)
/execute-context ui-automation --mcp-puppeteer --test

# Test fetch capabilities
/context-engineer "API integration design" --mcp-fetch --think
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
   cat ~/.claude/mcp.json
   ```

3. **Restart Claude Desktop**:
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
   cp ~/.claude/mcp.json ~/.claude/mcp.json.backup
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

3. **Fetch** (`--mcp-fetch`):
   - API integrations
   - Web content analysis
   - Real-time data processing
   - Content aggregation

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
python3 -m json.tool ~/.claude/mcp.json >/dev/null && echo "✅ MCP config valid" || echo "❌ MCP config invalid"

# Test Node.js and npx
npx --version

# Verify Claude Desktop can access MCP config
ls -la ~/.claude/mcp.json
```

---

## 📚 Additional Resources

- **MCP Official Documentation**: [Model Context Protocol Docs](https://modelcontextprotocol.io/)
- **Claude Desktop Help**: In-app help documentation
- **Context Engineering Guide**: `docs/commands-reference.md`
- **Troubleshooting**: `docs/troubleshooting.md`

---

*MCP servers extend Claude's capabilities automatically - no manual setup required!*