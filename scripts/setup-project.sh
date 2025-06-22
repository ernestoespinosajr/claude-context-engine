#!/bin/bash

# Claude Code React Native System - Project Kickstart Script
# Version: 2.0.0
# Description: Interactive setup for a new React Native project using the Claude Code system.

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

print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  ${ROCKET} ${PURPLE}Claude Code React Native Project Kickstart${NC}           ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC}      ${CYAN}Your new AI-powered project in under a minute${NC}     ${BLUE}║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_step() { echo -e "${CYAN}${1}${NC} ${2}"; }
print_success() { echo -e "${GREEN}${CHECK} ${1}${NC}"; }
print_error() { echo -e "${RED}${CROSS} ${1}${NC}"; }
print_warning() { echo -e "${YELLOW}${WARNING} ${1}${NC}"; }
print_info() { echo -e "${BLUE}> ${1}${NC}"; }
prompt_user() { echo -en "${PURPLE}${PROMPT} ${1}${NC}"; }

# --- Helper Functions ---

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


# --- Main Setup Logic ---

main() {
    print_header

    # --- 1. Get Project Name ---
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
    print_success "Project name set to: $project_name"
    echo ""

    # --- 2. Create Project Directory ---
    print_step "${FOLDER}" "Creating project directory..."
    local system_dir
    system_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
    local parent_dir
    parent_dir=$(dirname "$system_dir")
    local project_dir="$parent_dir/$project_name"

    if [ -d "$project_dir" ]; then
        print_error "Directory '$project_dir' already exists. Aborting."
        exit 1
    fi
    mkdir -p "$project_dir"
    print_success "Created project directory at: $project_dir"
    echo ""

    # --- 3. Copy System Files ---
    print_step "${FILE}" "Copying Claude Code system files..."
    # Use rsync to copy files, excluding the .git directory of the template repo
    rsync -av --quiet --exclude=".git" "$system_dir/" "$project_dir/"
    print_success "System files copied successfully."
    echo ""
    
    # Change into the new project directory for subsequent operations
    cd "$project_dir"

    # --- 4. Rename project-docs ---
    print_step "${MAGIC}" "Customizing project..."
    local docs_dir_name="${project_name}-docs"
    mv "project-docs" "$docs_dir_name"
    print_success "Renamed 'project-docs' to '$docs_dir_name'."
    
    # Remove the setup script from the new project
    rm "scripts/setup-project.sh"
    print_success "Removed setup script from the new project."
    echo ""

    # --- 5. Install Expo React Native ---
    if ask_yes_no "Do you want to initialize a new React Native Expo project here?"; then
        print_step "${ROCKET}" "Initializing Expo project. This might take a few minutes..."
        
        # Non-interactive Expo setup. Installs in the current directory.
        if npx create-expo-app@latest . --template blank --no-install > /dev/null 2>&1; then
            print_success "Expo project structure created."
            print_step "${GEAR}" "Installing Node dependencies..."
            if npm install > /dev/null 2>&1; then
                print_success "Dependencies installed successfully."
            else
                print_error "npm install failed. Please run 'npm install' manually."
            fi
        else
            print_error "Expo initialization failed. Please check your environment."
        fi
        echo ""
    else
        print_info "Skipping Expo installation."
        echo ""
    fi

    # --- 6. Initialize Git ---
    if ask_yes_no "Do you want to initialize a Git repository?"; then
        print_step "${GIT_ICON}" "Initializing Git repository..."
        git init -b main > /dev/null
        print_success "Git repository initialized."
        
        print_step "${GIT_ICON}" "Adding all files to the first commit..."
        git add . > /dev/null
        print_success "Files staged for commit."

        print_step "${GIT_ICON}" "Creating initial commit..."
        git commit -m "feat: initial project setup" > /dev/null
        print_success "Initial commit created with message 'feat: initial project setup'."
        echo ""
    else
        print_info "Skipping Git initialization."
        echo ""
    fi
    
    # --- 7. Final Instructions ---
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║${NC}  ${MAGIC} ${PURPLE}Project '$project_name' is ready!${NC}                     ${GREEN}║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    echo -e "${CYAN}✅ Your development environment is set up at:${NC}"
    echo -e "   ${YELLOW}$project_dir${NC}"
    echo ""

    echo -e "${CYAN}📋 Important Next Steps:${NC}"
    echo ""
    echo -e "   ${BLUE}1. Navigate to your new project directory:${NC}"
    echo -e "      cd ../$project_name"
    echo ""
    echo -e "   ${BLUE}2. Complete your project documentation in '${docs_dir_name}':${NC}"
    echo -e "      • ${docs_dir_name}/PRD.md"
    echo -e "      • ${docs_dir_name}/functional-requirements.md"
    echo -e "      • ${docs_dir_name}/ui-ux-specifications.md"
    echo ""
    echo -e "   ${BLUE}3. Open the project in your editor and start Claude:${NC}"
    echo -e "      code ."
    echo ""
    echo -e "   ${BLUE}4. Once inside Claude, begin the development workflow:${NC}"
    echo -e "      - Use ${PURPLE}/parse-prd${NC} to create your initial task list."
    echo -e "      - Use ${PURPLE}/start-task${NC} to begin working on the first task."
    echo ""
    echo -e "${PURPLE}📚 Review CLAUDE.md for development rules and best practices.${NC}"
    echo ""
    echo -e "${GREEN}🚀 Happy coding with your new AI-powered development workflow!${NC}"
    echo ""
}

# --- Script Entry Point ---
# Move to the script's directory to ensure paths are correct
cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null

# Error handling
trap 'print_error "An error occurred. Setup failed on line $LINENO. Exit code: $?"; exit 1' ERR

# Run main function
main

# Return to original directory
cd - >/dev/null

exit 0