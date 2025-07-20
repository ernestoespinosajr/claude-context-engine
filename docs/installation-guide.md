# Guía de Instalación

Esta guía explica cómo instalar el Context Engineering System en tu proyecto para utilizarlo con Claude Code CLI.

## Requisitos previos

- Claude Desktop o Claude Code CLI
- Git
- Bash 3.0+
- Permisos de escritura en el directorio de tu proyecto

## Instalación rápida

```bash
# Clonar el repositorio
git clone https://github.com/usuario/context-engineering-system.git

# Navegar al directorio
cd context-engineering-system

# Instalar en tu proyecto
./install.sh /ruta/a/tu-proyecto
```

## Proceso de instalación detallado

### 1. Clonar el repositorio

```bash
git clone https://github.com/usuario/context-engineering-system.git
cd context-engineering-system
```

### 2. Ejecutar el instalador

El script `install.sh` configura el Context Engineering System en tu proyecto:

```bash
./install.sh /ruta/a/tu-proyecto
```

Puedes usar una ruta relativa o absoluta:

```bash
# Ruta relativa (desde el directorio actual)
./install.sh ../mi-proyecto

# Ruta absoluta
./install.sh /Users/usuario/Proyectos/mi-proyecto

# Directorio actual
./install.sh .
```

### 3. Qué hace el instalador

El instalador:

1. **Crea la estructura de directorios** en tu proyecto:
   ```
   proyecto/
   ├── .claude/                 # Configuración para Claude Code CLI
   │   ├── commands/            # Comandos disponibles
   │   └── shared/              # Archivos compartidos de configuración
   └── workflow/                # Directorio de flujo de trabajo
       ├── planned/             # Características planificadas
       ├── in-progress/         # Características en desarrollo
       │   ├── active/          # En desarrollo activo
       │   └── paused/          # Pausadas temporalmente
       ├── completed/           # Características implementadas
       │   ├── successful/      # Implementaciones exitosas
       │   └── archived/        # Características obsoletas
       ├── templates/           # Plantillas de características
       └── dependencies.md      # Registro de dependencias
   ```

2. **Copia los archivos de comandos** para Claude Code CLI
3. **Instala las plantillas de características** para diferentes tecnologías
4. **Crea archivos README** con instrucciones de uso
5. **Configura el archivo de dependencias** para el seguimiento de características

### 4. Verificación de la instalación

Después de la instalación, verifica que se hayan creado los directorios y archivos necesarios:

```bash
# Verificar estructura de directorios
ls -la /ruta/a/tu-proyecto/.claude/
ls -la /ruta/a/tu-proyecto/workflow/

# Verificar que los comandos estén disponibles
ls -la /ruta/a/tu-proyecto/.claude/commands/
```

## Uso después de la instalación

Una vez instalado, puedes comenzar a usar los comandos en Claude Desktop:

```
@context-engineer.md "Implementar autenticación de usuarios"
```

## Solución de problemas

### Permisos insuficientes

Si encuentras errores de permisos:

```bash
chmod +x install.sh
sudo ./install.sh /ruta/a/tu-proyecto
```

### Directorios ya existentes

El instalador no sobrescribirá archivos existentes a menos que se le indique. Si necesitas reinstalar:

```bash
rm -rf /ruta/a/tu-proyecto/.claude/commands /ruta/a/tu-proyecto/workflow
./install.sh /ruta/a/tu-proyecto
```

### Comandos no encontrados en Claude

Si Claude no encuentra los comandos:
1. Asegúrate de que los archivos estén en `.claude/commands/`
2. Verifica que los nombres de archivo terminen en `.md`
3. Reinicia Claude Desktop

## Instalación manual

Si prefieres instalar manualmente:

1. Crea los directorios necesarios:
   ```bash
   mkdir -p /ruta/a/tu-proyecto/.claude/commands/shared
   mkdir -p /ruta/a/tu-proyecto/workflow/{planned,in-progress/{active,paused},completed/{successful,archived},templates}
   ```

2. Copia los archivos de comandos:
   ```bash
   cp -r commands/* /ruta/a/tu-proyecto/.claude/commands/
   cp -r .claude/shared/* /ruta/a/tu-proyecto/.claude/shared/
   ```

3. Copia el archivo CLAUDE.md:
   ```bash
   cp CLAUDE.md /ruta/a/tu-proyecto/.claude/
   ```

4. Copia las plantillas:
   ```bash
   cp -r workflow/templates/* /ruta/a/tu-proyecto/workflow/templates/
   ```

## Desinstalación

Para desinstalar el Context Engineering System:

```bash
rm -rf /ruta/a/tu-proyecto/.claude/commands
rm -rf /ruta/a/tu-proyecto/.claude/shared
rm -f /ruta/a/tu-proyecto/.claude/CLAUDE.md
rm -rf /ruta/a/tu-proyecto/workflow
```

Esto eliminará todos los archivos instalados por el sistema. 