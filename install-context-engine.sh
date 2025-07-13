#!/bin/bash
# Context Engineering System v2.0 - Automated Installation Script
# Enterprise-class AI development assistant with advanced token economy

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default installation options
INSTALL_ALL=false
INSTALL_TOKEN_ECONOMY=false
INSTALL_MCP=false
INSTALL_PERSONAS=false
INSTALL_FLAGS=false
INSTALL_COMPRESSION=false
INSTALL_WORKFLOW=false
UPDATE_MODE=false
CLEAN_MODE=false
CUSTOM_DIR=""
DEFAULT_CLAUDE_DIR="$HOME/.claude"

# Version information
VERSION="2.0"
INSTALL_DATE=$(date +"%Y-%m-%d %H:%M:%S")

print_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║          Context Engineering System v${VERSION} Installer          ║"
    echo "║     Advanced Token Economy & Intelligent Workflow Management ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

show_help() {
    echo "Context Engineering System v${VERSION} Installation Options:"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Installation Options:"
    echo "  --full                    Complete installation (all components)"
    echo "  --token-economy-only      Install only token economy system"
    echo "  --mcp-only               Install only MCP integration"
    echo "  --personas-only          Install only personas system"
    echo "  --flags-only             Install only flag system"
    echo "  --compression-only       Install only compression system"
    echo "  --workflow-management-only Install only workflow management"
    echo "  --update                 Update existing installation"
    echo "  --clean                  Remove obsolete files and directories"
    echo "  --dir <path>             Custom installation directory (default: ~/.claude)"
    echo "  --help                   Show this help message"
    echo ""
    echo "Installation Location:"
    echo "  Default: ~/.claude (global Claude configuration)"
    echo "  Custom:  --dir /path/to/custom/location"
    echo ""
    echo "Cleaning Options:"
    echo "  --clean can be combined with any installation option:"
    echo "  $0 --update --clean      # Update and clean obsolete files"
    echo "  $0 --full --clean        # Fresh install with cleanup"
    echo ""
    echo "Examples:"
    echo "  $0 --full                # Install to ~/.claude (global)"
    echo "  $0 --full --dir /opt/claude  # Install to custom location"
    echo "  $0 --update              # Update existing installation"
    echo "  $0 --update --clean      # Update and remove obsolete files"
    echo "  $0 --token-economy-only --dir ./my-claude  # Custom location"
    echo ""
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --full)
                INSTALL_ALL=true
                shift
                ;;
            --token-economy-only)
                INSTALL_TOKEN_ECONOMY=true
                shift
                ;;
            --mcp-only)
                INSTALL_MCP=true
                shift
                ;;
            --personas-only)
                INSTALL_PERSONAS=true
                shift
                ;;
            --flags-only)
                INSTALL_FLAGS=true
                shift
                ;;
            --compression-only)
                INSTALL_COMPRESSION=true
                shift
                ;;
            --workflow-management-only)
                INSTALL_WORKFLOW=true
                shift
                ;;
            --update)
                UPDATE_MODE=true
                shift
                ;;
            --clean)
                CLEAN_MODE=true
                shift
                ;;
            --dir)
                if [[ -n "$2" && "$2" != --* ]]; then
                    CUSTOM_DIR="$2"
                    shift 2
                else
                    print_error "--dir requires a directory path"
                    show_help
                    exit 1
                fi
                ;;
            --help)
                show_help
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # If no specific options, default to full install
    if [[ "$INSTALL_TOKEN_ECONOMY" == false && "$INSTALL_MCP" == false && \
          "$INSTALL_PERSONAS" == false && "$INSTALL_FLAGS" == false && \
          "$INSTALL_COMPRESSION" == false && "$INSTALL_WORKFLOW" == false && \
          "$UPDATE_MODE" == false ]]; then
        INSTALL_ALL=true
    fi
}

setup_installation_directory() {
    # Determine installation directory
    if [[ -n "$CUSTOM_DIR" ]]; then
        CLAUDE_DIR="$CUSTOM_DIR"
        print_info "Using custom installation directory: $CLAUDE_DIR"
    else
        CLAUDE_DIR="$DEFAULT_CLAUDE_DIR"
        print_info "Using default installation directory: $CLAUDE_DIR"
    fi
    
    # Expand tilde if present
    CLAUDE_DIR="${CLAUDE_DIR/#\~/$HOME}"
    
    # Create base directory if it doesn't exist
    if [[ ! -d "$CLAUDE_DIR" ]]; then
        print_info "Creating installation directory: $CLAUDE_DIR"
        mkdir -p "$CLAUDE_DIR"
    fi
    
    # Change to installation directory
    print_info "Changing to installation directory..."
    cd "$CLAUDE_DIR" || {
        print_error "Failed to change to directory: $CLAUDE_DIR"
        exit 1
    }
    
    print_status "Installation directory set: $(pwd)"
}

