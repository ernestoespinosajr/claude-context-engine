# Feature Template: React Native Project Initialization

## Applicability
- **Use when**: Starting a new React Native project
- **Language**: JavaScript/TypeScript
- **Framework**: React Native with Expo or React Native CLI
- **Platform**: iOS/Android mobile applications

## Context Engineering Layers

### Layer 1: System Instructions
```
You are a React Native development specialist.
- Follow React Native best practices and conventions
- Use TypeScript for type safety and better development experience
- Implement proper navigation patterns using React Navigation
- Focus on cross-platform compatibility (iOS/Android)
- Ensure performance optimization from the start
- Follow Expo or React Native CLI patterns based on project needs
```

### Layer 2: Goals
```
Feature: React Native Project Initialization
Primary Objective: Create a fully functional React Native project foundation
Success Criteria:
- Project runs on both iOS and Android simulators
- TypeScript configuration is working properly
- Navigation system is set up and functional
- State management is configured
- Development environment is optimized
Quality Targets:
- Build time: <30 seconds for development
- App startup time: <2 seconds
- Zero TypeScript errors
- ESLint and Prettier configured
```

### Layer 3: Constraints
```
Technical Constraints:
- React Native version: Latest stable (0.72+)
- Node.js version: 18+ or 20+
- TypeScript: 5.0+
- Target platforms: iOS 13+ and Android API 23+
- Build tools: Metro bundler, Flipper for debugging
- Testing: Jest + React Native Testing Library
```

### Layer 4: Historical Context
```
React Native Project Patterns:
- Expo vs React Native CLI decision factors
- Navigation patterns evolution (v5 to v6)
- State management trends (Redux → Zustand/Context)
- TypeScript adoption best practices
- Performance optimization lessons learned
```

### Layer 5: External Context
```
React Native Documentation:
- Official React Native docs (reactnative.dev)
- Expo documentation (docs.expo.dev)
- React Navigation docs (reactnavigation.org)
- TypeScript handbook (typescriptlang.org)

Essential Libraries:
- @react-navigation/native: Navigation system
- @react-navigation/native-stack: Stack navigation
- react-native-screens: Native screen optimization
- react-native-safe-area-context: Safe area handling
```

### Layer 6: Domain Knowledge
```
React Native Best Practices:
- Component architecture patterns
- State management strategies
- Navigation best practices
- Performance optimization techniques
- Testing methodologies
- Code organization and structure
```

## Implementation Blueprint

### Phase 1: Project Setup & Configuration
**Objective**: Create and configure the React Native project foundation

**Tasks**:
1. **Initialize React Native Project**
   ```bash
   # Option A: Expo (recommended for beginners)
   npx create-expo-app MyApp --template blank-typescript
   
   # Option B: React Native CLI (for advanced users)
   npx react-native init MyApp --template react-native-template-typescript
   ```

2. **Configure Development Environment**
   ```bash
   # Install essential dependencies
   npm install @react-navigation/native @react-navigation/native-stack
   npm install react-native-screens react-native-safe-area-context
   
   # Install development dependencies
   npm install -D @types/react @types/react-native
   npm install -D eslint prettier @typescript-eslint/parser
   ```

3. **Set up Project Structure**
   ```
   src/
   ├── components/     # Reusable UI components
   ├── screens/        # Screen components
   ├── navigation/     # Navigation configuration
   ├── services/       # API and external services
   ├── hooks/          # Custom React hooks
   ├── utils/          # Utility functions
   ├── types/          # TypeScript type definitions
   ├── constants/      # App constants
   └── assets/         # Images, fonts, etc.
   ```

**Validation Gates**:
- [ ] Project builds without errors
- [ ] TypeScript configuration is valid
- [ ] ESLint rules are configured and passing
- [ ] Directory structure follows conventions

### Phase 2: Core Application Structure
**Objective**: Set up the main application architecture

