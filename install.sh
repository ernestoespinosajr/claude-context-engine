#!/bin/bash
# Context Engineering System v2.5 - Simple Installation Script
# Copies the CCE structure to any project directory

set -e  # Exit on any error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

show_help() {
    echo "Context Engineering System v2.5 - Installation"
    echo ""
    echo "Usage: $0 PROJECT_DIRECTORY"
    echo ""
    echo "Arguments:"
    echo "  PROJECT_DIRECTORY  Path where to install the Context Engineering System"
    echo ""
    echo "Examples:"
    echo "  $0 .                        # Install in current directory"
    echo "  $0 /path/to/my-project      # Install in specific path"
    echo ""
}

# Check if directory argument provided
if [[ $# -eq 0 ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

PROJECT_DIR="$1"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/CCE"

# Convert to absolute path if relative
if [[ ! "$PROJECT_DIR" = /* ]]; then
    PROJECT_DIR="$(pwd)/$PROJECT_DIR"
fi

echo -e "${BLUE}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║        Context Engineering System v2.5 - Installation       ║"
echo "║           Simple, Intelligent Development Workflow           ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

print_info "Installing Context Engineering System to: $PROJECT_DIR"

# Check if source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
    print_error "Source directory not found: $SOURCE_DIR"
    print_error "Make sure you're running this script from the correct location"
    exit 1
fi

# Create target directory if it doesn't exist
if [[ ! -d "$PROJECT_DIR" ]]; then
    print_info "Creating project directory..."
    mkdir -p "$PROJECT_DIR" || {
        print_error "Could not create project directory"
        exit 1
    }
fi

# Check if system already exists
if [[ -d "$PROJECT_DIR/.claude" ]] || [[ -d "$PROJECT_DIR/workflow" ]]; then
    print_info "Context Engineering System already exists in target directory"
    read -p "Do you want to overwrite it? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Installation cancelled"
        exit 0
    fi
fi

# Copy the entire CCE structure
print_info "Copying Context Engineering System files..."

# Use cp to copy everything, preserving structure
cp -r "$SOURCE_DIR/." "$PROJECT_DIR/" || {
    print_error "Failed to copy files"
    exit 1
}

print_success "Files copied successfully"

# Set proper permissions
chmod +x "$PROJECT_DIR/.claude/commands"/*.md 2>/dev/null || true

print_success "Installation completed!"
print_info "Context Engineering System is now available in: $PROJECT_DIR"

echo ""
echo "📋 Next Steps:"
echo "1. Open Claude Desktop or Claude Code CLI"
echo "2. Navigate to your project directory: $PROJECT_DIR"
echo "3. Start with: @ask \"[describe your task]\""
echo ""
echo "📚 Available Commands:"
echo "  @ask         - Smart task analysis and recommendations"
echo "  @issue       - Handle bugs and simple tasks"
echo "  @quick-feature - Medium features and UI changes"
echo "  @feature     - Complex features and system changes"
echo "  @start       - Execute any planned task"
echo ""
echo "📖 Documentation: Check workflow/README.md and logbook.md for details"
echo ""