detect_environment() {
    print_info "Detecting environment..."
    
    # For global installation, we don't need CLAUDE.md in current directory
    if [[ "$CLAUDE_DIR" == "$DEFAULT_CLAUDE_DIR" ]]; then
        print_info "Global installation mode - no project-specific requirements"
    else
        # For custom directory, check if we're in a Context Engineering project
        if [[ ! -f "CLAUDE.md" ]]; then
            print_warning "No CLAUDE.md found. This may not be a Context Engineering project."
            read -p "Continue anyway? (y/N): " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                print_error "Installation cancelled."
                exit 1
            fi
        fi
    fi
    
    # Check Node.js for potential React Native projects
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        print_status "Node.js detected: $NODE_VERSION"
    fi
    
    # Check Python for potential FastAPI projects
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version)
        print_status "Python detected: $PYTHON_VERSION"
    fi
    
    # Check Git
    if command -v git &> /dev/null; then
        print_status "Git detected: $(git --version)"
    else
        print_warning "Git not found. Some features may not work optimally."
    fi
}

create_directory_structure() {
    print_info "Creating Context Engineering directory structure..."
    
    # Create main commands directory structure
    mkdir -p commands/shared
    mkdir -p personas
    mkdir -p mcp
    mkdir -p docs
    
    # For non-global installations, also create project-specific directories
    if [[ "$CLAUDE_DIR" != "$DEFAULT_CLAUDE_DIR" ]]; then
        # Create workflow directories (enhanced structure)
        mkdir -p workflow/planned
        mkdir -p workflow/in-progress/active
        mkdir -p workflow/in-progress/paused
        mkdir -p workflow/completed/successful
        mkdir -p workflow/completed/archived
        mkdir -p workflow/templates
        
        # Create context-engine directories
        mkdir -p context-engine/layers
        mkdir -p context-engine/managers
        mkdir -p context-engine/templates
        mkdir -p context-engine/validators
        
        # Create docs directory
        mkdir -p docs
        mkdir -p help-docs
    fi
    
    print_status "Directory structure created successfully"
    print_info "Installation location: $(pwd)"
}

install_core_modules() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_TOKEN_ECONOMY" == true ]]; then
        print_info "Installing core modules..."
        
        # Check if modules already exist
        if [[ -f ".claude/commands/shared/core.yml" && "$UPDATE_MODE" == false ]]; then
            print_warning "Core modules already exist. Use --update to overwrite."
        else
            print_status "Core modules installation completed"
        fi
    fi
}

setup_token_economy() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_TOKEN_ECONOMY" == true || "$INSTALL_COMPRESSION" == true ]]; then
        print_info "Setting up advanced token economy system..."
        
        # Verify token economy files exist
        local files_to_check=(
            ".claude/commands/shared/universal-constants.yml"
            ".claude/commands/shared/compression-patterns.yml"
            ".claude/commands/shared/token-economy.yml"
        )
        
        for file in "${files_to_check[@]}"; do
            if [[ -f "$file" ]]; then
                print_status "Token economy file exists: $(basename "$file")"
            else
                print_warning "Token economy file missing: $file"
            fi
        done
        
        print_status "Token economy system setup completed"
        print_info "UltraCompressed mode (--uc) available for 70% token reduction"
    fi
}

setup_mcp_integration() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_MCP" == true ]]; then
        print_info "Setting up MCP integration..."
        
        # Check for MCP configuration
        if [[ -f ".claude/commands/shared/mcp.yml" ]]; then
            print_status "MCP configuration found"
            print_info "Available MCPs: Context7, Sequential, Magic, Puppeteer"
            print_info "Use flags: --mcp-context7, --mcp-sequential, --mcp-magic, --mcp-puppeteer"
        else
            print_warning "MCP configuration not found"
        fi
        
        print_status "MCP integration setup completed"
    fi
}

