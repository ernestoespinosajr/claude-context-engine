#!/bin/bash

# Claude Code React Native System - Project Setup Script
# Version: 1.0.0
# Description: Automated setup for Claude Code React Native development system

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Emojis for better UX
ROCKET="🚀"
CHECK="✅"
CROSS="❌"
WARNING="⚠️"
GEAR="🔧"
FOLDER="📁"
FILE="📝"
MAGIC="✨"

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SYSTEM_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(pwd)"
PROJECT_NAME="$(basename "$PROJECT_DIR")"

# Functions
print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  ${ROCKET} ${PURPLE}Claude Code React Native System Setup${NC}           ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}     ${CYAN}Automated project configuration in 30 seconds${NC}      ${BLUE}║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_step() {
    echo -e "${CYAN}${1}${NC} ${2}"
}

print_success() {
    echo -e "${GREEN}${CHECK} ${1}${NC}"
}

print_error() {
    echo -e "${RED}${CROSS} ${1}${NC}"
}

print_warning() {
    echo -e "${YELLOW}${WARNING} ${1}${NC}"
}

print_info() {
    echo -e "${BLUE}${GEAR} ${1}${NC}"
}

# Check if we're in the system directory or a target project
detect_setup_mode() {
    if [[ -f "templates/CLAUDE.md" && -f "commands/parse-prd.md" ]]; then
        echo "system"
    elif [[ -f "package.json" ]] || [[ -f "app.json" ]] || [[ -f "expo.json" ]]; then
        echo "project"
    else
        echo "unknown"
    fi
}

