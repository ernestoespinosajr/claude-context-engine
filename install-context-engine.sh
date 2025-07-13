#!/bin/bash
# Context Engineering System v2.0 - Improved Installation Script
# Properly separates from Claude CLI and installs all required files

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Installation paths
CONTEXT_ENGINE_DIR="$HOME/.claude/context-engine"
CLAUDE_PARENT_DIR="$HOME/.claude"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Version information
VERSION="2.0"
INSTALL_DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Default installation options
INSTALL_MODE="full"  # full, project, update
CLEAN_MODE=false
PROJECT_DIR=""
FORCE_INSTALL=false

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
    echo "  --help               Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                           # Global install to ~/.claude/"
    echo "  $0 --project ./my-project    # Project-specific install"
    echo "  $0 --update                  # Update existing installation"
    echo "  $0 --clean                   # Remove Context Engine files only"
    echo ""
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
    
    for yml in "${yml_files[@]}"; do
        local yml_path="$CONTEXT_ENGINE_DIR/commands/shared/$yml"
        
        if [[ -f "$yml_path" ]] && [[ "$FORCE_INSTALL" == false ]]; then
            print_warning "File exists: $yml (use --force to overwrite)"
        else
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
    print_info "Creating Context Engine directory structure..."
    
    # Core directories
    mkdir -p "$CONTEXT_ENGINE_DIR"/{commands/shared,personas,mcp,docs}
    
    # Copy documentation if available
    if [[ -d "$SOURCE_DIR/docs" ]]; then
        cp -r "$SOURCE_DIR/docs/"* "$CONTEXT_ENGINE_DIR/docs/" 2>/dev/null || true
    fi
    
    print_status "Directory structure created"
}

install_project_structure() {
    if [[ "$INSTALL_MODE" != "project" ]]; then
        return 0
    fi
    
    print_info "Installing project-specific structure..."
    
    local project_path="$(realpath "$PROJECT_DIR")"
    
    # Create project directories
    mkdir -p "$project_path"/{workflow/{planned,in-progress/{active,paused},completed/{successful,archived},templates},context-engine/{layers,managers,templates,validators}}
    
    # Copy workflow templates if available
    if [[ -d "$SOURCE_DIR/workflow/templates" ]]; then
        cp -r "$SOURCE_DIR/workflow/templates/"* "$project_path/workflow/templates/" 2>/dev/null || true
    fi
    
    # Create project CLAUDE.md that references global installation
    cat > "$project_path/CLAUDE.md" << EOF
# Project-Specific Context Engineering Configuration
# This file references the global Context Engine installation

# Include global Context Engine configuration
@include $CONTEXT_ENGINE_DIR/commands/shared/core.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/token-economy.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/compression-patterns.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/universal-constants.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/flags.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/personas.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/mcp.yml
@include $CONTEXT_ENGINE_DIR/commands/shared/rules.yml

# Project-specific configurations can be added below
EOF
    
    print_status "Project structure installed at: $project_path"
}

clean_context_engine() {
    print_warning "Cleaning Context Engine files (preserving Claude CLI)..."
    
    # Files and directories that belong to Context Engine ONLY
    local context_engine_items=(
        "$CONTEXT_ENGINE_DIR"
        "$CLAUDE_PARENT_DIR/CLAUDE.md"
    )
    
    # Files that should NEVER be deleted (Claude CLI)
    local protected_files=(
        "$CLAUDE_PARENT_DIR/claude_3_5_sonnet.json"
        "$CLAUDE_PARENT_DIR/config.json"
        "$CLAUDE_PARENT_DIR/settings.json"
        "$CLAUDE_PARENT_DIR/preferences.json"
        "$CLAUDE_PARENT_DIR/mcp.json"
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
    print_info "Validating Context Engine installation..."
    
    local validation_passed=true
    local required_files=(
        "$CONTEXT_ENGINE_DIR/commands/shared/core.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/token-economy.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/compression-patterns.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/universal-constants.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/flags.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/personas.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/mcp.yml"
        "$CONTEXT_ENGINE_DIR/commands/shared/rules.yml"
        "$CLAUDE_PARENT_DIR/CLAUDE.md"
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
        print_status "Installation validation passed ✅"
        return 0
    else
        print_error "Installation validation failed ❌"
        return 1
    fi
}

create_installation_report() {
    local report_file="$CONTEXT_ENGINE_DIR/installation-report.md"
    
    cat > "$report_file" << EOF
# Context Engineering System v${VERSION} - Installation Report

**Installation Date**: ${INSTALL_DATE}
**Installation Type**: ${INSTALL_MODE}
**Installation Path**: ${CONTEXT_ENGINE_DIR}

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
✅ YML files installed to: ${CONTEXT_ENGINE_DIR}/commands/shared/

### Claude CLI Integration
- Context Engine installed in subdirectory: ${CONTEXT_ENGINE_DIR}
- Claude CLI files preserved in: ${CLAUDE_PARENT_DIR}
- Clean separation maintained

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
- **YML Configurations**: ${CONTEXT_ENGINE_DIR}/commands/shared/
- **Documentation**: ${CONTEXT_ENGINE_DIR}/docs/
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

main() {
    print_header
    
    parse_arguments "$@"
    
    # Handle clean mode
    if [[ "$CLEAN_MODE" == true ]]; then
        clean_context_engine
        exit 0
    fi
    
    # Installation process
    detect_claude_cli
    
    print_info "Installation mode: $INSTALL_MODE"
    
    # Create directories
    create_directory_structure
    
    # Install core files
    create_yml_files
    install_claude_md
    
    # Project-specific installation
    if [[ "$INSTALL_MODE" == "project" ]]; then
        install_project_structure
    fi
    
    # Validate
    if validate_installation; then
        create_installation_report
        
        echo ""
        print_status "🎉 Context Engineering System v${VERSION} installed successfully!"
        echo ""
        print_info "Installation Summary:"
        echo "  ${CYAN}►${NC} Location: $CONTEXT_ENGINE_DIR"
        echo "  ${CYAN}►${NC} CLAUDE.md: $CLAUDE_PARENT_DIR/CLAUDE.md"
        echo "  ${CYAN}►${NC} Report: $CONTEXT_ENGINE_DIR/installation-report.md"
        echo ""
        
        if [[ "$INSTALL_MODE" == "project" ]]; then
            echo "  ${CYAN}►${NC} Project: $PROJECT_DIR"
        fi
        
        print_info "Next steps:"
        echo "  1. Open Claude Desktop"
        echo "  2. Try: /context-engineer \"Your feature description\""
        echo "  3. Use --uc flag for 70% token reduction"
        echo ""
    else
        print_error "Installation failed. Please check the errors above."
        exit 1
    fi
}

# Run main function
main "$@"