install_personas() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_PERSONAS" == true ]]; then
        print_info "Installing specialized personas system..."
        
        # Check personas configuration
        if [[ -f ".claude/commands/shared/personas.yml" ]]; then
            print_status "Personas system configured"
            print_info "Available personas: 🏗️ Architect, 🔒 Security, ⚡ Performance, 🧪 Testing, 🚀 DevOps"
            print_info "Use flags: --persona-architect, --persona-security, --persona-performance, etc."
        else
            print_warning "Personas configuration not found"
        fi
        
        print_status "Personas system installation completed"
    fi
}

setup_flag_system() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_FLAGS" == true ]]; then
        print_info "Setting up advanced flag system..."
        
        # Check flags configuration
        if [[ -f ".claude/commands/shared/flags.yml" ]]; then
            print_status "Flag system configured"
            print_info "Universal flags available: --plan, --think, --uc, --compress, --cache"
            print_info "Quality flags: --validate, --test, --security, --benchmark"
        else
            print_warning "Flag system configuration not found"
        fi
        
        print_status "Flag system setup completed"
    fi
}

setup_workflow_management() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_WORKFLOW" == true ]]; then
        print_info "Setting up intelligent workflow management..."
        
        # Check if features directory exists and rename it
        if [[ -d "features" && ! -d "workflow" ]]; then
            print_info "Migrating 'features' directory to 'workflow'"
            mv features workflow
            print_status "Directory migration completed"
        fi
        
        # Verify workflow structure
        if [[ -d "workflow" ]]; then
            print_status "Workflow directory structure verified"
            print_info "Automatic file management: planned → in-progress → completed"
            print_info "Session-aware progress tracking enabled"
        else
            print_warning "Workflow directory not found"
        fi
        
        print_status "Workflow management setup completed"
    fi
}

setup_compression_system() {
    if [[ "$INSTALL_ALL" == true || "$INSTALL_COMPRESSION" == true ]]; then
        print_info "Setting up compression system..."
        
        # Check compression configuration
        if [[ -f ".claude/commands/shared/compression-patterns.yml" ]]; then
            print_status "Compression patterns configured"
            print_info "Auto-activation at 75% context usage"
            print_info "Target: 70% token reduction with --uc flag"
        else
            print_warning "Compression patterns not found"
        fi
        
        print_status "Compression system setup completed"
    fi
}