# Validate system directory structure
validate_system_directory() {
    print_step "${GEAR}" "Validating Claude Code system files..."
    
    local missing_files=()
    
    # Check critical templates
    [[ ! -f "$SYSTEM_DIR/templates/CLAUDE.md" ]] && missing_files+=("templates/CLAUDE.md")
    [[ ! -f "$SYSTEM_DIR/templates/PRD.md" ]] && missing_files+=("templates/PRD.md")
    [[ ! -f "$SYSTEM_DIR/templates/claude_tasks.md" ]] && missing_files+=("templates/claude_tasks.md")
    
    # Check critical commands
    [[ ! -f "$SYSTEM_DIR/commands/parse-prd.md" ]] && missing_files+=("commands/parse-prd.md")
    [[ ! -f "$SYSTEM_DIR/commands/start-task.md" ]] && missing_files+=("commands/start-task.md")
    [[ ! -f "$SYSTEM_DIR/commands/emergency-context.md" ]] && missing_files+=("commands/emergency-context.md")
    
    if [[ ${#missing_files[@]} -gt 0 ]]; then
        print_error "Missing critical system files:"
        for file in "${missing_files[@]}"; do
            echo -e "  ${RED}- ${file}${NC}"
        done
        echo ""
        print_error "Please ensure you're running this script from the correct directory."
        print_info "Expected structure: claude-code-react-native-system/"
        print_info "                   ├── templates/"
        print_info "                   ├── commands/"
        print_info "                   └── scripts/setup-project.sh (this script)"
        exit 1
    fi
    
    print_success "System files validated"
}

# Create project directory structure
create_directory_structure() {
    print_step "${FOLDER}" "Creating project directory structure..."
    
    # Core directories
    mkdir -p src/{components,screens,utils,types,hooks,services}
    mkdir -p src/components/{base,navigation,forms,feedback}
    mkdir -p assets/{images,fonts,icons}
    mkdir -p docs
    mkdir -p .claude/commands
    
    # Create essential subdirectories
    mkdir -p src/screens/{auth,main,profile,settings}
    mkdir -p src/utils/{validation,formatting,constants}
    mkdir -p src/types/{api,navigation,components}
    
    print_success "Directory structure created"
}

# Copy template files
copy_templates() {
    print_step "${FILE}" "Copying template files..."
    
    # Core templates
    cp "$SYSTEM_DIR/templates/CLAUDE.md" "$PROJECT_DIR/"
    cp "$SYSTEM_DIR/templates/PRD.md" "$PROJECT_DIR/"
    cp "$SYSTEM_DIR/templates/functional-requirements.md" "$PROJECT_DIR/"
    cp "$SYSTEM_DIR/templates/ui-ux-specifications.md" "$PROJECT_DIR/"
    cp "$SYSTEM_DIR/templates/claude_tasks.md" "$PROJECT_DIR/"
    cp "$SYSTEM_DIR/templates/claude_self_improve.md" "$PROJECT_DIR/"
    
    print_success "Template files copied"
}

# Copy command files
copy_commands() {
    print_step "${GEAR}" "Setting up Claude Code commands..."
    
    # Copy all command files
    cp "$SYSTEM_DIR/commands/"*.md "$PROJECT_DIR/.claude/commands/"
    
    # Verify commands were copied
    local command_count=$(ls -1 "$PROJECT_DIR/.claude/commands/"*.md 2>/dev/null | wc -l)
    
    if [[ $command_count -lt 5 ]]; then
        print_warning "Only $command_count command files copied. Expected at least 5."
        print_info "Manual verification recommended."
    else
        print_success "Claude Code commands installed ($command_count commands)"
    fi
}

# Customize templates with project info
customize_templates() {
    print_step "${MAGIC}" "Customizing templates for project '$PROJECT_NAME'..."
    
    # Get current date
    local current_date=$(date +"%Y-%m-%d")
    local current_datetime=$(date +"%Y-%m-%d %H:%M")
    
    # Replace placeholders in all template files
    find "$PROJECT_DIR" -name "*.md" -type f -exec sed -i.bak \
        -e "s/\[NOMBRE_DEL_PROYECTO\]/$PROJECT_NAME/g" \
        -e "s/\[Fecha actual\]/$current_date/g" \
        -e "s/\[Fecha y Hora\]/$current_datetime/g" \
        -e "s/\[Current Date\/Time\]/$current_datetime/g" \
        -e "s/\[Fecha\]/$current_date/g" \
        {} \;
    
    # Clean up backup files
    find "$PROJECT_DIR" -name "*.md.bak" -type f -delete 2>/dev/null || true
    
    print_success "Templates customized for '$PROJECT_NAME'"
}

# Create initial gitignore if it doesn't exist
setup_gitignore() {
    if [[ ! -f "$PROJECT_DIR/.gitignore" ]]; then
        print_step "${FILE}" "Creating .gitignore file..."
        
        cat > "$PROJECT_DIR/.gitignore" << 'EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Expo
.expo/
dist/
web-build/

# Native
*.orig.*
*.jks
*.p8
*.p12
*.key
*.mobileprovision

# Metro
.metro-health-check*

# Debug
npm-debug.*
yarn-debug.*
yarn-error.*

# macOS
.DS_Store
*.pem

# local env files
.env*.local
.env

# typescript
*.tsbuildinfo

# IDE
.vscode/
.idea/
*.swp
*.swo

# Claude Code System (optional - uncomment to ignore)
# claude_tasks.md
# claude_self_improve.md
EOF
        print_success ".gitignore created"
    else
        print_info ".gitignore already exists - skipping"
    fi
}

# Validate React Native/Expo project
validate_react_native_project() {
    print_step "${GEAR}" "Validating React Native/Expo project..."
    
    local is_valid=false
    
    # Check for Expo project
    if [[ -f "app.json" ]] || [[ -f "expo.json" ]]; then
        print_info "Expo project detected"
        is_valid=true
    fi
    
    # Check for React Native project
    if [[ -f "package.json" ]] && grep -q "react-native" package.json; then
        print_info "React Native project detected"
        is_valid=true
    fi
    
    # Check for basic React Native structure
    if [[ -f "package.json" ]] && [[ -f "metro.config.js" || -f "babel.config.js" ]]; then
        print_info "React Native project structure detected"
        is_valid=true
    fi
    
    if [[ "$is_valid" == false ]]; then
        print_warning "Not a React Native/Expo project detected"
        print_info "This script works best with React Native/Expo projects"
        print_info "Continue anyway? (y/N)"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            print_error "Setup cancelled by user"
            exit 1
        fi
    else
        print_success "React Native/Expo project validated"
    fi
}

# Verify setup completion
verify_setup() {
    print_step "${CHECK}" "Verifying setup completion..."
    
    local errors=()
    
    # Check templates
    [[ ! -f "CLAUDE.md" ]] && errors+=("CLAUDE.md missing")
    [[ ! -f "PRD.md" ]] && errors+=("PRD.md missing")
    [[ ! -f "claude_tasks.md" ]] && errors+=("claude_tasks.md missing")
    
    # Check directory structure
    [[ ! -d "src" ]] && errors+=("src/ directory missing")
    [[ ! -d "assets/images" ]] && errors+=("assets/images/ directory missing")
    [[ ! -d ".claude/commands" ]] && errors+=(".claude/commands/ directory missing")
    
    # Check commands
    local command_files=(.claude/commands/*.md)
    if [[ ${#command_files[@]} -lt 5 ]]; then
        errors+=("Insufficient command files in .claude/commands/")
    fi
    
    if [[ ${#errors[@]} -gt 0 ]]; then
        print_error "Setup verification failed:"
        for error in "${errors[@]}"; do
            echo -e "  ${RED}- ${error}${NC}"
        done
        exit 1
    fi
    
    print_success "Setup verification passed"
}

# Print next steps
print_next_steps() {
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}  ${MAGIC} ${PURPLE}Setup Complete! Your project is ready.${NC}               ${GREEN}║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    echo -e "${CYAN}📋 Next Steps:${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} ${BLUE}Edit PRD.md${NC} with your project details:"
    echo -e "   ${GRAY}nano PRD.md${NC}"
    echo ""
    echo -e "${YELLOW}2.${NC} ${BLUE}Open Claude Code${NC} in this directory:"
    echo -e "   ${GRAY}code . ${NC}  ${CYAN}# or your preferred editor${NC}"
    echo ""
    echo -e "${YELLOW}3.${NC} ${BLUE}Start Claude Code development${NC}:"
    echo -e "   ${CYAN}⚠️  Important: Restart Claude Code after this setup!${NC}"
    echo ""
    echo -e "${YELLOW}4.${NC} ${BLUE}Generate your task backlog${NC}:"
    echo -e "   ${GRAY}/parse-prd${NC}           ${CYAN}# Generate tasks from PRD${NC}"
    echo -e "   ${GRAY}/analyze-complexity${NC}  ${CYAN}# Analyze task difficulty${NC}"
    echo -e "   ${GRAY}/expand-all${NC}          ${CYAN}# Break complex tasks down${NC}"
    echo ""
    echo -e "${YELLOW}5.${NC} ${BLUE}Start developing${NC}:"
    echo -e "   ${GRAY}/emergency-context${NC}   ${CYAN}# Load project context${NC}"
    echo -e "   ${GRAY}/start-task${NC}          ${CYAN}# Begin first task${NC}"
    echo ""
    echo -e "${PURPLE}📚 Documentation:${NC}"
    echo -e "   ${BLUE}• QUICK_START.md${NC}     - 5-minute setup guide"
    echo -e "   ${BLUE}• README.md${NC}          - Complete documentation"
    echo -e "   ${BLUE}• CLAUDE.md${NC}          - Development rules for Claude"
    echo ""
    echo -e "${GREEN}🚀 Happy coding with AI-powered development workflow!${NC}"
    echo ""
}

# Print usage help
print_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help       Show this help message"
    echo "  -f, --force      Force setup even if files exist"
    echo "  -q, --quiet      Quiet mode (minimal output)"
    echo "  --no-git         Skip git-related setup"
    echo "  --dry-run        Show what would be done without executing"
    echo ""
    echo "Examples:"
    echo "  $0               # Normal setup"
    echo "  $0 --force       # Overwrite existing files"
    echo "  $0 --dry-run     # Preview changes"
    echo ""
}

# Parse command line arguments
FORCE_SETUP=false
QUIET_MODE=false
SKIP_GIT=false
DRY_RUN=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            print_usage
            exit 0
            ;;
        -f|--force)
            FORCE_SETUP=true
            shift
            ;;
        -q|--quiet)
            QUIET_MODE=true
            shift
            ;;
        --no-git)
            SKIP_GIT=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        *)
            print_error "Unknown option: $1"
            print_usage
            exit 1
            ;;
    esac
done

# Main execution
main() {
    # Suppress output in quiet mode
    if [[ "$QUIET_MODE" == true ]]; then
        exec 1>/dev/null
    fi
    
    print_header
    
    # Detect setup mode
    local setup_mode=$(detect_setup_mode)
    
    case $setup_mode in
        "system")
            print_info "Running from Claude Code system directory"
            print_info "Target project: $PROJECT_DIR"
            ;;
        "project")
            print_info "Running in React Native/Expo project directory"
            # Assume system is in parent or specified directory
            if [[ ! -d "$SYSTEM_DIR/templates" ]]; then
                print_error "Cannot find Claude Code system templates"
                print_info "Please run this script from the system directory or"
                print_info "ensure templates/ and commands/ directories are available"
                exit 1
            fi
            ;;
        "unknown")
            print_warning "Cannot detect project type or system directory"
            print_info "Current directory: $PROJECT_DIR"
            print_info "Continue anyway? (y/N)"
            read -r response
            if [[ ! "$response" =~ ^[Yy]$ ]]; then
                exit 1
            fi
            ;;
    esac
    
    # Check for existing files if not forced
    if [[ "$FORCE_SETUP" == false ]]; then
        if [[ -f "CLAUDE.md" ]] || [[ -f "claude_tasks.md" ]]; then
            print_warning "Claude Code system files already exist in this directory"
            print_info "Use --force to overwrite existing files"
            print_info "Continue and overwrite? (y/N)"
            read -r response
            if [[ ! "$response" =~ ^[Yy]$ ]]; then
                print_info "Setup cancelled"
                exit 0
            fi
        fi
    fi
    
    # Dry run mode
    if [[ "$DRY_RUN" == true ]]; then
        print_info "DRY RUN MODE - No changes will be made"
        print_info "Would create directory structure in: $PROJECT_DIR"
        print_info "Would copy templates from: $SYSTEM_DIR/templates"
        print_info "Would copy commands from: $SYSTEM_DIR/commands"
        print_info "Would customize templates for project: $PROJECT_NAME"
        exit 0
    fi
    
    # Execute setup steps
    validate_system_directory
    validate_react_native_project
    create_directory_structure
    copy_templates
    copy_commands
    customize_templates
    
    if [[ "$SKIP_GIT" == false ]]; then
        setup_gitignore
    fi
    
    verify_setup
    
    # Re-enable output for final message even in quiet mode
    if [[ "$QUIET_MODE" == true ]]; then
        exec 1>/dev/tty
    fi
    
    print_next_steps
}

# Error handling
trap 'print_error "Setup failed on line $LINENO. Exit code: $?"' ERR

# Run main function
main "$@"