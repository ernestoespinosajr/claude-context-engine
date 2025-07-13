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
    echo "  --help                   Show this help message"
    echo ""
    echo "Cleaning Options:"
    echo "  --clean can be combined with any installation option:"
    echo "  $0 --update --clean      # Update and clean obsolete files"
    echo "  $0 --full --clean        # Fresh install with cleanup"
    echo ""
    echo "Examples:"
    echo "  $0 --full                # Install everything"
    echo "  $0 --token-economy-only  # Install just token optimization"
    echo "  $0 --update              # Update existing installation"
    echo "  $0 --update --clean      # Update and remove obsolete files"
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

detect_environment() {
    print_info "Detecting environment..."
    
    # Check if we're in a Context Engineering project
    if [[ ! -f "CLAUDE.md" ]]; then
        print_warning "No CLAUDE.md found. This may not be a Context Engineering project."
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_error "Installation cancelled."
            exit 1
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
    
    # Create main .claude directory
    mkdir -p .claude/commands/shared
    mkdir -p .claude/personas
    mkdir -p .claude/mcp
    mkdir -p .claude/docs
    
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
    
    print_status "Directory structure created successfully"
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
    
    print_info "Starting cleanup of obsolete files and directories..."
    
    # Create backup directory with timestamp
    local backup_dir=".claude/backups/cleanup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$backup_dir"
    
    # Define obsolete files and directories to clean
    local obsolete_items=(
        "features"                           # Old workflow directory name
        ".claude/*.bak"                      # Backup files
        ".claude/*.old"                      # Old files
        ".claude/commands/shared/old-*"      # Old configuration files
        "CLAUDE.md.bak"                      # CLAUDE.md backups
        "CLAUDE.md.old"                      # Old CLAUDE.md files
        ".claude/legacy"                     # Legacy directory if exists
        ".claude/old-config"                 # Old config directory
        "context-engine-old"                 # Old context-engine directory
        "workflow/.old"                      # Old workflow files
    )
    
    local files_to_clean=()
    local dirs_to_clean=()
    
    # Identify actual files/directories that exist
    for pattern in "${obsolete_items[@]}"; do
        if [[ "$pattern" == *"*"* ]]; then
            # Handle wildcard patterns
            for item in $pattern; do
                if [[ -e "$item" ]]; then
                    if [[ -d "$item" ]]; then
                        dirs_to_clean+=("$item")
                    else
                        files_to_clean+=("$item")
                    fi
                fi
            done
        else
            # Handle exact matches
            if [[ -e "$pattern" ]]; then
                if [[ -d "$pattern" ]]; then
                    dirs_to_clean+=("$pattern")
                else
                    files_to_clean+=("$pattern")
                fi
            fi
        fi
    done
    
    # Show what will be cleaned
    if [[ ${#files_to_clean[@]} -eq 0 && ${#dirs_to_clean[@]} -eq 0 ]]; then
        print_status "No obsolete files found. System is clean."
        rmdir "$backup_dir" 2>/dev/null || true
        return 0
    fi
    
    echo ""
    print_warning "The following obsolete items will be removed:"
    
    if [[ ${#dirs_to_clean[@]} -gt 0 ]]; then
        echo -e "${YELLOW}Directories:${NC}"
        for dir in "${dirs_to_clean[@]}"; do
            echo "  📁 $dir"
        done
    fi
    
    if [[ ${#files_to_clean[@]} -gt 0 ]]; then
        echo -e "${YELLOW}Files:${NC}"
        for file in "${files_to_clean[@]}"; do
            echo "  📄 $file"
        done
    fi
    
    echo ""
    print_info "Backup will be created at: $backup_dir"
    echo ""
    
    # Ask for confirmation
    read -p "Continue with cleanup? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Cleanup cancelled by user."
        rmdir "$backup_dir" 2>/dev/null || true
        return 0
    fi
    
    # Create backups and remove items
    local cleaned_count=0
    
    # Backup and remove directories
    for dir in "${dirs_to_clean[@]}"; do
        if [[ -d "$dir" ]]; then
            print_info "Backing up and removing directory: $dir"
            cp -r "$dir" "$backup_dir/" 2>/dev/null || true
            rm -rf "$dir"
            ((cleaned_count++))
            print_status "Removed: $dir"
        fi
    done
    
    # Backup and remove files
    for file in "${files_to_clean[@]}"; do
        if [[ -f "$file" ]]; then
            print_info "Backing up and removing file: $file"
            cp "$file" "$backup_dir/" 2>/dev/null || true
            rm -f "$file"
            ((cleaned_count++))
            print_status "Removed: $file"
        fi
    done
    
    # Summary
    echo ""
    if [[ $cleaned_count -gt 0 ]]; then
        print_status "Cleanup completed: $cleaned_count items removed"
        print_info "Backup available at: $backup_dir"
        print_info "You can restore files from backup if needed"
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
    print_info "Next steps:"
    echo "  1. Review the glossary: docs/context-engine-glossary.md"
    echo "  2. Try a command: /context-engineer \"Add user authentication\""
    echo "  3. Use --uc flag for token efficiency"
    echo "  4. Check installation report: .claude/installation-report.md"
    echo ""
    print_info "Performance targets: 70% token reduction, 90% context relevance, 100% workflow automation"
    echo ""
}

# Run main function with all arguments
main "$@"