# UI/UX Specifications - [NOMBRE_DEL_PROYECTO]

## 📊 Información del Documento

**Versión**: 1.0.0
**Fecha**: [Fecha actual]
**Design System**: [Nombre] v1.0
**Figma**: [Link a diseños si existe]
**Estado**: [Draft/Review/Approved]

## 🎨 Design System

### 🎨 Paleta de Colores

#### Colores Primarios
```typescript
export const Colors = {
  // Primary Brand Colors
  primary: '#007AFF',      // iOS Blue - Acciones principales
  primaryDark: '#0056CC',  // Hover/pressed states
  primaryLight: '#4DA6FF', // Lighter version para backgrounds
  
  // Secondary Colors  
  secondary: '#34C759',    // Verde éxito - Confirmaciones
  secondaryDark: '#248A3D',
  secondaryLight: '#68D285',
  
  // Accent Colors
  accent: '#FF9500',       // Naranja - Call to actions secundarios
  accentDark: '#CC7700',
  accentLight: '#FFB366',
  
  // Status Colors
  success: '#34C759',      // Verde - Estados de éxito
  warning: '#FFCC00',      // Amarillo - Advertencias
  error: '#FF3B30',        // Rojo - Errores
  info: '#007AFF',         // Azul - Información
  
  // Neutral Colors
  black: '#000000',        // Texto principal
  darkGray: '#1C1C1E',     // Texto secundario
  gray: '#8E8E93',         // Texto deshabilitado
  lightGray: '#C7C7CC',    // Bordes, divisores
  background: '#F2F2F7',   // Fondo principal iOS
  surface: '#FFFFFF',      // Fondos de componentes
  
  // Semantic Colors
  textPrimary: '#000000',     // Texto principal
  textSecondary: '#3C3C43',   // Texto secundario  
  textDisabled: '#8E8E93',    // Texto deshabilitado
  textInverse: '#FFFFFF',     // Texto sobre fondos oscuros
}
```

#### Uso de Colores
- **Primary**: Botones principales, links, elementos interactivos
- **Secondary**: Estados de éxito, confirmaciones
- **Accent**: CTAs secundarios, highlights
- **Status**: Feedback visual (success, warning, error, info)
- **Neutral**: Texto, fondos, estructuras

### 📝 Tipografía

#### Escalas de Texto
```typescript
export const Typography = {
  // Headers
  h1: {
    fontSize: 34,
    lineHeight: 41,
    fontWeight: 'bold',
    letterSpacing: 0.37,
  },
  h2: {
    fontSize: 28,
    lineHeight: 34,
    fontWeight: 'bold',
    letterSpacing: 0.36,
  },
  h3: {
    fontSize: 22,
    lineHeight: 28,
    fontWeight: 'semibold',
    letterSpacing: 0.35,
  },
  h4: {
    fontSize: 20,
    lineHeight: 25,
    fontWeight: 'semibold',
    letterSpacing: 0.38,
  },
  
  // Body Text
  body1: {
    fontSize: 17,
    lineHeight: 22,
    fontWeight: 'regular',
    letterSpacing: -0.41,
  },
  body2: {
    fontSize: 15,
    lineHeight: 20,
    fontWeight: 'regular',
    letterSpacing: -0.24,
  },
  
  // Small Text
  caption1: {
    fontSize: 12,
    lineHeight: 16,
    fontWeight: 'regular',
    letterSpacing: 0,
  },
  caption2: {
    fontSize: 11,
    lineHeight: 13,
    fontWeight: 'regular',
    letterSpacing: 0.07,
  },
  
  // Button Text
  button: {
    fontSize: 17,
    lineHeight: 22,
    fontWeight: 'semibold',
    letterSpacing: -0.41,
  },
  buttonSmall: {
    fontSize: 15,
    lineHeight: 20,
    fontWeight: 'semibold',
    letterSpacing: -0.24,
  },
}
```

#### Familias de Fuentes
- **iOS**: SF Pro Display/Text (System Font)
- **Android**: Roboto (System Font)
- **Fallback**: System default

### 📏 Espaciado y Layout

#### Sistema de Espaciado (8pt grid)
```typescript
export const Spacing = {
  xs: 4,    // 0.25rem - Espaciado mínimo
  sm: 8,    // 0.5rem  - Espaciado pequeño
  md: 16,   // 1rem    - Espaciado estándar
  lg: 24,   // 1.5rem  - Espaciado grande
  xl: 32,   // 2rem    - Espaciado extra grande
  xxl: 48,  // 3rem    - Espaciado máximo
  
  // Específicos
  screen: 16,     // Padding horizontal screens
  component: 16,  // Padding interno componentes
  section: 24,    // Separación entre secciones
}
```