**Tasks**:
1. **Create Main App Component**
   ```typescript
   // App.tsx
   import React from 'react';
   import { NavigationContainer } from '@react-navigation/native';
   import { createNativeStackNavigator } from '@react-navigation/native-stack';
   import { SafeAreaProvider } from 'react-native-safe-area-context';
   import HomeScreen from './src/screens/HomeScreen';
   
   const Stack = createNativeStackNavigator();
   
   export default function App() {
     return (
       <SafeAreaProvider>
         <NavigationContainer>
           <Stack.Navigator>
             <Stack.Screen name="Home" component={HomeScreen} />
           </Stack.Navigator>
         </NavigationContainer>
       </SafeAreaProvider>
     );
   }
   ```

2. **Create Basic Screen Components**
   ```typescript
   // src/screens/HomeScreen.tsx
   import React from 'react';
   import { View, Text, StyleSheet } from 'react-native';
   
   const HomeScreen = () => {
     return (
       <View style={styles.container}>
         <Text style={styles.title}>Welcome to React Native!</Text>
       </View>
     );
   };
   
   const styles = StyleSheet.create({
     container: {
       flex: 1,
       justifyContent: 'center',
       alignItems: 'center',
       backgroundColor: '#f5f5f5',
     },
     title: {
       fontSize: 20,
       fontWeight: 'bold',
       color: '#333',
     },
   });
   
   export default HomeScreen;
   ```

3. **Set up Navigation Types**
   ```typescript
   // src/types/navigation.ts
   export type RootStackParamList = {
     Home: undefined;
     // Add more screens as needed
   };
   ```

**Validation Gates**:
- [ ] App renders without errors
- [ ] Navigation is working properly
- [ ] TypeScript types are properly defined
- [ ] Safe area handling is working

### Phase 3: Development Tools & Configuration
**Objective**: Configure development tools and build system

**Tasks**:
1. **Configure TypeScript**
   ```json
   // tsconfig.json
   {
     "extends": "@tsconfig/react-native/tsconfig.json",
     "compilerOptions": {
       "baseUrl": ".",
       "paths": {
         "@/*": ["src/*"]
       }
     }
   }
   ```

2. **Set up ESLint and Prettier**
   ```json
   // .eslintrc.js
   module.exports = {
     extends: [
       '@react-native-community',
       'plugin:@typescript-eslint/recommended',
     ],
     parser: '@typescript-eslint/parser',
     plugins: ['@typescript-eslint'],
     rules: {
       '@typescript-eslint/no-unused-vars': 'error',
       'react-hooks/exhaustive-deps': 'warn',
     },
   };
   ```

3. **Configure Package Scripts**
   ```json
   // package.json scripts
   {
     "scripts": {
       "start": "expo start",
       "android": "expo start --android",
       "ios": "expo start --ios",
       "web": "expo start --web",
       "test": "jest",
       "lint": "eslint src --ext .ts,.tsx",
       "lint:fix": "eslint src --ext .ts,.tsx --fix",
       "type-check": "tsc --noEmit"
     }
   }
   ```

**Validation Gates**:
- [ ] TypeScript compilation is working
- [ ] ESLint rules are configured and passing
- [ ] Prettier formatting is consistent
- [ ] All npm scripts are functional

### Phase 4: Testing & Quality Assurance
**Objective**: Set up testing framework and quality assurance

**Tasks**:
1. **Configure Jest and Testing Library**
   ```bash
   npm install -D jest @testing-library/react-native
   ```

2. **Create Test Setup**
   ```typescript
   // src/__tests__/App.test.tsx
   import React from 'react';
   import { render } from '@testing-library/react-native';
   import App from '../App';
   
   describe('App', () => {
     it('renders correctly', () => {
       const { getByText } = render(<App />);
       expect(getByText('Welcome to React Native!')).toBeTruthy();
     });
   });
   ```

3. **Set up Pre-commit Hooks**
   ```bash
   npm install -D husky lint-staged
   npx husky install
   ```

**Validation Gates**:
- [ ] Tests are running and passing
- [ ] Code coverage is set up
- [ ] Pre-commit hooks are working
- [ ] Quality gates are enforced

## Common Patterns

