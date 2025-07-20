# Guía del Context Engineering System

Esta guía explica cómo usar el Context Engineering System con Claude Code CLI para desarrollar software usando un enfoque dirigido por características y optimización de contexto.

## Índice

1. [Arquitectura de 11 capas](#arquitectura-de-11-capas)
2. [Comandos principales](#comandos-principales)
3. [Flags y opciones](#flags-y-opciones)
4. [Personas especializadas](#personas-especializadas)
5. [Integración MCP](#integración-mcp)
6. [Flujo de trabajo](#flujo-de-trabajo)
7. [Optimización de tokens](#optimización-de-tokens)

## Arquitectura de 11 capas

El Context Engineering System utiliza una arquitectura de 11 capas para gestionar el contexto de manera óptima:

1. **Capa 1: Instrucciones del sistema** - Rol e instrucciones para el asistente IA
2. **Capa 2: Objetivos** - Objetivos primarios y criterios de éxito
3. **Capa 3: Restricciones** - Limitaciones técnicas y requisitos
4. **Capa 4: Contexto histórico** - Decisiones pasadas y lecciones aprendidas
5. **Capa 5: Contexto externo** - Recursos y documentación de terceros
6. **Capa 6: Conocimiento del dominio** - Experiencia técnica para implementación
7. **Capa 7: Contexto del proyecto** - Estructura y arquitectura actual del proyecto
8. **Capa 8: Contexto de características** - Características relacionadas y dependencias
9. **Capa 9: Contexto de sesión** - Estado actual de la sesión de desarrollo
10. **Capa 10: Contexto inmediato** - Enfoque actual de implementación
11. **Capa 11: Consulta del usuario** - Solicitud y requisitos originales

Esta arquitectura permite una gestión precisa del contexto, optimizando tanto la comprensión como la generación de soluciones.

## Comandos principales

### @context-engineer.md

```
@context-engineer.md "[descripción de la característica]" [flags]
```

**Propósito**: Analizar requisitos de características y crear planes de implementación completos.

**Proceso**:
1. Análisis de características (proyecto, alcance, contexto)
2. Ingeniería de contexto (arquitectura de 11 capas)
3. Generación de PRP (Product Requirements Prompt)
4. Análisis de dependencias
5. Aplicación de plantillas
6. Validación del plan

**Salida**: 
- Crea archivo PRP en `workflow/planned/[nombre-característica].md`
- Actualiza `workflow/dependencies.md` con nuevas relaciones
- Genera informe de calidad de contexto

### @execute-context.md

```
@execute-context.md "[nombre-característica]" [flags]
```

**Propósito**: Implementar características planificadas con validación continua.

**Proceso**:
1. Carga y validación de contexto
2. Configuración previa a la implementación
3. Ejecución de implementación (4 fases)
4. Estrategia de aislamiento de características
5. Validación continua
6. Finalización de características

**Salida**:
- Mueve el archivo de `workflow/planned/` a `workflow/in-progress/active/`
- Al completar, mueve a `workflow/completed/successful/`
- Genera informe final de implementación

### @context-status.md

```
@context-status.md "[nombre-característica]" [flags]
```

**Propósito**: Monitorear la salud de características, dependencias y calidad del contexto.

**Proceso**:
1. Recopilación de estado
2. Informes de estado (específicos o generales)
3. Recomendaciones de optimización

**Salida**:
- Informe de estado de características
- Análisis de dependencias
- Recomendaciones accionables

## Flags y opciones

Los comandos admiten varios flags para personalizar su comportamiento:

### Flags universales

- `--plan`: Muestra plan de ejecución antes de ejecutar
- `--think`: Muestra proceso de razonamiento
- `--uc`: Modo UltraCompressed (70% reducción de tokens)
- `--compress`: Compresión estándar (50% reducción de tokens)
- `--cache`: Utiliza caché MCP

### Flags específicos de comandos

#### context-engineer
- `--analyze-deps`: Análisis profundo de dependencias
- `--tech-stack`: Análisis detallado de stack tecnológico
- `--security-focus`: Consideraciones mejoradas de seguridad

#### execute-context
- `--validate`: Modo de validación estricta
- `--test`: Incluye generación de pruebas
- `--benchmark`: Benchmarking de rendimiento

#### context-status
- `--detailed`: Informe de estado completo
- `--metrics`: Muestra métricas de rendimiento
- `--recommendations`: Incluye sugerencias de optimización

## Personas especializadas

El sistema incluye personas especializadas que se pueden activar con flags:

- `--persona-security`: Especialista en seguridad y autenticación
- `--persona-performance`: Especialista en optimización y rendimiento
- `--persona-frontend`: Especialista en interfaces de usuario y UX
- `--persona-backend`: Especialista en APIs y servicios
- `--persona-architect`: Especialista en arquitectura de sistemas
- `--persona-data`: Especialista en bases de datos y modelado
- `--persona-mobile`: Especialista en desarrollo móvil
- `--persona-deployment`: Especialista en DevOps y despliegue
- `--persona-testing`: Especialista en pruebas y QA

Las personas se activan automáticamente cuando el sistema detecta que son relevantes para la tarea, o manualmente mediante flags.

## Integración MCP

El sistema integra con Model Context Protocol (MCP) para capacidades avanzadas:

- `--mcp-context7`: Mejora la gestión de contexto con Context7
- `--mcp-sequential`: Habilita pensamiento secuencial para problemas complejos
- `--mcp-magic`: Activa capacidades avanzadas de generación de código
- `--mcp-puppeteer`: Permite automatización e interacción web

## Flujo de trabajo

El Context Engineering System implementa un flujo de trabajo dirigido por características:

1. **Planificación**: Crear planes detallados con `@context-engineer.md`
   - Los archivos se guardan en `workflow/planned/`
   - Incluye investigación, contexto y plan de implementación

2. **Implementación**: Ejecutar planes con `@execute-context.md`
   - Los archivos se MUEVEN a `workflow/in-progress/active/`
   - Incluye validación continua y puertas de calidad

3. **Finalización**: Completar características
   - Los archivos se MUEVEN a `workflow/completed/successful/`
   - Incluye documentación final y lecciones aprendidas

Los archivos NUNCA se duplican, solo se mueven entre directorios para mantener una estructura limpia.

## Optimización de tokens

El sistema incluye varias estrategias para optimización de tokens:

### Modo UltraCompressed (--uc)

Reduce el uso de tokens en un 70% mientras mantiene el significado semántico completo. Se activa automáticamente al 75% de uso de contexto o con el flag `--uc`.

### Compresión estándar (--compress)

Reduce el uso de tokens en un 50% con impacto mínimo en la claridad.

### Gestión de presupuesto de tokens

- Asignación dinámica basada en complejidad de características
- Estrategias de reducción inteligentes
- Monitoreo de rendimiento de tokens

### Caché MCP

Utiliza caché inteligente para reducir costos de tokens en solicitudes repetidas o similares.

---

Para más información, consulta la documentación específica:
- [Referencia de comandos](commands-reference.md)
- [Matriz de flags](flags-matrix.md)
- [Guía de métricas de tokens](token-metrics.md) 