#!/bin/bash
# Context Engineering System v2.0 - Enhanced Installation Script
# Properly separates from Claude CLI and installs all required files
# Enhanced with security, error handling, and user experience improvements

set -e  # Exit on any error
set -o pipefail  # Exit on pipe failure

# Constants
readonly REQUIRED_SPACE_KB=10240  # 10MB in KB
readonly MIN_BASH_VERSION=3
readonly SCRIPT_VERSION="2.0"

# Colors for output - detect terminal support
if [[ -t 1 ]] && [[ "$(tput colors 2>/dev/null)" -ge 8 ]]; then
    readonly RED='\033[0;31m'
    readonly GREEN='\033[0;32m'
    readonly YELLOW='\033[1;33m'
    readonly BLUE='\033[0;34m'
    readonly CYAN='\033[0;36m'
    readonly NC='\033[0m' # No Color
else
    readonly RED=''
    readonly GREEN=''
    readonly YELLOW=''
    readonly BLUE=''
    readonly CYAN=''
    readonly NC=''
fi

# Error/Warning tracking
ERROR_COUNT=0
WARNING_COUNT=0
ERROR_DETAILS=()
WARNING_DETAILS=()
VERIFICATION_FAILURES=0

# Installation paths
CLAUDE_PARENT_DIR="$HOME/.claude"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$CLAUDE_PARENT_DIR/backups"

# Version information
VERSION="2.0"
INSTALL_DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Default installation options
INSTALL_MODE="full"  # full, project, update
CLEAN_MODE=false
PROJECT_DIR=""
FORCE_INSTALL=false
UPDATE_MODE=false
VERIFY_MODE=false
VERBOSE=false
DRY_RUN=false
LOG_FILE=""
ROLLBACK_ON_FAILURE=true
INSTALLATION_PHASE=false

# Original working directory
ORIGINAL_DIR=$(pwd)

# Files that should NEVER be deleted (Claude CLI)
PROTECTED_CLI_FILES=(
    "claude_3_5_sonnet.json"
    "config.json"
    "settings.json"
    "preferences.json"
    "settings.local.json"
    "backups"
    "projects"
    "shell-snapshots"
    "statsig"
    "todos"
)

print_header() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║       Context Engineering System v${VERSION} - Enhanced Installer      ║"
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

