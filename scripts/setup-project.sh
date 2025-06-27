#!/bin/bash

# Claude Code React Native System - Universal Setup Script
# Version: 3.0.0
# Description: Universal setup that works for new and existing projects by cleaning up the cloned repo

set -e # Exit on any error

# --- UI Functions (Colors and Emojis) ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

ROCKET="🚀"
CHECK="✅"
CROSS="❌"
WARNING="⚠️"
GEAR="🔧"
FOLDER="📁"
FILE="📝"
MAGIC="✨"
GIT_ICON="🗂️"
PROMPT="💬"
CLEAN="🧹"

print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  ${ROCKET} ${PURPLE}Claude Code React Native - Universal Setup${NC}           ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}      ${CYAN}Works for new and existing projects!${NC}              ${BLUE}║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_step() { echo -e "${CYAN}${1}${NC} ${2}"; }
print_success() { echo -e "${GREEN}${CHECK} ${1}${NC}"; }
print_error() { echo -e "${RED}${CROSS} ${1}${NC}"; }
print_warning() { echo -e "${YELLOW}${WARNING} ${1}${NC}"; }
print_info() { echo -e "${BLUE}> ${1}${NC}"; }
prompt_user() { echo -en "${PURPLE}${PROMPT} ${1}${NC}"; }

# Function to ask Yes/No questions
ask_yes_no() {
    local question="$1"
    local default_answer="${2:-y}"
    local response

    if [[ "$default_answer" == "y" ]]; then
        prompt_user "$question [Y/n]: "
    else
        prompt_user "$question [y/N]: "
    fi

    read -r response
    response=${response:-$default_answer}

    if [[ "$response" =~ ^[Yy]$ ]]; then
        return 0 # Success (yes)
    else
        return 1 # Failure (no)
    fi
}

# Detect project type and get name
detect_and_setup_project() {
    print_step "${GEAR}" "Detecting project type..."
    
    # Check if we're in a cloned claude-system repo
    if [[ -d ".git" ]] && git remote -v 2>/dev/null | grep -q "claude-code-react-native-system"; then
        print_success "Claude Code system repository detected."
        
        # Check if there's already a React Native project here
        if [[ -f "package.json" ]] && grep -q "react-native\|expo" package.json 2>/dev/null; then
            print_info "Existing React Native project detected in this directory."
            SETUP_TYPE="existing_in_clone"
        else
            print_info "This appears to be a fresh clone of the Claude Code system."
            SETUP_TYPE="new_project"
        fi
    else
        print_error "This script must be run from a cloned claude-code-react-native-system repository."
        echo ""
        print_info "Please run:"
        echo -e "  ${YELLOW}git clone https://github.com/ernestoespinosajr/claude-code-react-native-system.git${NC}"
        echo -e "  ${YELLOW}cd claude-code-react-native-system${NC}"
        echo -e "  ${YELLOW}./scripts/setup-project.sh${NC}"
        exit 1
    fi
}

# Get project name from user
get_project_name() {
    if [[ "$SETUP_TYPE" == "new_project" ]]; then
        local project_name
        while true; do
            prompt_user "What is the name of your project? "
            read -r project_name
            if [[ -z "$project_name" ]]; then
                print_error "Project name cannot be empty."
            elif [[ "$project_name" =~ [^a-zA-Z0-9_-] ]]; then
                print_error "Project name can only contain letters, numbers, hyphens, and underscores."
            else
                break
            fi
        done
        PROJECT_NAME="$project_name"
        print_success "Project name set to: $PROJECT_NAME"
    else
        # Extract project name from package.json
        if [[ -f "package.json" ]]; then
            PROJECT_NAME=$(grep '"name"' package.json | cut -d'"' -f4)
            print_success "Existing project detected: $PROJECT_NAME"
        else
            PROJECT_NAME="MyApp"
            print_warning "Could not detect project name, using: $PROJECT_NAME"
        fi
    fi
}

# Clean up the cloned repository
cleanup_cloned_repo() {
    print_step "${CLEAN}" "Cleaning up cloned repository files..."
    
    # Remove git history of the template
    if [[ -d ".git" ]]; then
        rm -rf .git
        print_success "Removed template git history"
    fi
    
    # Remove template-specific files
    local files_to_remove=(
        "LICENSE"
        "README.md"
        "scripts/setup-project.sh"
        "scripts/install-existing-project.sh"
        ".DS_Store"
    )
    
    for file in "${files_to_remove[@]}"; do
        if [[ -f "$file" ]]; then
            rm -f "$file"
            print_success "Removed $file"
        fi
    done
    
    # Create a project-specific README
    create_project_readme
    
    print_success "Repository cleanup completed"
}