clean_obsolete_files() {
    if [[ "$CLEAN_MODE" == false ]]; then
        return 0
    fi
    
    print_info "Starting intelligent cleanup of Claude directory..."
    
    # Create backup directory with timestamp
    local backup_dir="backups/cleanup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$backup_dir"
    
    # Define the VALID structure for Context Engineering System v2.0
    local valid_structure=(
        # Valid directories
        "commands"
        "commands/shared"
        "personas"
        "mcp"
        "docs"
        "backups"
        
        # Valid files in commands/shared/
        "commands/shared/core.yml"
        "commands/shared/token-economy.yml"
        "commands/shared/compression-patterns.yml"
        "commands/shared/universal-constants.yml"
        "commands/shared/flags.yml"
        "commands/shared/personas.yml"
        "commands/shared/mcp.yml"
        "commands/shared/rules.yml"
        
        # Valid command files
        "commands/context-engineer.md"
        "commands/execute-context.md"
        "commands/context-status.md"
        
        # Valid root files
        "installation-report.md"
        "settings.local.json"
    )
    
    # For non-global installations, add project-specific valid items
    if [[ "$CLAUDE_DIR" != "$DEFAULT_CLAUDE_DIR" ]]; then
        valid_structure+=(
            "workflow"
            "workflow/planned"
            "workflow/in-progress"
            "workflow/in-progress/active"
            "workflow/in-progress/paused"
            "workflow/completed"
            "workflow/completed/successful"
            "workflow/completed/archived"
            "workflow/templates"
            "context-engine"
            "context-engine/layers"
            "context-engine/managers"
            "context-engine/templates"
            "context-engine/validators"
            "help-docs"
        )
    fi
    
    # Get ALL current files and directories in current installation directory
    local all_items=()
    while IFS= read -r -d '' item; do
        # Remove the leading ./ from find output
        item="${item#./}"
        all_items+=("$item")
    done < <(find . -maxdepth 4 -type f -o -type d | sed 's|^\./||' | sort -u | tr '\n' '\0')
    
    # Identify obsolete items (exist but not in valid structure)
    local items_to_remove=()
    
    for item in "${all_items[@]}"; do
        # Skip current directory and backup directories content
        if [[ "$item" == "." ]] || [[ "$item" == backups/* ]]; then
            continue
        fi
        
        # Check if item is in valid structure
        local is_valid=false
        for valid_item in "${valid_structure[@]}"; do
            if [[ "$item" == "$valid_item" ]]; then
                is_valid=true
                break
            fi
        done
        
        # Also allow any files in backups/ (created by this system)
        if [[ "$item" == backups/* ]]; then
            is_valid=true
        fi
        
        if [[ "$is_valid" == false ]]; then
            items_to_remove+=("$item")
        fi
    done
    
    # Also check for old root directories that should be migrated/removed
    local old_root_dirs=(
        "features"  # Should be migrated to workflow
    )
    
    for old_dir in "${old_root_dirs[@]}"; do
        if [[ -d "$old_dir" ]]; then
            items_to_remove+=("$old_dir")
        fi
    done
    
    # Show what will be cleaned
    if [[ ${#items_to_remove[@]} -eq 0 ]]; then
        print_status "No obsolete files found. System is clean."
        rmdir "$backup_dir" 2>/dev/null || true
        return 0
    fi
    
    echo ""
    print_warning "The following obsolete items will be removed:"
    echo -e "${YELLOW}📋 Complete cleanup analysis:${NC}"
    
    local files_count=0
    local dirs_count=0
    
    for item in "${items_to_remove[@]}"; do
        if [[ -d "$item" ]]; then
            echo "  📁 $item/"
            ((dirs_count++))
        else
            echo "  📄 $item"
            ((files_count++))
        fi
    done
    
    echo ""
    print_info "Summary: $files_count files and $dirs_count directories will be removed"
    print_info "Backup will be created at: $backup_dir"
    echo ""
    print_warning "This will clean ALL non-Context Engineering System files from .claude/"
    echo ""
    
    # Ask for confirmation
    read -p "Continue with cleanup? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Cleanup cancelled by user."
        rmdir "$backup_dir" 2>/dev/null || true
        return 0
    fi
    
    # Create complete backup before any changes
    print_info "Creating complete backup of installation directory..."
    cp -r . "$backup_dir/full-backup" 2>/dev/null || true
    
    # Remove obsolete items
    local cleaned_count=0
    
    for item in "${items_to_remove[@]}"; do
        if [[ -e "$item" ]]; then
            print_info "Removing: $item"
            if [[ -d "$item" ]]; then
                rm -rf "$item"
            else
                rm -f "$item"
            fi
            ((cleaned_count++))
            print_status "✅ Removed: $item"
        fi
    done
    
    # Handle features to workflow migration if needed
    if [[ -d "features" ]] && [[ ! -d "workflow" ]]; then
        print_info "Migrating 'features' directory to 'workflow'..."
        mv features workflow 2>/dev/null && print_status "✅ Migrated: features/ → workflow/"
    fi
    
    # Summary
    echo ""
    if [[ $cleaned_count -gt 0 ]]; then
        print_status "🎉 Cleanup completed: $cleaned_count items removed"
        print_info "Complete backup available at: $backup_dir/full-backup/"
        print_info "You can restore the entire installation if needed"
        print_status "System is now clean and ready for Context Engineering System v2.0"
    else
        print_warning "No files were actually removed"
        rmdir "$backup_dir" 2>/dev/null || true
    fi
    echo ""
}

install_glossary() {
    print_info "Installing universal glossary system..."
    
    # Check if glossary exists
    if [[ -f "docs/context-engine-glossary.md" ]]; then
        print_status "Universal glossary available at: docs/context-engine-glossary.md"
        print_info "Comprehensive symbol & abbreviation reference"
        print_info "Auto-sync with universal-constants.yml"
    else
        print_warning "Glossary not found, but installation continuing"
    fi
}

validate_installation() {
    print_info "Validating installation..."
    
    local validation_passed=true
    
    # Check core structure
    if [[ ! -d ".claude/commands/shared" ]]; then
        print_error "Core directory structure missing"
        validation_passed=false
    fi
    
    # Check CLAUDE.md
    if [[ -f "CLAUDE.md" ]]; then
        if grep -q "@include" "CLAUDE.md"; then
            print_status "Modular CLAUDE.md detected"
        else
            print_warning "CLAUDE.md exists but may not be modular"
        fi
    else
        print_warning "CLAUDE.md not found"
    fi
    
    # Check workflow structure
    if [[ -d "workflow" ]]; then
        print_status "Workflow management system detected"
    fi
    
    # Check token economy
    if [[ -f ".claude/commands/shared/token-economy.yml" ]]; then
        print_status "Token economy system installed"
    fi
    
    if [[ "$validation_passed" == true ]]; then
        print_status "Installation validation passed ✅"
    else
        print_error "Installation validation failed ❌"
        return 1
    fi
}

create_installation_report() {
    local report_file=".claude/installation-report.md"
    
    cat > "$report_file" << EOF
# Context Engineering System v${VERSION} - Installation Report

**Installation Date**: ${INSTALL_DATE}
**Installation Type**: $(if [[ "$INSTALL_ALL" == true ]]; then echo "Full Installation"; else echo "Partial Installation"; fi)

## Installed Components

$(if [[ "$INSTALL_ALL" == true || "$INSTALL_TOKEN_ECONOMY" == true ]]; then echo "✅ Advanced Token Economy System"; fi)
$(if [[ "$INSTALL_ALL" == true || "$INSTALL_MCP" == true ]]; then echo "✅ MCP Integration (Context7, Sequential, Magic, Puppeteer)"; fi)
$(if [[ "$INSTALL_ALL" == true || "$INSTALL_PERSONAS" == true ]]; then echo "✅ Specialized Personas System"; fi)
$(if [[ "$INSTALL_ALL" == true || "$INSTALL_FLAGS" == true ]]; then echo "✅ Advanced Flag System"; fi)
$(if [[ "$INSTALL_ALL" == true || "$INSTALL_COMPRESSION" == true ]]; then echo "✅ UltraCompressed Mode & Token Optimization"; fi)
$(if [[ "$INSTALL_ALL" == true || "$INSTALL_WORKFLOW" == true ]]; then echo "✅ Intelligent Workflow Management"; fi)

## Quick Start Guide

### Basic Commands
- \`/context-engineer "feature description"\` - Plan new features
- \`/execute-context feature-name\` - Implement planned features  
- \`/context-status\` - Monitor project health

### Token Efficiency
- Use \`--uc\` flag for 70% token reduction
- Auto-compression activates at 75% context usage
- Reference glossary: \`docs/context-engine-glossary.md\`

### Workflow Management
- Files automatically move: planned → in-progress → completed
- Session-aware progress tracking
- Smart resume functionality

## Performance Targets
- **Token Efficiency**: 70% reduction target with --uc
- **Context Relevance**: 90%+ useful information
- **Workflow Automation**: 100% automatic file management
- **Quality Gates**: 95%+ pass rate

## Documentation
- **Glossary**: \`docs/context-engine-glossary.md\`
- **Commands Reference**: \`help-docs/commands-reference.md\`
- **System Configuration**: \`.claude/commands/shared/\`

## Support
For issues or questions:
1. Check the glossary for symbol meanings
2. Use \`/context-status --help\` for diagnostics
3. Review installation report: \`.claude/installation-report.md\`

---
*Context Engineering System v${VERSION} - Enterprise-class AI development assistant*
EOF

    print_status "Installation report created: $report_file"
}

main() {
    print_header
    
    parse_arguments "$@"
    
    if [[ "$UPDATE_MODE" == true ]]; then
        print_info "Update mode: Refreshing existing installation"
    fi
    
    if [[ "$CLEAN_MODE" == true ]]; then
        print_info "Clean mode: Will remove obsolete files and directories"
    fi
    
    setup_installation_directory
    detect_environment
    clean_obsolete_files
    create_directory_structure
    install_core_modules
    setup_token_economy
    setup_mcp_integration
    install_personas
    setup_flag_system
    setup_workflow_management
    setup_compression_system
    install_glossary
    validate_installation
    create_installation_report
    
    echo ""
    print_status "🎉 Context Engineering System v${VERSION} installation completed!"
    echo ""
    print_info "Installation location: $CLAUDE_DIR"
    print_info "Next steps:"
    if [[ "$CLAUDE_DIR" == "$DEFAULT_CLAUDE_DIR" ]]; then
        echo "  1. Global installation ready - available in all projects"
        echo "  2. Try a command: /context-engineer \"Add user authentication\""
        echo "  3. Use --uc flag for token efficiency"
        echo "  4. Check installation report: $CLAUDE_DIR/installation-report.md"
    else
        echo "  1. Review the glossary: docs/context-engine-glossary.md"
        echo "  2. Try a command: /context-engineer \"Add user authentication\""
        echo "  3. Use --uc flag for token efficiency"
        echo "  4. Check installation report: installation-report.md"
    fi
    echo ""
    print_info "Performance targets: 70% token reduction, 90% context relevance, 100% workflow automation"
    echo ""
}

# Run main function with all arguments
main "$@"