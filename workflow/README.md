# Directorio de Características

Este directorio gestiona el flujo de trabajo de desarrollo dirigido por características usando los principios de Ingeniería de Contexto.

## Estructura de Directorios

```
workflow/
├── planned/          # Características listas para implementar
├── in-progress/      # Características en desarrollo
│   ├── active/       # En desarrollo activo
│   └── paused/       # Pausadas temporalmente
├── completed/        # Características implementadas
│   ├── successful/   # Implementaciones exitosas
│   └── archived/     # Características obsoletas
├── templates/        # Plantillas de características por tipo
└── dependencies.md   # Mapeo de dependencias entre características
```

## Ciclo de vida de las características

### 1. Fase de planificación (`planned/`)
- Las características comienzan aquí después del comando `@context-engineer.md`
- Contiene el PRP (Product Requirements Prompt) completo
- Incluye investigación, contexto y plan de implementación

### 2. Fase de desarrollo (`in-progress/`)
- Las características se MUEVEN aquí durante el comando `@execute-context.md`
- Los archivos se mueven de `planned/` a `in-progress/active/`, nunca se duplican
- Contiene seguimiento de progreso y actualizaciones en tiempo real
- Incluye puntos de validación y puertas de calidad

### 3. Fase de finalización (`completed/`)
- Las características se MUEVEN aquí tras implementación exitosa
- Los archivos se mueven de `in-progress/active/` a `completed/successful/`
- Contiene documentación final y lecciones aprendidas
- Sirve como base de conocimiento para futuras características similares

## Manejo de archivos

El punto clave de este sistema de flujo de trabajo es que los archivos de características NUNCA se duplican:

1. `@context-engineer.md` CREA el archivo en `planned/`
2. `@execute-context.md` MUEVE el archivo de `planned/` a `in-progress/active/`
3. Al completarse, el archivo se MUEVE de `in-progress/active/` a `completed/successful/`

Este enfoque evita problemas de sincronización y garantiza que siempre haya una única fuente de verdad para cada característica.

## Uso de comandos

- `@context-engineer.md "[descripción de característica]"` - Crear nuevo plan de característica
- `@execute-context.md "[nombre-característica]"` - Implementar característica planificada
- `@context-status.md "[nombre-característica]"` - Verificar estado de característica

## Mejores Prácticas

1. **Una característica a la vez**: Enfócate en la implementación de una sola característica
2. **Aislamiento de contexto**: Cada característica tiene su propio contexto completo
3. **Conciencia de dependencias**: Verificar dependencias antes de comenzar
4. **Puertas de calidad**: Cada característica debe pasar validación antes de completarse
5. **Documentación**: Siempre actualiza el estado y las lecciones aprendidas 