# Enhanced logging functions
log() {
    local message="$1"
    if [[ -n "$LOG_FILE" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] $message" >> "$LOG_FILE"
    fi
    echo "$message"
}

log_verbose() {
    local message="$1"
    if [[ -n "$LOG_FILE" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] [VERBOSE] $message" >> "$LOG_FILE"
    fi
    if [[ "$VERBOSE" = true ]]; then
        echo -e "${BLUE}[VERBOSE]${NC} $message" >&2
    fi
}

log_error() {
    local message="$1"
    local context="${2:-unknown}"
    
    ((ERROR_COUNT++))
    ERROR_DETAILS+=("[$context] $message")
    
    if [[ -n "$LOG_FILE" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] [$context] $message" >> "$LOG_FILE"
    fi
    echo -e "${RED}[ERROR]${NC} $message" >&2
}

log_warning() {
    local message="$1"
    local context="${2:-unknown}"
    
    ((WARNING_COUNT++))
    WARNING_DETAILS+=("[$context] $message")
    
    if [[ -n "$LOG_FILE" ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] [WARNING] [$context] $message" >> "$LOG_FILE"
    fi
    echo -e "${YELLOW}[WARNING]${NC} $message" >&2
}

generate_error_report() {
    if [[ $ERROR_COUNT -eq 0 ]] && [[ $WARNING_COUNT -eq 0 ]]; then
        return 0
    fi
    
    echo ""
    echo -e "${BLUE}=== Installation Report ===${NC}"
    echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Script Version: $SCRIPT_VERSION"
    echo "Installation Directory: $CLAUDE_PARENT_DIR"
    echo ""
    
    if [[ $ERROR_COUNT -gt 0 ]]; then
        echo -e "${RED}Errors ($ERROR_COUNT):${NC}"
        for error in "${ERROR_DETAILS[@]}"; do
            echo "  • $error"
        done
        echo ""
    fi
    
    if [[ $WARNING_COUNT -gt 0 ]]; then
        echo -e "${YELLOW}Warnings ($WARNING_COUNT):${NC}"
        for warning in "${WARNING_DETAILS[@]}"; do
            echo "  • $warning"
        done
        echo ""
    fi
}

show_help() {
    echo "Context Engineering System v${VERSION} Enhanced Installation"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Installation Modes:"
    echo "  --global             Install globally for all projects (default)"
    echo "  --project <dir>      Install for specific project"
    echo "  --update             Update existing installation"
    echo ""
    echo "Options:"
    echo "  --clean              Clean Context Engine files (preserves Claude CLI)"
    echo "  --force              Force installation even if files exist"
    echo "  --verify             Verify existing installation integrity"
    echo "  --verbose            Show detailed output during installation"
    echo "  --dry-run            Preview changes without making them"
    echo "  --log <file>         Save installation log to file"
    echo "  --no-rollback        Disable automatic rollback on failure"
    echo "  --version            Show installer version"
    echo "  --help               Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                           # Global install to ~/.claude/"
    echo "  $0 --project ./my-project    # Project-specific install"
    echo "  $0 --update                  # Update existing installation"
    echo "  $0 --clean                   # Remove Context Engine files only"
    echo "  $0 --verify                  # Verify existing installation"
    echo "  $0 --dry-run --verbose       # Preview with detailed output"
    echo ""
}

# Security validation functions
validate_directory_path() {
    local dir_path="$1"
    
    if [[ -z "$dir_path" ]]; then
        log_error "Directory path cannot be empty" "path-validation"
        return 1
    fi
    
    # Check for dangerous paths
    local dangerous_paths=("/" "/bin" "/sbin" "/usr" "/usr/bin" "/usr/sbin" "/etc" "/sys" "/proc" "/dev" "/boot" "/lib" "/lib64")
    for dangerous in "${dangerous_paths[@]}"; do
        if [[ "$dir_path" == "$dangerous" ]] || [[ "$dir_path" == "$dangerous"/* ]]; then
            log_error "Installation to system directory not allowed: $dir_path" "path-validation"
            return 1
        fi
    done
    
    # Check for path traversal attempts
    if [[ "$dir_path" =~ \.\./|/\.\. ]]; then
        log_error "Path traversal not allowed in directory path: $dir_path" "path-validation"
        return 1
    fi
    
    return 0
}

check_command() {
    local cmd="$1"
    
    if [[ -z "$cmd" ]]; then
        log_error "Command name cannot be empty" "command-check"
        return 1
    fi
    
    # Check for dangerous command patterns
    if [[ "$cmd" =~ [\;\&\|\`\$\(\)\{\}\"\'\\] ]] || [[ "$cmd" =~ \.\.|^/ ]] || [[ "$cmd" =~ [[:space:]] ]]; then
        log_error "Invalid command name contains dangerous characters: $cmd" "command-check"
        return 1
    fi
    
    command -v "$cmd" &> /dev/null
}

verify_file_integrity() {
    local src_file="$1"
    local dest_file="$2"
    
    if [[ -z "$src_file" ]] || [[ -z "$dest_file" ]]; then
        log_error "Both source and destination files required" "integrity-check"
        return 1
    fi
    
    if [[ ! -f "$src_file" ]] || [[ ! -r "$src_file" ]]; then
        log_error "Cannot read source file: $src_file" "integrity-check"
        return 1
    fi
    
    if [[ ! -f "$dest_file" ]] || [[ ! -r "$dest_file" ]]; then
        log_error "Cannot read destination file: $dest_file" "integrity-check"
        return 1
    fi
    
    if ! check_command sha256sum; then
        log_verbose "sha256sum not available, skipping integrity check"
        return 0
    fi
    
    local src_checksum dest_checksum
    
    if ! src_checksum=$(sha256sum "$src_file" 2>/dev/null | awk '{print $1}'); then
        log_error "Failed to calculate checksum for source: $src_file" "integrity-check"
        return 1
    fi
    
    if ! dest_checksum=$(sha256sum "$dest_file" 2>/dev/null | awk '{print $1}'); then
        log_error "Failed to calculate checksum for destination: $dest_file" "integrity-check"
        return 1
    fi
    
    if [[ "$src_checksum" != "$dest_checksum" ]]; then
        log_error "Checksum mismatch for $dest_file" "integrity-check"
        ((VERIFICATION_FAILURES++))
        return 1
    fi
    
    log_verbose "File integrity verified: $dest_file"
    return 0
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --global)
                INSTALL_MODE="full"
                shift
                ;;
            --project)
                INSTALL_MODE="project"
                if [[ -n "$2" && "$2" != --* ]]; then
                    PROJECT_DIR="$2"
                    shift 2
                else
                    print_error "--project requires a directory path"
                    exit 1
                fi
                ;;
            --update)
                INSTALL_MODE="update"
                UPDATE_MODE=true
                shift
                ;;
            --clean)
                CLEAN_MODE=true
                shift
                ;;
            --force)
                FORCE_INSTALL=true
                shift
                ;;
            --verify)
                VERIFY_MODE=true
                shift
                ;;
            --verbose)
                VERBOSE=true
                shift
                ;;
            --dry-run)
                DRY_RUN=true
                shift
                ;;
            --log)
                if [[ -z "$2" ]] || [[ "$2" == --* ]]; then
                    log_error "--log requires a file argument"
                    exit 1
                fi
                LOG_FILE="$2"
                # Create log directory if needed
                log_dir=$(dirname "$LOG_FILE")
                if [[ ! -d "$log_dir" ]]; then
                    mkdir -p "$log_dir" || {
                        log_error "Cannot create log directory: $log_dir"
                        exit 1
                    }
                fi
                shift 2
                ;;
            --no-rollback)
                ROLLBACK_ON_FAILURE=false
                shift
                ;;
            --version)
                echo "Context Engineering System Installer v$SCRIPT_VERSION"
                exit 0
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
}

detect_claude_cli() {
    print_info "Detecting Claude CLI installation..."
    
    if [[ -d "$CLAUDE_PARENT_DIR" ]]; then
        print_status "Claude directory found: $CLAUDE_PARENT_DIR"
        
        # Check for Claude CLI files that we should NOT touch
        local claude_cli_files=(
            "claude_3_5_sonnet.json"
            "config.json"
            "settings.json"
            "preferences.json"
        )
        
        for file in "${claude_cli_files[@]}"; do
            if [[ -f "$CLAUDE_PARENT_DIR/$file" ]]; then
                print_warning "Claude CLI file detected: $file (will be preserved)"
            fi
        done
    else
        print_info "Claude directory not found, will create: $CLAUDE_PARENT_DIR"
    fi
}

detect_global_context_engine() {
    print_info "Checking for existing Context Engineering System installation..."
    
    # Check for global installation markers
    local global_markers=(
        "$CLAUDE_PARENT_DIR/CLAUDE.md"
        "$CLAUDE_PARENT_DIR/commands/context-engineer.md"
        "$CLAUDE_PARENT_DIR/commands/shared/core.yml"
    )
    
    local global_found=false
    for marker in "${global_markers[@]}"; do
        if [[ -f "$marker" ]]; then
            global_found=true
            break
        fi
    done
    
    if [[ "$global_found" = true ]]; then
        print_status "Global Context Engineering System detected at: $CLAUDE_PARENT_DIR"
        
        # Check version if available
        if [[ -f "$CLAUDE_PARENT_DIR/commands/shared/core.yml" ]]; then
            print_info "Existing global installation found"
            if [[ "$INSTALL_MODE" = "project" ]]; then
                print_status "Project installation will use existing global commands"
                print_info "No command duplication will occur"
            elif [[ "$INSTALL_MODE" = "full" ]]; then
                print_warning "Global installation exists - this will update it"
            fi
        fi
    else
        print_info "No global Context Engineering System found"
        if [[ "$INSTALL_MODE" = "project" ]]; then
            print_warning "Project installation recommended only after global installation"
            echo ""
            echo -e "${YELLOW}Recommendation:${NC}"
            echo "1. First install globally: $0 --global"
            echo "2. Then install per project: $0 --project <directory>"
            echo ""
            if [[ "$FORCE_INSTALL" != true ]]; then
                echo -n "Continue with project-only installation? (y/N): "
                read -r continue_choice
                if [[ ! "$continue_choice" =~ ^[Yy]$ ]]; then
                    print_info "Installation cancelled"
                    exit 0
                fi
            fi
        fi
    fi
}

create_backup_if_exists() {
    local file_path="$1"
    local backup_name="$2"
    
    if [[ -f "$file_path" ]]; then
        local timestamp=$(date +"%Y%m%d-%H%M%S")
        
        # Generate secure random suffix
        local backup_random=""
        if [[ -r /dev/urandom ]]; then
            backup_random=$(head -c 8 /dev/urandom 2>/dev/null | od -An -tx1 | tr -d ' \n')
        elif check_command openssl; then
            backup_random=$(openssl rand -hex 8 2>/dev/null)
        else
            backup_random=$(date +%s)$$
        fi
        
        # Use a fixed backup directory for individual file backups
        local file_backup_dir="$CLAUDE_PARENT_DIR/backups"
        local backup_file="$file_backup_dir/${timestamp}-${backup_random}-${backup_name}"
        
        mkdir -p "$file_backup_dir"
        chmod 700 "$file_backup_dir" 2>/dev/null || log_warning "Failed to set restrictive permissions on backup directory"
        
        if cp "$file_path" "$backup_file"; then
            print_status "Backed up existing file: $backup_name -> $backup_file"
            log_verbose "Backup created with secure naming: $backup_file"
            return 0
        else
            log_error "Failed to create backup for: $file_path" "backup"
            return 1
        fi
    fi
    return 1
}

cleanup_on_exit() {
    local exit_code=$?
    
    # Return to original directory
    cd "$ORIGINAL_DIR" 2>/dev/null || true
    
    # Only do rollback if we're in installation phase AND there's an actual backup AND not in dry run
    if [[ $exit_code -ne 0 ]] && [[ "$ROLLBACK_ON_FAILURE" = true ]] && [[ -n "$BACKUP_DIR" ]] && [[ -d "$BACKUP_DIR" ]] && [[ "$INSTALLATION_PHASE" = true ]] && [[ "$DRY_RUN" != true ]]; then
        echo -e "${YELLOW}Installation failed, attempting rollback...${NC}" >&2
        if rollback_installation; then
            echo -e "${GREEN}Rollback completed successfully${NC}" >&2
        else
            echo -e "${RED}Rollback failed - manual intervention required${NC}" >&2
            echo -e "${YELLOW}Backup available at: $BACKUP_DIR${NC}" >&2
        fi
    fi
    
    # Generate error report if there were issues (after rollback attempt)
    if [[ $exit_code -ne 0 ]] || [[ $ERROR_COUNT -gt 0 ]] || [[ $WARNING_COUNT -gt 0 ]]; then
        generate_error_report
    fi
    
    exit $exit_code
}

rollback_installation() {
    if [[ -z "$BACKUP_DIR" ]] || [[ ! -d "$BACKUP_DIR" ]]; then
        log_error "No backup available for rollback" "rollback"
        return 1
    fi
    
    echo -e "${YELLOW}Rolling back installation...${NC}" >&2
    log_verbose "Backup directory: $BACKUP_DIR"
    log_verbose "Install directory: $CLAUDE_PARENT_DIR"
    
    # Validate backup directory contents
    if [[ -z "$(ls -A "$BACKUP_DIR" 2>/dev/null)" ]]; then
        log_error "Backup directory is empty, cannot rollback" "rollback"
        return 1
    fi
    
    # Create temporary directory for safe operations
    local temp_dir
    temp_dir=$(mktemp -d 2>/dev/null) || {
        log_error "Failed to create temporary directory for rollback" "rollback"
        return 1
    }
    
    # Remove failed installation safely
    if [[ -d "$CLAUDE_PARENT_DIR" ]]; then
        log_verbose "Moving failed installation to temporary location"
        if ! mv "$CLAUDE_PARENT_DIR" "$temp_dir/failed_install" 2>/dev/null; then
            log_error "Failed to move failed installation" "rollback"
            rm -rf "$temp_dir" 2>/dev/null
            return 1
        fi
    fi
    
    # Restore backup
    log_verbose "Restoring backup to installation directory"
    if ! mv "$BACKUP_DIR" "$CLAUDE_PARENT_DIR" 2>/dev/null; then
        log_error "Failed to restore backup" "rollback"
        # Try to restore the failed installation
        if [[ -d "$temp_dir/failed_install" ]]; then
            mv "$temp_dir/failed_install" "$CLAUDE_PARENT_DIR" 2>/dev/null || true
        fi
        rm -rf "$temp_dir" 2>/dev/null
        return 1
    fi
    
    # Clean up
    rm -rf "$temp_dir" 2>/dev/null
    BACKUP_DIR=""
    
    echo -e "${GREEN}Installation rolled back successfully${NC}" >&2
    return 0
}

# Set up cleanup trap
trap cleanup_on_exit EXIT INT TERM HUP QUIT

move_repository_files() {
    print_info "Moving repository files to Claude directory..."
    
    # Files to move from repository root to .claude/
    local repo_files=(
        "CLAUDE.md"
        "workflow"
    )
    
    # Create necessary directories
    mkdir -p "$CLAUDE_PARENT_DIR"/{commands/shared,personas,mcp}
    
    # Move main files
    for file in "${repo_files[@]}"; do
        local source_path="$SOURCE_DIR/$file"
        local target_path="$CLAUDE_PARENT_DIR/$file"
        
        log_verbose "Processing file: $file"
        log_verbose "Source path: $source_path"
        log_verbose "Target path: $target_path"
        
        if [[ -e "$source_path" ]]; then
            log_verbose "Source exists, proceeding with copy"
            if [[ -e "$target_path" ]]; then
                log_verbose "Target exists, creating backup"
                create_backup_if_exists "$target_path" "$(basename "$file")"
                rm -rf "$target_path"
            fi
            if [[ "$DRY_RUN" != true ]]; then
                log_verbose "Copying $source_path to $target_path"
                if cp -r "$source_path" "$target_path" 2>/dev/null; then
                    log_verbose "Copy successful for $file"
                else
                    log_error "Failed to copy $source_path to $target_path" "file-copy"
                    return 1
                fi
            fi
            print_status "Moved: $file"
        else
            log_warning "Source file not found: $source_path" "file-copy"
        fi
    done
    
    # Handle docs directory separately (avoid conflict with "old docs")
    local docs_source="$SOURCE_DIR/docs"
    local docs_target="$CLAUDE_PARENT_DIR/docs"
    
    log_verbose "Processing docs directory"
    log_verbose "Docs source: $docs_source"
    log_verbose "Docs target: $docs_target"
    
    if [[ -d "$docs_source" ]]; then
        log_verbose "Docs source directory exists"
        if [[ -e "$docs_target" ]]; then
            log_verbose "Docs target exists, creating backup"
            create_backup_if_exists "$docs_target" "docs"
            rm -rf "$docs_target"
        fi
        if [[ "$DRY_RUN" != true ]]; then
            log_verbose "Copying docs directory"
            if cp -r "$docs_source" "$docs_target" 2>/dev/null; then
                log_verbose "Docs copy successful"
            else
                log_error "Failed to copy docs directory" "file-copy"
                return 1
            fi
        fi
        print_status "Moved: docs"
    else
        log_verbose "Docs source directory not found, skipping"
    fi
    
    # Move context-engine contents if it exists in repository
    if [[ -d "$SOURCE_DIR/context-engine" ]]; then
        log_verbose "Processing context-engine directory"
        local context_files=$(find "$SOURCE_DIR/context-engine" -type f)
        while IFS= read -r file; do
            if [[ -n "$file" ]]; then
                local relative_path="${file#$SOURCE_DIR/context-engine/}"
                local target_file="$CLAUDE_PARENT_DIR/$relative_path"
                local target_dir="$(dirname "$target_file")"
                
                mkdir -p "$target_dir"
                if [[ -f "$target_file" ]]; then
                    create_backup_if_exists "$target_file" "$(basename "$relative_path")"
                fi
                if [[ "$DRY_RUN" != true ]]; then
                    cp "$file" "$target_file" || {
                        log_error "Failed to copy context-engine file: $file" "file-copy"
                        return 1
                    }
                fi
                print_status "Moved context-engine file: $relative_path"
            fi
        done <<< "$context_files"
    fi
    
    # Move commands directory if it exists
    if [[ -d "$SOURCE_DIR/commands" ]]; then
        log_verbose "Processing commands directory"
        local commands_target="$CLAUDE_PARENT_DIR/commands"
        if [[ -e "$commands_target" ]]; then
            log_verbose "Commands target exists, creating backup"
            create_backup_if_exists "$commands_target" "commands"
            rm -rf "$commands_target"
        fi
        if [[ "$DRY_RUN" != true ]]; then
            log_verbose "Copying commands directory"
            if cp -r "$SOURCE_DIR/commands" "$commands_target" 2>/dev/null; then
                log_verbose "Commands copy successful"
            else
                log_error "Failed to copy commands directory" "file-copy"
                return 1
            fi
        fi
        print_status "Moved: commands"
    fi
    
    # Move personas directory if it exists
    if [[ -d "$SOURCE_DIR/personas" ]]; then
        log_verbose "Processing personas directory"
        local personas_target="$CLAUDE_PARENT_DIR/personas"
        if [[ -e "$personas_target" ]]; then
            log_verbose "Personas target exists, creating backup"
            create_backup_if_exists "$personas_target" "personas"
            rm -rf "$personas_target"
        fi
        if [[ "$DRY_RUN" != true ]]; then
            log_verbose "Copying personas directory"
            if cp -r "$SOURCE_DIR/personas" "$personas_target" 2>/dev/null; then
                log_verbose "Personas copy successful"
            else
                log_error "Failed to copy personas directory" "file-copy"
                return 1
            fi
        fi
        print_status "Moved: personas"
    fi
    
    # Move mcp directory if it exists  
    if [[ -d "$SOURCE_DIR/mcp" ]]; then
        log_verbose "Processing mcp directory"
        local mcp_target="$CLAUDE_PARENT_DIR/mcp"
        if [[ -e "$mcp_target" ]]; then
            log_verbose "MCP target exists, creating backup"
            create_backup_if_exists "$mcp_target" "mcp"
            rm -rf "$mcp_target"
        fi
        if [[ "$DRY_RUN" != true ]]; then
            log_verbose "Copying mcp directory"
            if cp -r "$SOURCE_DIR/mcp" "$mcp_target" 2>/dev/null; then
                log_verbose "MCP copy successful"
            else
                log_error "Failed to copy mcp directory" "file-copy"
                return 1
            fi
        fi
        print_status "Moved: mcp"
    fi
}

create_mcp_configuration() {
    print_info "Creating MCP configuration for Claude CLI..."
    
    local mcp_config="$CLAUDE_PARENT_DIR/.mcp.json"
    
    # Backup existing .mcp.json if it exists
    create_backup_if_exists "$mcp_config" ".mcp.json"
    
    cat > "$mcp_config" << 'EOF'
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
EOF
    
    print_status "Created MCP configuration: $mcp_config"
}

clean_incorrect_structure() {
    print_info "Cleaning incorrect structure created by previous installation..."
    
    # Remove the incorrectly created context-engine subdirectory
    local incorrect_dir="$CLAUDE_PARENT_DIR/context-engine"
    if [[ -d "$incorrect_dir" ]]; then
        print_warning "Removing incorrect context-engine subdirectory..."
        
        # First, check if there are any files we need to preserve
        if [[ -f "$incorrect_dir/installation-report.md" ]]; then
            create_backup_if_exists "$incorrect_dir/installation-report.md" "installation-report.md"
        fi
        
        # Move any YML files to correct location if they're newer
        if [[ -d "$incorrect_dir/commands/shared" ]]; then
            for yml_file in "$incorrect_dir/commands/shared"/*.yml; do
                if [[ -f "$yml_file" ]]; then
                    local basename_file="$(basename "$yml_file")"
                    local target_file="$CLAUDE_PARENT_DIR/commands/shared/$basename_file"
                    
                    mkdir -p "$CLAUDE_PARENT_DIR/commands/shared"
                    
                    if [[ -f "$target_file" ]]; then
                        # Compare modification times
                        if [[ "$yml_file" -nt "$target_file" ]]; then
                            create_backup_if_exists "$target_file" "$basename_file"
                            cp "$yml_file" "$target_file"
                            print_status "Updated: $basename_file"
                        fi
                    else
                        cp "$yml_file" "$target_file"
                        print_status "Moved: $basename_file"
                    fi
                fi
            done
        fi
        
        rm -rf "$incorrect_dir"
        print_status "Removed incorrect context-engine subdirectory"
    fi
}

create_yml_content() {
    local yml_file="$1"
    
    case "$yml_file" in
        "core.yml")
            cat << 'EOF'
# Core System Configuration
Core_Philosophy:
  principle: "One Feature, Perfect Context, Quality Implementation"
  approach: "Context-first development with intelligent token management"
  
UltraCompressed_Mode:
  activation: "Automatic at 75% context usage or with --uc flag"
  target: "70% token reduction"
  maintains: "Full semantic meaning"
  
Context_Engineering_Architecture:
  layers:
    - project_overview
    - tech_stack_analysis
    - dependencies_map
    - feature_requirements
    - implementation_context
    - file_relationships
    - validation_rules
    - error_patterns
    - optimization_opportunities
    - documentation_needs
    - testing_requirements
    
Quality_Gates_System:
  phases:
    - requirements_validation
    - implementation_checks
    - integration_testing
    - performance_validation
    - security_review
    
Advanced_Token_Economy:
  budget_management: "Dynamic allocation based on feature complexity"
  compression_pipeline: "Multi-stage optimization"
  cache_strategy: "MCP-integrated intelligent caching"
  
Session_Management:
  state_persistence: true
  auto_resume: true
  conflict_resolution: "intelligent"
EOF
            ;;
            
        "token-economy.yml")
            cat << 'EOF'
# Advanced Token Economy Configuration
Token_Budget_Management:
  allocation_strategy: "dynamic"
  base_budget: 50000
  feature_multipliers:
    simple: 1.0
    moderate: 1.5
    complex: 2.0
    architectural: 3.0
    
Intelligent_Cost_Management:
  optimization_triggers:
    - context_usage: 75%
    - token_count: 40000
    - complexity_score: 8
  reduction_strategies:
    - ultra_compression
    - context_pruning
    - cache_utilization
    
Context_Optimization_Engine:
  relevance_threshold: 0.9
  pruning_algorithm: "semantic_similarity"
  cache_integration: true
  
MCP_Token_Economics:
  cache_value: 0.1  # 10% of original cost
  cache_ttl: 900    # 15 minutes
  intelligent_prefetch: true
  
Performance_Monitoring:
  metrics:
    - token_efficiency
    - context_relevance
    - compression_ratio
    - cache_hit_rate
  targets:
    token_efficiency: 0.7
    context_relevance: 0.9
    compression_ratio: 0.7
    cache_hit_rate: 0.85
EOF
            ;;
            
        "compression-patterns.yml")
            cat << 'EOF'
# Compression Patterns Configuration
Performance_Baselines:
  uncompressed:
    avg_tokens: 50000
    clarity: 1.0
    speed: "baseline"
  compressed:
    avg_tokens: 25000
    clarity: 0.95
    speed: "2x faster"
  ultra_compressed:
    avg_tokens: 15000
    clarity: 0.9
    speed: "3x faster"
    
Compression_Pipeline:
  stages:
    - remove_redundancy
    - abbreviate_common_terms
    - consolidate_similar_concepts
    - apply_universal_constants
    - semantic_compression
    
UltraCompressed_Mode_Rules:
  abbreviations:
    implementation: "impl"
    configuration: "cfg"
    development: "dev"
    architecture: "arch"
    documentation: "docs"
  symbols:
    success: "✅"
    warning: "⚠️"
    error: "❌"
    info: "ℹ️"
    in_progress: "🔄"
  removal_patterns:
    - verbose_explanations
    - redundant_context
    - obvious_implications
EOF
            ;;
            
        "universal-constants.yml")
            cat << 'EOF'
# Universal Constants and Legend
Universal_Legend:
  symbols:
    "✅": "Success/Completed"
    "❌": "Error/Failed"
    "⚠️": "Warning/Caution"
    "ℹ️": "Information"
    "🔄": "In Progress"
    "📁": "Directory"
    "📄": "File"
    "🔧": "Configuration"
    "🚀": "Performance"
    "🔒": "Security"
    "🧪": "Testing"
    "📦": "Package/Dependency"
    "🎯": "Target/Goal"
    "💡": "Tip/Suggestion"
    "🔍": "Search/Analysis"
    
  abbreviations:
    cfg: "configuration"
    impl: "implementation"
    dev: "development"
    prod: "production"
    env: "environment"
    deps: "dependencies"
    arch: "architecture"
    auth: "authentication"
    db: "database"
    api: "application programming interface"
    ui: "user interface"
    ux: "user experience"
    dto: "data transfer object"
    orm: "object relational mapping"
    ci: "continuous integration"
    cd: "continuous deployment"
EOF
            ;;
            
        "flags.yml")
            cat << 'EOF'
# Flag System Configuration
Universal_Flags:
  --plan:
    description: "Generate detailed implementation plan"
    applies_to: ["all_commands"]
  --think:
    description: "Show reasoning process"
    applies_to: ["all_commands"]
  --uc:
    description: "Ultra-compressed mode (70% token reduction)"
    applies_to: ["all_commands"]
  --compress:
    description: "Standard compression (50% token reduction)"
    applies_to: ["all_commands"]
  --cache:
    description: "Utilize MCP caching"
    applies_to: ["all_commands"]
    
Command_Specific_Flags:
  context_engineer:
    --analyze-deps:
      description: "Deep dependency analysis"
    --tech-stack:
      description: "Detailed tech stack analysis"
    --security-focus:
      description: "Enhanced security considerations"
  execute_context:
    --validate:
      description: "Strict validation mode"
    --test:
      description: "Include test generation"
    --benchmark:
      description: "Performance benchmarking"
  context_status:
    --detailed:
      description: "Comprehensive status report"
    --metrics:
      description: "Show performance metrics"
    --recommendations:
      description: "Include optimization suggestions"
EOF
            ;;
            
        "personas.yml")
            cat << 'EOF'
# Specialized Personas Configuration
All_Personas:
  architect:
    symbol: "🏗️"
    expertise: ["system_design", "patterns", "scalability"]
    activation: ["architecture", "design", "structure"]
  security:
    symbol: "🔒"
    expertise: ["security", "authentication", "encryption"]
    activation: ["security", "auth", "protect"]
  performance:
    symbol: "⚡"
    expertise: ["optimization", "caching", "efficiency"]
    activation: ["performance", "speed", "optimize"]
  testing:
    symbol: "🧪"
    expertise: ["testing", "validation", "quality"]
    activation: ["test", "validate", "quality"]
  devops:
    symbol: "🚀"
    expertise: ["deployment", "ci_cd", "infrastructure"]
    activation: ["deploy", "pipeline", "infrastructure"]
    
Intelligent_Activation_Patterns:
  auto_detect: true
  context_based: true
  multi_persona: true
  
Collaboration_Patterns:
  architect_security: "Secure system design"
  performance_testing: "Performance validation"
  security_devops: "Secure deployment"
EOF
            ;;
            
        "mcp.yml")
            cat << 'EOF'
# MCP Integration Configuration
MCP_Integration:
  available_mcps:
    context7:
      description: "Advanced context management"
      flags: ["--mcp-context7", "--mc7"]
    sequential:
      description: "Sequential thinking assistance"
      flags: ["--mcp-sequential", "--mseq"]
    magic:
      description: "Enhanced code generation"
      flags: ["--mcp-magic", "--mmag"]
    puppeteer:
      description: "Browser automation"
      flags: ["--mcp-puppeteer", "--mpup"]
      
Token_Economics:
  cache_multiplier: 0.1
  cache_duration: 900
  
Cache_Management:
  strategy: "lru_with_relevance"
  max_size: "100MB"
  ttl: 900
  smart_invalidation: true
  
Workflows:
  auto_cache_context: true
  prefetch_related: true
  compression_before_cache: true
EOF
            ;;
            
        "rules.yml")
            cat << 'EOF'
# Development Rules and Standards
Quality_Gates:
  mandatory:
    - syntax_validation
    - type_checking
    - security_scan
  optional:
    - performance_benchmark
    - accessibility_check
    
Security_Standards:
  input_validation: "always"
  authentication: "required"
  authorization: "role_based"
  encryption: "data_at_rest_and_transit"
  
Development_Standards:
  code_style: "language_idiomatic"
  documentation: "inline_and_external"
  error_handling: "comprehensive"
  testing: "unit_and_integration"
  
Smart_Defaults:
  react_native:
    state_management: "zustand"
    navigation: "react_navigation"
    styling: "styled_components"
  python_fastapi:
    orm: "sqlalchemy"
    validation: "pydantic"
    testing: "pytest"
    
Code_Generation:
  patterns: "best_practices"
  comments: "meaningful"
  structure: "modular"
  
Session_Awareness:
  state_tracking: true
  progress_persistence: true
  auto_resume: true
EOF
            ;;
    esac
}

create_yml_files() {
    print_info "Creating YML configuration files..."
    
    local yml_files=(
        "core.yml"
        "token-economy.yml"
        "compression-patterns.yml"
        "universal-constants.yml"
        "flags.yml"
        "personas.yml"
        "mcp.yml"
        "rules.yml"
    )
    
    mkdir -p "$CLAUDE_PARENT_DIR/commands/shared"
    
    for yml in "${yml_files[@]}"; do
        local yml_path="$CLAUDE_PARENT_DIR/commands/shared/$yml"
        
        if [[ -f "$yml_path" ]] && [[ "$FORCE_INSTALL" == false ]]; then
            print_warning "File exists: $yml (use --force to overwrite)"
        else
            if [[ -f "$yml_path" ]]; then
                create_backup_if_exists "$yml_path" "$yml"
            fi
            create_yml_content "$yml" > "$yml_path"
            print_status "Created: $yml"
        fi
    done
}

install_claude_md() {
    print_info "Installing CLAUDE.md to parent Claude directory..."
    
    local source_claude="$SOURCE_DIR/CLAUDE.md"
    local target_claude="$CLAUDE_PARENT_DIR/CLAUDE.md"
    
    if [[ ! -f "$source_claude" ]]; then
        print_error "Source CLAUDE.md not found at: $source_claude"
        return 1
    fi
    
    if [[ -f "$target_claude" ]] && [[ "$FORCE_INSTALL" == false ]]; then
        print_warning "CLAUDE.md already exists at: $target_claude"
        print_info "Use --force to overwrite or --update to update"
    else
        cp "$source_claude" "$target_claude"
        print_status "Installed CLAUDE.md to: $target_claude"
    fi
}

create_directory_structure() {
    print_info "Creating Claude directory structure..."
    
    # Core directories
    mkdir -p "$CLAUDE_PARENT_DIR"/{commands/shared,personas,mcp,docs}
    
    print_status "Directory structure created"
}

install_project_structure() {
    if [[ "$INSTALL_MODE" != "project" ]]; then
        return 0
    fi
    
    print_info "Installing project-specific structure..."
    
    # Resolve project path (handle non-existent directories)
    local project_path="$PROJECT_DIR"
    if [[ ! "$project_path" = /* ]]; then
        # Convert relative to absolute path
        project_path="$(pwd)/$project_path"
    fi
    
    # Validate parent directory exists
    local parent_dir="$(dirname "$project_path")"
    if [[ ! -d "$parent_dir" ]]; then
        log_error "Parent directory does not exist: $parent_dir"
        return 1
    fi
    
    # Create project directories
    log_verbose "Creating project directories at: $project_path"
    if [[ "$DRY_RUN" != true ]]; then
        mkdir -p "$project_path/workflow/planned"
        mkdir -p "$project_path/workflow/in-progress/active"
        mkdir -p "$project_path/workflow/in-progress/paused"
        mkdir -p "$project_path/workflow/completed/successful"
        mkdir -p "$project_path/workflow/completed/archived"
        mkdir -p "$project_path/workflow/templates"
    fi
    
    # Copy workflow templates if available
    if [[ -d "$SOURCE_DIR/workflow/templates" ]] && [[ "$DRY_RUN" != true ]]; then
        log_verbose "Copying workflow templates to project"
        mkdir -p "$project_path/workflow/templates"
        cp -r "$SOURCE_DIR/workflow/templates/"* "$project_path/workflow/templates/" 2>/dev/null || true
    fi
    
    # Copy MCP configuration to project directory for MCP server access
    if [[ -f "$CLAUDE_PARENT_DIR/.mcp.json" ]] && [[ "$DRY_RUN" != true ]]; then
        log_verbose "Copying MCP configuration to project"
        if cp "$CLAUDE_PARENT_DIR/.mcp.json" "$project_path/.mcp.json"; then
            print_status "Installed MCP configuration to project: $project_path/.mcp.json"
        else
            log_warning "Failed to copy MCP configuration to project" "mcp-copy"
        fi
    else
        log_warning "Global MCP configuration not found at $CLAUDE_PARENT_DIR/.mcp.json" "mcp-copy"
        print_info "Run global installation first to create MCP template"
    fi
    
    # Create project CLAUDE.md in .claude/ subdirectory to avoid global conflicts
    # This follows Claude CLI's local project configuration pattern
    if [[ "$DRY_RUN" != true ]]; then
        mkdir -p "$project_path/.claude"
        cat > "$project_path/.claude/CLAUDE.md" << EOF
# Project Configuration - Context Engineering System

This project uses the global Context Engineering System installed at: $CLAUDE_PARENT_DIR
Commands are provided globally and available in all projects automatically.

## Project Metadata
- **Project Name**: $(basename "$project_path")
- **Installation Date**: $(date +"%Y-%m-%d %H:%M:%S")
- **Context Engine Version**: 2.0
- **Global Installation**: $CLAUDE_PARENT_DIR

## Project-Specific Context

### Technology Stack
# Document your project's technology stack here
# This helps the Context Engine understand your project better
# Examples:
# - Framework: React Native
# - State Management: Zustand
# - Navigation: React Navigation
# - Styling: Styled Components
# - Testing: Jest + React Native Testing Library

### Development Standards
# Define project-specific development standards
# Examples:
# - All components must have TypeScript definitions
# - All features must include unit tests
# - Follow semantic versioning for releases
# - Use ESLint and Prettier for code formatting

### Project Workflows
# Custom workflow configurations for this project
# These settings influence how /context-engineer plans features
workflow_settings:
  - feature_planning_depth: detailed
  - validation_level: strict
  - documentation_required: true
  - testing_coverage_target: 80%

### Custom Templates
# Project-specific feature templates
# These will be used by /context-engineer when available
templates:
  - react_native_screen: "Create new app screen with navigation"
  - api_integration: "Add new API endpoint integration"
  - component_library: "Add reusable UI component"

### Quality Gates
# Project-specific quality requirements
quality_requirements:
  - typescript_strict: true
  - test_coverage_minimum: 80
  - accessibility_compliance: true
  - performance_budget_mobile: "< 3s load time"

---
*Project powered by Context Engineering System v2.0*
*Commands: /context-engineer, /execute-context, /context-status*
EOF
    fi
    
    print_status "Project structure installed at: $project_path"
}

clean_context_engine() {
    print_warning "Cleaning Context Engine files (preserving Claude CLI)..."
    
    # Files and directories that belong to Context Engine ONLY
    local context_engine_items=(
        "$CLAUDE_PARENT_DIR/commands"
        "$CLAUDE_PARENT_DIR/personas"
        "$CLAUDE_PARENT_DIR/mcp"
        "$CLAUDE_PARENT_DIR/docs"
        "$CLAUDE_PARENT_DIR/workflow"
        "$CLAUDE_PARENT_DIR/context-engine"
        "$CLAUDE_PARENT_DIR/CLAUDE.md"
    )
    
    # Files that should NEVER be deleted (Claude CLI)
    local protected_files=(
        "$CLAUDE_PARENT_DIR/claude_3_5_sonnet.json"
        "$CLAUDE_PARENT_DIR/config.json"
        "$CLAUDE_PARENT_DIR/settings.json"
        "$CLAUDE_PARENT_DIR/preferences.json"
        "$CLAUDE_PARENT_DIR/settings.local.json"
        "$CLAUDE_PARENT_DIR/backups"
        "$CLAUDE_PARENT_DIR/projects"
        "$CLAUDE_PARENT_DIR/shell-snapshots"
        "$CLAUDE_PARENT_DIR/statsig"
        "$CLAUDE_PARENT_DIR/todos"
    )
    
    echo ""
    print_info "Items to be removed:"
    for item in "${context_engine_items[@]}"; do
        if [[ -e "$item" ]]; then
            echo "  - $item"
        fi
    done
    
    echo ""
    print_info "Protected Claude CLI files:"
    for item in "${protected_files[@]}"; do
        if [[ -e "$item" ]]; then
            echo "  ✓ $item (will be preserved)"
        fi
    done
    
    echo ""
    read -p "Continue with Context Engine cleanup? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Cleanup cancelled"
        return 0
    fi
    
    # Remove Context Engine items
    for item in "${context_engine_items[@]}"; do
        if [[ -e "$item" ]]; then
            # Extra safety check
            local is_protected=false
            for protected in "${protected_files[@]}"; do
                if [[ "$item" == "$protected" ]]; then
                    is_protected=true
                    break
                fi
            done
            
            if [[ "$is_protected" == false ]]; then
                rm -rf "$item"
                print_status "Removed: $item"
            else
                print_warning "Skipped protected file: $item"
            fi
        fi
    done
    
    print_status "Context Engine cleanup completed"
}

validate_installation() {
    if [[ "$INSTALL_MODE" == "project" ]]; then
        validate_project_installation
    else
        validate_global_installation
    fi
}

validate_global_installation() {
    print_info "Validating global Context Engine installation..."
    
    local validation_passed=true
    local required_files=(
        "$CLAUDE_PARENT_DIR/commands/shared/core.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/token-economy.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/compression-patterns.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/universal-constants.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/flags.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/personas.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/mcp.yml"
        "$CLAUDE_PARENT_DIR/commands/shared/rules.yml"
        "$CLAUDE_PARENT_DIR/CLAUDE.md"
        "$CLAUDE_PARENT_DIR/.mcp.json"
    )
    
    for file in "${required_files[@]}"; do
        if [[ -f "$file" ]]; then
            print_status "✓ $(basename "$file")"
        else
            print_error "✗ Missing: $file"
            validation_passed=false
        fi
    done
    
    # Check CLAUDE.md references
    if [[ -f "$CLAUDE_PARENT_DIR/CLAUDE.md" ]]; then
        if grep -q "@include commands/shared/" "$CLAUDE_PARENT_DIR/CLAUDE.md"; then
            print_status "✓ CLAUDE.md has correct @include references"
        else
            print_error "✗ CLAUDE.md missing @include references"
            validation_passed=false
        fi
    fi
    
    if [[ "$validation_passed" == true ]]; then
        print_status "Global installation validation passed ✅"
        return 0
    else
        print_error "Global installation validation failed ❌"
        return 1
    fi
}

validate_project_installation() {
    print_info "Validating project-specific installation..."
    
    local validation_passed=true
    local project_path="$PROJECT_DIR"
    if [[ ! "$project_path" = /* ]]; then
        project_path="$(pwd)/$project_path"
    fi
    
    # Check project-specific files
    local project_files=(
        "$project_path/.claude/CLAUDE.md"
        "$project_path/workflow"
        "$project_path/.mcp.json"
    )
    
    for file in "${project_files[@]}"; do
        if [[ -e "$file" ]]; then
            print_status "✓ $(basename "$file")"
        else
            print_error "✗ Missing: $file"
            validation_passed=false
        fi
    done
    
    # Check global installation exists (required for project mode)
    if [[ -f "$CLAUDE_PARENT_DIR/CLAUDE.md" ]]; then
        print_status "✓ Global installation detected"
    else
        print_error "✗ Global installation missing (required for project mode)"
        validation_passed=false
    fi
    
    if [[ "$validation_passed" == true ]]; then
        print_status "Project installation validation passed ✅"
        return 0
    else
        print_error "Project installation validation failed ❌"
        return 1
    fi
}

create_installation_report() {
    local report_file="$CLAUDE_PARENT_DIR/installation-report.md"
    
    cat > "$report_file" << EOF
# Context Engineering System v${VERSION} - Installation Report

**Installation Date**: ${INSTALL_DATE}
**Installation Type**: ${INSTALL_MODE}
**Installation Path**: ${CLAUDE_PARENT_DIR}

## Installation Summary

### Core Components
✅ Core System (core.yml)
✅ Token Economy (token-economy.yml)
✅ Compression Patterns (compression-patterns.yml)
✅ Universal Constants (universal-constants.yml)
✅ Flag System (flags.yml)
✅ Personas System (personas.yml)
✅ MCP Integration (mcp.yml)
✅ Development Rules (rules.yml)

### Configuration Files
✅ CLAUDE.md installed to: ${CLAUDE_PARENT_DIR}/CLAUDE.md
✅ YML files installed to: ${CLAUDE_PARENT_DIR}/commands/shared/
✅ MCP configuration: ${CLAUDE_PARENT_DIR}/.mcp.json
✅ Workflow structure: ${CLAUDE_PARENT_DIR}/workflow/

### Claude CLI Integration
- Context Engine files integrated directly into: ${CLAUDE_PARENT_DIR}
- Claude CLI files preserved and protected
- MCP servers configured for immediate use

## Quick Start

1. **Global Usage**: The Context Engine is now available in all your projects
2. **Basic Commands**:
   - \`/context-engineer "feature"\` - Plan new features
   - \`/execute-context feature-name\` - Implement features
   - \`/context-status\` - Check project health

3. **Token Efficiency**:
   - Use \`--uc\` flag for 70% token reduction
   - Auto-compression at 75% context usage

## File Locations

- **Main Configuration**: ${CLAUDE_PARENT_DIR}/CLAUDE.md
- **YML Configurations**: ${CLAUDE_PARENT_DIR}/commands/shared/
- **MCP Configuration**: ${CLAUDE_PARENT_DIR}/.mcp.json
- **Workflow Structure**: ${CLAUDE_PARENT_DIR}/workflow/
- **Documentation**: ${CLAUDE_PARENT_DIR}/docs/
- **Backups**: ${CLAUDE_PARENT_DIR}/backups/
- **This Report**: ${report_file}

## Next Steps

1. Open Claude Desktop
2. The Context Engine commands are now available
3. Try: \`/context-engineer "Add user authentication"\`

---
*Context Engineering System v${VERSION} - Successfully Installed*
EOF
    
    print_status "Installation report created: $report_file"
}

run_preflight_checks() {
    log_verbose "Running pre-flight checks..."
    
    # Check required commands
    local required_commands=("find" "sort" "uniq" "basename" "dirname" "grep" "awk" "sed")
    local missing_commands=()
    
    for cmd in "${required_commands[@]}"; do
        if ! check_command "$cmd"; then
            missing_commands+=("$cmd")
        fi
    done
    
    if [[ ${#missing_commands[@]} -gt 0 ]]; then
        log_error "Missing required commands: ${missing_commands[*]}" "preflight-check"
        echo "Please install the missing commands and try again."
        exit 1
    fi
    
    # Check bash version
    local bash_major_version="${BASH_VERSION%%.*}"
    if [[ -z "$bash_major_version" ]] || [[ "$bash_major_version" -lt "$MIN_BASH_VERSION" ]]; then
        log_error "Bash version $MIN_BASH_VERSION.0 or higher required (current: ${BASH_VERSION:-unknown})" "preflight-check"
        exit 1
    fi
    
    # Check disk space
    if [[ "$DRY_RUN" != true ]]; then
        local install_parent=$(dirname "$CLAUDE_PARENT_DIR")
        if [[ -d "$install_parent" ]]; then
            local available_space=""
            if check_command df; then
                available_space=$(df -P -k "$install_parent" 2>/dev/null | awk 'NR==2 && NF>=4 {print $4}')
                if [[ -n "$available_space" ]] && [[ "$available_space" -lt "$REQUIRED_SPACE_KB" ]]; then
                    log_error "Insufficient disk space. Need at least $((REQUIRED_SPACE_KB / 1024))MB free." "disk-space-check"
                    exit 1
                fi
            fi
        fi
    fi
    
    log_verbose "Pre-flight checks passed"
}

main() {
    print_header
    
    parse_arguments "$@"
    
    # Validate installation directory path
    if ! validate_directory_path "$CLAUDE_PARENT_DIR"; then
        exit 1
    fi
    
    # Run pre-flight checks
    run_preflight_checks
    
    # Handle verification mode
    if [[ "$VERIFY_MODE" = true ]]; then
        echo -e "${GREEN}Context Engine Verification${NC}"
        echo "========================="
        echo -e "Target directory: ${YELLOW}$CLAUDE_PARENT_DIR${NC}"
        echo ""
        
        if [[ ! -d "$CLAUDE_PARENT_DIR" ]]; then
            echo -e "${RED}Error: Context Engine not found at $CLAUDE_PARENT_DIR${NC}"
            exit 1
        fi
        
        # Verify installation
        if validate_installation; then
            echo -e "${GREEN}✓ Installation verified successfully!${NC}"
            exit 0
        else
            echo -e "${RED}✗ Verification failed${NC}"
            exit 1
        fi
    fi
    
    # Handle clean mode
    if [[ "$CLEAN_MODE" == true ]]; then
        clean_context_engine
        exit 0
    fi
    
    # Show installation info
    echo -e "Installation directory: ${YELLOW}$CLAUDE_PARENT_DIR${NC}"
    if [[ "$DRY_RUN" = true ]]; then
        echo -e "${BLUE}Mode: DRY RUN (no changes will be made)${NC}"
    fi
    if [[ "$VERBOSE" = true ]]; then
        echo -e "${BLUE}Mode: VERBOSE${NC}"
    fi
    if [[ -n "$LOG_FILE" ]]; then
        echo -e "Log file: ${YELLOW}$LOG_FILE${NC}"
    fi
    echo ""
    
    # Check if existing directory exists and has files - create backup if needed
    if [[ -d "$CLAUDE_PARENT_DIR" ]] && [[ "$(ls -A "$CLAUDE_PARENT_DIR" 2>/dev/null)" ]] && [[ "$DRY_RUN" != true ]]; then
        echo -e "${YELLOW}Existing configuration found - creating backup...${NC}"
        
        # Create backup directory with secure random suffix
        local backup_timestamp=$(date +%Y%m%d_%H%M%S)
        local backup_random=""
        if [[ -r /dev/urandom ]]; then
            backup_random=$(head -c 8 /dev/urandom 2>/dev/null | od -An -tx1 | tr -d ' \n')
        elif check_command openssl; then
            backup_random=$(openssl rand -hex 8 2>/dev/null)
        else
            backup_random=$(date +%s)$$
        fi
        
        BACKUP_DIR="$(dirname "$CLAUDE_PARENT_DIR")/context-engine-backup.${backup_timestamp}.${backup_random}"
        
        if mkdir -p "$BACKUP_DIR" && chmod 700 "$BACKUP_DIR"; then
            # Backup existing files
            if cd "$CLAUDE_PARENT_DIR" && find . -mindepth 1 -maxdepth 1 -exec cp -rP {} "$BACKUP_DIR/" \; 2>/dev/null; then
                echo -e "${GREEN}Backup created: $BACKUP_DIR${NC}"
                cd "$ORIGINAL_DIR"
            else
                log_warning "Failed to create complete backup" "backup"
                BACKUP_DIR=""
                cd "$ORIGINAL_DIR"
            fi
        else
            log_warning "Failed to create backup directory" "backup"
            BACKUP_DIR=""
        fi
    fi
    
    # Mark installation phase as starting
    INSTALLATION_PHASE=true
    
    # Installation process
    log_verbose "Starting installation process"
    detect_claude_cli
    detect_global_context_engine
    
    log "Installation mode: $INSTALL_MODE"
    
    # Execute installation steps based on mode
    if [[ "$INSTALL_MODE" == "project" ]]; then
        # Project-only installation - NO global files touched
        log_verbose "Project-only installation: Creating project configuration only"
        install_project_structure
    else
        # Global installation (full or update mode)
        log_verbose "Global installation: Installing commands and global configuration"
        
        # Clean incorrect structure from previous installations
        log_verbose "Step 1: Cleaning incorrect structure"
        clean_incorrect_structure
        
        # Create directories
        log_verbose "Step 2: Creating directory structure"
        create_directory_structure
        
        # Move repository files to correct locations
        log_verbose "Step 3: Moving repository files"
        if ! move_repository_files; then
            log_error "Failed during move_repository_files step" "installation"
            return 1
        fi
        log_verbose "Step 3 completed successfully"
        
        # Install core files
        log_verbose "Step 4: Installing core files"
        if ! create_yml_files; then
            log_error "Failed during create_yml_files step" "installation"
            return 1
        fi
        log_verbose "Step 4 completed successfully"
        
        # Create MCP configuration
        log_verbose "Step 5: Creating MCP configuration"
        if ! create_mcp_configuration; then
            log_error "Failed during create_mcp_configuration step" "installation"
            return 1
        fi
        log_verbose "Step 5 completed successfully"
    fi
    
    # Mark installation phase as complete
    INSTALLATION_PHASE=false
    
    # Validate
    if validate_installation; then
        create_installation_report
        
        echo ""
        if [[ "$UPDATE_MODE" = true ]]; then
            print_status "🎉 Context Engineering System v${VERSION} updated successfully!"
        else
            print_status "🎉 Context Engineering System v${VERSION} installed successfully!"
        fi
        echo ""
        log "Installation Summary:"
        echo "  ${CYAN}►${NC} Location: $CLAUDE_PARENT_DIR"
        echo "  ${CYAN}►${NC} CLAUDE.md: $CLAUDE_PARENT_DIR/CLAUDE.md"
        echo "  ${CYAN}►${NC} MCP Config: $CLAUDE_PARENT_DIR/.mcp.json"
        echo "  ${CYAN}►${NC} Report: $CLAUDE_PARENT_DIR/installation-report.md"
        echo ""
        
        if [[ -n "$BACKUP_DIR" ]] && [[ -d "$BACKUP_DIR" ]]; then
            echo -e "${YELLOW}Note: Previous configuration backed up to:${NC}"
            echo "$BACKUP_DIR"
            echo ""
        fi
        
        if [[ "$INSTALL_MODE" == "project" ]]; then
            echo "  ${CYAN}►${NC} Project: $PROJECT_DIR"
        fi
        
        log "Next steps:"
        echo "  1. Open Claude Desktop"
        echo "  2. Try: /context-engineer \"Your feature description\""
        echo "  3. Use --uc flag for 70% token reduction"
        echo ""
        
        # Show summary of any issues
        if [[ $WARNING_COUNT -gt 0 ]]; then
            echo -e "${YELLOW}Installation completed with $WARNING_COUNT warning(s).${NC}"
        fi
        if [[ $VERIFICATION_FAILURES -gt 0 ]]; then
            echo -e "${YELLOW}Note: $VERIFICATION_FAILURES file(s) had integrity verification issues.${NC}"
        fi
        
    else
        print_error "Installation failed. Please check the errors above."
        exit 1
    fi
}

# Run main function
main "$@"