#### Layout Containers
```typescript
export const Layout = {
  // Screen Containers
  screenPadding: 16,      // Padding horizontal global
  maxWidth: 428,          // Max width para tablets
  
  // Component Sizes
  buttonHeight: 50,       // Altura botones principales
  buttonHeightSmall: 36,  // Altura botones secundarios
  inputHeight: 50,        // Altura inputs
  headerHeight: 60,       // Altura headers
  tabBarHeight: 83,       // Altura tab bar (iOS safe area)
  
  // Border Radius
  borderRadiusSmall: 8,   // Radius pequeño
  borderRadius: 12,       // Radius estándar
  borderRadiusLarge: 16,  // Radius grande
  borderRadiusXL: 24,     // Radius extra grande
}
```

### 🔳 Componentes Base

#### Botones

##### Primary Button
- **Uso**: Acciones principales, CTAs críticos
- **Estilo**: Filled, background primary color
- **Estados**: Default, Pressed, Disabled
- **Altura**: 50px
- **Border Radius**: 12px
- **Typography**: button (17px, semibold)

```typescript
// Primary Button Styles
const primaryButton = {
  backgroundColor: Colors.primary,
  color: Colors.textInverse,
  height: Layout.buttonHeight,
  borderRadius: Layout.borderRadius,
  // Shadow/elevation
}
```

##### Secondary Button
- **Uso**: Acciones secundarias
- **Estilo**: Outline, border primary color  
- **Estados**: Default, Pressed, Disabled
- **Altura**: 50px
- **Typography**: button (17px, semibold)

##### Text Button
- **Uso**: Acciones terciarias, links
- **Estilo**: Solo texto, sin background
- **Color**: Primary color
- **Typography**: button (17px, semibold)

#### Inputs y Forms

##### Text Input
- **Altura**: 50px
- **Border**: 1px solid lightGray, radius 12px
- **Focus**: Border primary color, shadow subtle
- **Error**: Border error color
- **Placeholder**: textDisabled color
- **Typography**: body1 (17px)

```typescript
const textInput = {
  height: Layout.inputHeight,
  borderRadius: Layout.borderRadius,
  borderWidth: 1,
  borderColor: Colors.lightGray,
  paddingHorizontal: Spacing.md,
  fontSize: Typography.body1.fontSize,
}
```

##### Labels y Helpers
- **Label**: Typography h4 (20px, semibold), color textPrimary
- **Helper Text**: Typography caption1 (12px), color textSecondary
- **Error Text**: Typography caption1 (12px), color error

#### Cards y Containers

##### Card Base
- **Background**: surface color (white)
- **Border Radius**: 16px
- **Shadow**: Subtle elevation
- **Padding**: 16px
- **Margin**: 16px horizontal, 8px vertical

##### List Items
- **Altura mínima**: 60px
- **Padding**: 16px horizontal, 12px vertical
- **Separador**: 1px line, lightGray color
- **Hover/Press**: background lightGray (10% opacity)

### 🧭 Navegación

#### Tab Navigation (Bottom)
- **Altura**: 83px (incluye safe area iOS)
- **Background**: surface color
- **Border top**: 1px lightGray
- **Active tab**: primary color
- **Inactive tab**: gray color
- **Icons**: 24x24px
- **Labels**: caption1 typography

#### Stack Navigation (Headers)
- **Altura**: 60px + safe area
- **Background**: surface color
- **Title**: h3 typography, center aligned
- **Back button**: 24x24px icon, primary color
- **Action buttons**: 24x24px icons

#### Modal/Sheet
- **Background**: surface color
- **Border radius**: 24px top corners
- **Handle**: 36x4px rounded, gray color
- **Max height**: 90% screen height
- **Padding**: 16px

### 📱 Screen Layouts

#### Screen Structure Standard
```
┌─────────────────────────┐
│    Safe Area Top        │
├─────────────────────────┤
│    Header (60px)        │
├─────────────────────────┤
│                         │
│    Content Area         │
│    (padding 16px)       │
│                         │
├─────────────────────────┤
│   Tab Bar (83px)        │
├─────────────────────────┤
│   Safe Area Bottom      │
└─────────────────────────┘
```

#### Content Patterns
- **List screens**: Header + ScrollView + TabBar
- **Detail screens**: Header + ScrollView + FloatingActionButton
- **Form screens**: Header + KeyboardAvoidingView + Submit button

### 🎭 Estados de Componentes