# Create project-specific README
create_project_readme() {
    cat > README.md << EOF
# $PROJECT_NAME

React Native application powered by Claude Code system.

## 🚀 Development Workflow

This project uses the Claude Code system for structured development with AI assistance.

### Quick Start

1. **Get project status:**
   \`\`\`bash
   /task-status
   \`\`\`

2. **Start development:**
   \`\`\`bash
   /start-task
   \`\`\`

3. **Add new tasks:**
   \`\`\`bash
   /add-discovered-task
   \`\`\`

### Development Commands

- \`/task-status\` - Get current project status and next task
- \`/start-task\` - Main development workflow
- \`/parse-prd\` - Generate initial tasks from PRD
- \`/project-audit\` - Technical assessment
- \`/emergency-context\` - Recover full context

### Documentation

- \`project-docs/PRD.md\` - Product Requirements Document
- \`CLAUDE.md\` - Development rules and guidelines
- \`help-docs/\` - Complete documentation

### Project Structure

\`\`\`
$PROJECT_NAME/
├── project-docs/          # Project documentation
├── src/                   # Source code
├── assets/               # Images and assets
├── .claude/              # Claude Code system
├── claude_tasks.md       # Task management
└── CLAUDE.md            # Development rules
\`\`\`

## 📱 Tech Stack

- **Framework**: React Native + Expo
- **Language**: TypeScript
- **Navigation**: Expo Router
- **State**: Zustand + TanStack Query
- **UI**: React Native Reanimated
- **AI Assistant**: Claude Code System

---

*This project follows a structured two-phase development approach: Phase 1 (Frontend with dummy data) → Phase 2 (Backend integration)*
EOF
}

# Customize project files
customize_project_files() {
    print_step "${MAGIC}" "Customizing project files..."
    
    local current_date=$(date +"%Y-%m-%d")
    
    # Update PRD.md with project name
    if [[ -f "project-docs/PRD.md" ]]; then
        sed -i.bak "s/\[NOMBRE_DEL_PROYECTO\]/$PROJECT_NAME/g" project-docs/PRD.md
        sed -i.bak "s/\[Fecha actual\]/$current_date/g" project-docs/PRD.md
        rm -f project-docs/PRD.md.bak
        print_success "Updated PRD.md with project name"
    fi
    
    # Update claude_tasks.md
    if [[ -f "claude_tasks.md" ]]; then
        sed -i.bak "s/\[NOMBRE_DEL_PROYECTO\]/$PROJECT_NAME/g" claude_tasks.md
        sed -i.bak "s/\[Fecha\]/$current_date/g" claude_tasks.md
        rm -f claude_tasks.md.bak
        print_success "Updated claude_tasks.md"
    fi
    
    # Update functional requirements
    if [[ -f "project-docs/functional-requirements.md" ]]; then
        sed -i.bak "s/\[NOMBRE_DEL_PROYECTO\]/$PROJECT_NAME/g" project-docs/functional-requirements.md
        sed -i.bak "s/\[Fecha actual\]/$current_date/g" project-docs/functional-requirements.md
        rm -f project-docs/functional-requirements.md.bak
        print_success "Updated functional-requirements.md"
    fi
}

# Initialize React Native project (if needed)
init_react_native() {
    if [[ "$SETUP_TYPE" == "new_project" ]]; then
        if ask_yes_no "Do you want to initialize a new React Native Expo project?"; then
            print_step "${ROCKET}" "Initializing Expo project..."
            
            # Create Expo project structure
            if npx create-expo-app@latest . --template blank --no-install > /dev/null 2>&1; then
                print_success "Expo project structure created."
                
                # Install dependencies
                print_step "${GEAR}" "Installing dependencies..."
                if npm install > /dev/null 2>&1; then
                    print_success "Dependencies installed successfully."
                else
                    print_error "npm install failed. Please run 'npm install' manually."
                fi
            else
                print_error "Expo initialization failed. Please check your environment."
            fi
        else
            print_info "Skipping React Native initialization."
            print_info "You can initialize it later with: npx create-expo-app@latest . --template blank"
        fi
    else
        print_info "Existing React Native project detected - skipping initialization."
    fi
}

# Initialize git repository
init_git() {
    if ask_yes_no "Do you want to initialize a new Git repository?"; then
        print_step "${GIT_ICON}" "Initializing Git repository..."
        git init -b main > /dev/null
        print_success "Git repository initialized."
        
        print_step "${GIT_ICON}" "Adding files to initial commit..."
        git add . > /dev/null
        print_success "Files staged for commit."

        print_step "${GIT_ICON}" "Creating initial commit..."
        git commit -m "feat: initial project setup with Claude Code system" > /dev/null
        print_success "Initial commit created."
    else
        print_info "Skipping Git initialization."
    fi
}

# Main setup function
main() {
    print_header
    
    # Step 1: Detect project type
    detect_and_setup_project
    echo ""
    
    # Step 2: Get project name
    get_project_name
    echo ""
    
    # Step 3: Clean up cloned repository
    cleanup_cloned_repo
    echo ""
    
    # Step 4: Customize project files
    customize_project_files
    echo ""
    
    # Step 5: Initialize React Native (if needed)
    init_react_native
    echo ""
    
    # Step 6: Initialize Git
    init_git
    echo ""
    
    # Final success message
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}  ${MAGIC} ${PURPLE}$PROJECT_NAME is ready for development!${NC}                    ${GREEN}║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    echo -e "${CYAN}✅ Setup completed successfully!${NC}"
    echo ""
    echo -e "${CYAN}📋 Next Steps:${NC}"
    echo ""
    echo -e "   ${BLUE}1. Complete your project documentation:${NC}"
    echo -e "      • Edit ${YELLOW}project-docs/PRD.md${NC} with your app requirements"
    echo -e "      • Update ${YELLOW}project-docs/functional-requirements.md${NC} with details"
    echo ""
    echo -e "   ${BLUE}2. Start the Claude Code workflow:${NC}"
    echo -e "      • Use ${PURPLE}/parse-prd${NC} to generate your task backlog"
    echo -e "      • Use ${PURPLE}/task-status${NC} to see your project status"
    echo -e "      • Use ${PURPLE}/start-task${NC} to begin development"
    echo ""
    echo -e "   ${BLUE}3. Learn the system:${NC}"
    echo -e "      • Read ${YELLOW}CLAUDE.md${NC} for development rules"
    echo -e "      • Check ${YELLOW}help-docs/quick-start.md${NC} for workflow"
    echo -e "      • Review ${YELLOW}help-docs/commands-reference.md${NC} for all commands"
    echo ""
    echo -e "${GREEN}🚀 Happy coding with your AI-powered development workflow!${NC}"
    echo ""
}

# Run main function
main "$@"