### Component Structure
```typescript
// src/components/Button.tsx
import React from 'react';
import { TouchableOpacity, Text, StyleSheet, ViewStyle } from 'react-native';

interface ButtonProps {
  title: string;
  onPress: () => void;
  style?: ViewStyle;
  disabled?: boolean;
}

const Button: React.FC<ButtonProps> = ({ title, onPress, style, disabled }) => {
  return (
    <TouchableOpacity
      style={[styles.button, style, disabled && styles.disabled]}
      onPress={onPress}
      disabled={disabled}
    >
      <Text style={styles.text}>{title}</Text>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  button: {
    backgroundColor: '#007AFF',
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 8,
  },
  disabled: {
    backgroundColor: '#ccc',
  },
  text: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
    textAlign: 'center',
  },
});

export default Button;
```

### Navigation Pattern
```typescript
// src/navigation/AppNavigator.tsx
import React from 'react';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import HomeScreen from '../screens/HomeScreen';
import { RootStackParamList } from '../types/navigation';

const Stack = createNativeStackNavigator<RootStackParamList>();

const AppNavigator = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerStyle: { backgroundColor: '#007AFF' },
        headerTintColor: '#fff',
        headerTitleStyle: { fontWeight: 'bold' },
      }}
    >
      <Stack.Screen name="Home" component={HomeScreen} />
    </Stack.Navigator>
  );
};

export default AppNavigator;
```

### Custom Hook Pattern
```typescript
// src/hooks/useAsyncStorage.ts
import { useEffect, useState } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

export const useAsyncStorage = <T>(key: string, defaultValue: T) => {
  const [value, setValue] = useState<T>(defaultValue);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadValue = async () => {
      try {
        const stored = await AsyncStorage.getItem(key);
        if (stored) {
          setValue(JSON.parse(stored));
        }
      } catch (error) {
        console.error('Error loading from AsyncStorage:', error);
      } finally {
        setLoading(false);
      }
    };

    loadValue();
  }, [key]);

  const updateValue = async (newValue: T) => {
    try {
      setValue(newValue);
      await AsyncStorage.setItem(key, JSON.stringify(newValue));
    } catch (error) {
      console.error('Error saving to AsyncStorage:', error);
    }
  };

  return { value, updateValue, loading };
};
```

## Gotchas & Best Practices

### Performance Considerations
- **FlatList for Large Lists**: Use FlatList instead of ScrollView for large datasets
- **Image Optimization**: Use proper image resolutions and formats
- **Bundle Size**: Monitor and optimize bundle size regularly
- **Memory Management**: Avoid memory leaks with proper cleanup

### Platform Differences
- **iOS vs Android**: Test on both platforms regularly
- **Safe Areas**: Use SafeAreaProvider for proper screen boundaries
- **Navigation**: Consider platform-specific navigation patterns
- **Permissions**: Handle platform-specific permission requests

### Development Workflow
- **Hot Reload**: Use fast refresh for rapid development
- **Debugging**: Use Flipper or React Native Debugger
- **Testing**: Test on real devices, not just simulators
- **Performance**: Profile app performance regularly

### Common Pitfalls
- **Absolute Imports**: Configure path mapping for cleaner imports
- **State Management**: Don't over-engineer state management
- **Navigation**: Avoid deep navigation stacks
- **Styling**: Use consistent styling patterns

## Quality Gates

### Level 1: Syntax & Structure
- [ ] TypeScript compiles without errors
- [ ] ESLint rules pass
- [ ] Prettier formatting is consistent
- [ ] Project structure follows conventions

### Level 2: Integration
- [ ] App builds for both iOS and Android
- [ ] Navigation works properly
- [ ] All dependencies are compatible
- [ ] No runtime errors

### Level 3: Functional
- [ ] Core app functionality works
- [ ] Navigation between screens works
- [ ] State management is functional
- [ ] All components render correctly

### Level 4: Performance & Quality
- [ ] App starts up quickly (<2 seconds)
- [ ] Smooth animations and transitions
- [ ] Memory usage is optimal
- [ ] Test coverage >80%

## Success Indicators
- [ ] Project builds and runs on both platforms
- [ ] TypeScript configuration is working
- [ ] Navigation system is functional
- [ ] Development tools are configured
- [ ] Testing framework is set up
- [ ] Code quality tools are working
- [ ] Performance is optimized
- [ ] Documentation is complete 