#### Loading States
- **Skeleton**: Gray placeholder shapes
- **Spinner**: Activity indicator, primary color
- **Progress**: Progress bar, primary color
- **Button loading**: Spinner inside button, text hidden

#### Empty States
- **Illustration**: Simple vector graphic
- **Title**: h3 typography
- **Subtitle**: body2 typography, textSecondary color
- **Action button**: Primary button
- **Spacing**: 24px between elements

#### Error States
- **Color scheme**: Error color prominente
- **Icon**: Warning/error icon 24x24px
- **Message**: Clear, actionable text
- **Retry button**: Secondary button style

### 🎨 Iconografía

#### Tamaños Estándar
- **Small**: 16x16px (inline con texto)
- **Medium**: 24x24px (botones, navegación)
- **Large**: 32x32px (highlights, features)
- **XL**: 48x48px (empty states, headers)

#### Estilo de Iconos
- **Stroke width**: 2px para consistencia
- **Corner radius**: 2px para suavizar
- **Color**: Heredar del componente padre
- **Library**: Expo Vector Icons (Ionicons prioritario)

### 📐 Responsive Breakpoints

#### Device Categories
```typescript
export const Breakpoints = {
  // Phone
  phoneSmall: 320,  // iPhone SE 1st gen
  phone: 375,       // iPhone standard
  phoneLarge: 428,  // iPhone Pro Max
  
  // Tablet  
  tablet: 768,      // iPad portrait
  tabletLarge: 1024, // iPad landscape
}
```

#### Responsive Behavior
- **320-428px**: Single column, standard mobile patterns
- **768px+**: Two-column donde apropiado, larger text
- **1024px+**: Desktop-like layouts, optimized for large screens

### ♿ Accesibilidad

#### Consideraciones Generales
- **Contraste**: Mínimo 4.5:1 para texto normal, 3:1 para texto grande
- **Touch targets**: Mínimo 44x44px
- **Focus indicators**: Visible para navegación con teclado
- **Screen readers**: Semantic labels y hints apropiados

#### Implementation
```typescript
// Accessibility props example
<TouchableOpacity
  accessible={true}
  accessibilityLabel="Sign in to your account"
  accessibilityHint="Double tap to navigate to login screen"
  accessibilityRole="button"
>
```

### 🎬 Animaciones y Micro-interacciones

#### Timing y Easing
```typescript
export const Animations = {
  // Durations
  fast: 200,     // Quick feedback
  normal: 300,   // Standard transitions  
  slow: 500,     // Complex animations
  
  // Easing curves
  easeOut: 'ease-out',      // Entrances
  easeIn: 'ease-in',        // Exits
  easeInOut: 'ease-in-out', // State changes
}
```

#### Patrones de Animación
- **Screen transitions**: Slide horizontal 300ms ease-out
- **Modal present**: Slide up 300ms ease-out + scale fade
- **Button press**: Scale 0.95 + opacity 0.7, 100ms
- **Loading**: Fade in/out 200ms, rotate 360° 1000ms linear

### 🔧 Implementation Guidelines

#### Component Development
1. **Start with base styles** (colors, typography, spacing)
2. **Add component-specific styles**
3. **Implement responsive behavior**
4. **Add accessibility props**
5. **Implement animations**
6. **Test on multiple devices**

#### Code Organization
```
src/
├── design-system/
│   ├── colors.ts
│   ├── typography.ts  
│   ├── spacing.ts
│   ├── layout.ts
│   └── animations.ts
├── components/
│   ├── base/          # Buttons, Inputs, etc.
│   ├── navigation/    # Headers, TabBars
│   └── feedback/      # Loading, Empty states
```

#### Best Practices
- **Use design tokens**: Always reference design system values
- **Consistent spacing**: Stick to 8pt grid system
- **Performance**: Optimize images, minimize re-renders
- **Testing**: Test on real devices, different screen sizes
- **Documentation**: Document component APIs and usage

### 📱 Platform-Specific Considerations

#### iOS Guidelines
- **Safe Area**: Always respect safe area insets
- **Navigation**: Follow iOS navigation patterns
- **Typography**: Use SF Pro system font
- **Gestures**: Support swipe back navigation
- **Haptics**: Use appropriate haptic feedback

#### Android Guidelines  
- **Material Design**: Follow where appropriate
- **Navigation**: Handle hardware back button
- **Typography**: Use Roboto system font
- **Status bar**: Configure appropriately for theme
- **Permissions**: Follow Android permission model

---

**Design Review**: [Fecha próxima revisión]
**Figma Updated**: [Última actualización]
**Implementation Status**: [% completado]
