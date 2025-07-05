# Context Layer Template

This template shows the standard structure for each context layer in the 11-Layer Architecture.

## Layer Structure

```yaml
layer:
  id: "layer-{number}"
  name: "{Layer Name}"
  priority: {1-11}
  weight: {0.0-1.0}
  
  content:
    static: "{Static content that doesn't change}"
    dynamic: "{Dynamic content updated during session}"
    template: "{Template for content generation}"
    
  filters:
    relevance: "{Relevance scoring rules}"
    scope: "{Scope filtering rules}"
    density: "{Information density optimization}"
    
  validation:
    required: ["{Required fields}"]
    optional: ["{Optional fields}"]
    constraints: "{Validation constraints}"
    
  optimization:
    compression: "{Content compression rules}"
    truncation: "{Truncation strategies}"
    refresh: "{Refresh frequency}"
```

## Example: Layer 7 - Project Context

```yaml
layer:
  id: "layer-7"
  name: "Project Context"
  priority: 7
  weight: 0.8
  
  content:
    static: |
      - Project type: {project_type}
      - Language: {primary_language}
      - Framework: {framework}
      - Architecture: {architecture_pattern}
      
    dynamic: |
      - Active features: {active_features}
      - Recent changes: {recent_changes}
      - Current dependencies: {current_dependencies}
      - Build status: {build_status}
      
    template: |
      **Project Overview**
      This is a {project_type} project built with {framework} using {primary_language}.
      
      **Architecture**
      - Pattern: {architecture_pattern}
      - Structure: {directory_structure}
      - Dependencies: {main_dependencies}
      
      **Current State**
      - Active features: {active_features}
      - Recent changes: {recent_changes}
      - Health status: {health_status}
      
  filters:
    relevance: |
      - Higher weight for current feature's related files
      - Lower weight for unrelated project areas
      - Boost weight for recently modified files
      
    scope: |
      - Include: Current feature scope + direct dependencies
      - Exclude: Unrelated modules and legacy code
      - Limit: Top 20 most relevant files/modules
      
    density: |
      - Prioritize: Modified files > Related files > All files
      - Compress: File summaries instead of full content
      - Optimize: Most relevant information first
      
  validation:
    required: ["project_type", "primary_language", "framework"]
    optional: ["architecture_pattern", "build_status", "health_status"]
    constraints: |
      - project_type must be valid type
      - primary_language must be detected language
      - framework must be from project dependencies
      
  optimization:
    compression: |
      - Summarize large files (>1000 lines)
      - Extract key functions/classes only
      - Use abstractions for complex logic
      
    truncation: |
      - Keep most relevant 80% of content
      - Remove debug/commented code
      - Prioritize by relevance score
      
    refresh: |
      - Static content: Once per session
      - Dynamic content: Every 10 minutes
      - Template: On project structure changes
```

## Layer Integration

### Input Processing
```javascript
// Each layer receives standardized input
const layerInput = {
  query: "Current user query",
  feature: "Current feature context",
  session: "Session state",
  project: "Project metadata",
  history: "Relevant history"
};
```

### Output Format
```javascript
// Each layer produces standardized output
const layerOutput = {
  content: "Processed context content",
  relevance: 0.85,
  density: 0.92,
  tokens: 245,
  metadata: {
    source: "layer-7",
    timestamp: "2024-01-15T10:30:00Z",
    refresh_needed: false
  }
};
```

### Context Combination
```javascript
// Layers are combined with weighted averaging
const combinedContext = layers
  .map(layer => ({
    content: layer.content,
    weight: layer.weight * layer.relevance
  }))
  .sort((a, b) => b.weight - a.weight)
  .slice(0, maxLayers)
  .map(layer => layer.content)
  .join('\n\n');
```

## Custom Layer Creation

To create a custom layer:

1. **Define Layer Purpose**: What specific context does this layer provide?
2. **Set Priority**: Where in the 11-layer stack does it fit?
3. **Create Content Template**: How is the context structured?
4. **Define Filters**: What relevance and scope rules apply?
5. **Set Validation Rules**: What's required vs. optional?
6. **Configure Optimization**: How is content compressed/truncated?

## Best Practices

### Layer Design
- **Single Responsibility**: Each layer should have one clear purpose
- **Minimal Overlap**: Avoid duplicating information across layers
- **Clear Boundaries**: Define what belongs in each layer
- **Consistent Format**: Use standardized templates and structures

### Content Management
- **Relevance First**: Most relevant information should be prioritized
- **Density Optimization**: Pack maximum useful information per token
- **Dynamic Updates**: Keep content fresh and current
- **Scope Control**: Focus on current feature context

### Performance Optimization
- **Lazy Loading**: Load layer content only when needed
- **Caching**: Cache stable content to reduce computation
- **Compression**: Use efficient content representation
- **Truncation**: Remove less relevant content to fit context window 