# 🧠 Claude Self-Improvement Documentation - [NOMBRE_DEL_PROYECTO]

*Auto-documentation of patterns, learnings, and best practices discovered during development*

## 📊 Document Information

**Created**: [Fecha inicial]
**Last Updated**: [Fecha actual]
**Total Entries**: [Número]
**Project**: [Nombre del proyecto]

---

## 🎯 Purpose and Guidelines

This document automatically captures:
- **Technical patterns** discovered and validated
- **Code solutions** that work well and should be reused
- **Mistakes avoided** and how they were corrected
- **Dependencies evaluation** and recommendations
- **Performance insights** and optimizations
- **Best practices** that emerge from real implementation

**Update Trigger**: This document is updated automatically after each task completion via `/complete-task` command.

---

## 📚 Technical Patterns Library

### 🧩 React Native Patterns

#### [Date] - Custom Hook for Form Validation
**Context**: Discovered during LoginScreen implementation
**Pattern Name**: `useFormValidation`
**Use Case**: Reusable form validation with real-time feedback

**Implementation**:
```typescript
const useFormValidation = (schema: ValidationSchema) => {
  const [values, setValues] = useState({});
  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});

  const validate = useCallback((field?: string) => {
    // Validation logic
  }, [schema]);

  return { values, errors, touched, validate, setValue };
};
```

**Benefits**:
- Reduces code duplication across forms
- Consistent validation behavior
- Real-time feedback without performance issues

**Reuse Occasions**: LoginScreen, RegisterScreen, ProfileEdit, SettingsForm

---

#### [Date] - Screen Wrapper Pattern
**Context**: Discovered during navigation setup
**Pattern Name**: `ScreenWrapper`
**Use Case**: Consistent screen layout with safe area, header, and loading states

**Implementation**:
```typescript
interface ScreenWrapperProps {
  children: React.ReactNode;
  title?: string;
  showBack?: boolean;
  loading?: boolean;
  error?: string;
}

const ScreenWrapper: React.FC<ScreenWrapperProps> = ({
  children, title, showBack, loading, error
}) => {
  return (
    <SafeAreaView style={styles.container}>
      {title && <Header title={title} showBack={showBack} />}
      {loading && <LoadingOverlay />}
      {error && <ErrorBanner message={error} />}
      <ScrollView style={styles.content}>
        {children}
      </ScrollView>
    </SafeAreaView>
  );
};
```

**Benefits**:
- Consistent screen structure
- Automatic safe area handling
- Built-in loading and error states
- Reduces boilerplate per screen

**Usage Count**: Used in 12+ screens

---

### 🎨 UI/UX Patterns

#### [Date] - Loading State Pattern
**Context**: Discovered during API integration
**Pattern Name**: `SmartLoadingStates`
**Use Case**: Different loading indicators based on context

**Implementation Strategy**:
- **Initial load**: Full-screen skeleton
- **Refresh**: Pull-to-refresh indicator
- **Pagination**: Bottom loading spinner
- **Button actions**: In-button spinner with disabled state

**Code Example**:
```typescript
const LoadingState = ({ type, children }) => {
  switch(type) {
    case 'initial': return <SkeletonLoader />;
    case 'refresh': return <RefreshControl />;
    case 'pagination': return <PaginationSpinner />;
    case 'button': return <ButtonSpinner />;
    default: return children;
  }
};
```

**Impact**: 40% improvement in perceived performance

---

### 📊 State Management Patterns

#### [Date] - Zustand Store Pattern
**Context**: Discovered during authentication implementation
**Pattern Name**: `AuthStorePattern`
**Use Case**: Persistent authentication state with automatic token refresh

**Implementation**:
```typescript
interface AuthState {
  user: User | null;
  token: string | null;
  isAuthenticated: boolean;
  login: (credentials: Credentials) => Promise<void>;
  logout: () => void;
  refreshToken: () => Promise<void>;
}

const useAuthStore = create<AuthState>()(
  persist(
    (set, get) => ({
      user: null,
      token: null,
      isAuthenticated: false,
      login: async (credentials) => {
        // Implementation
      },
      logout: () => {
        set({ user: null, token: null, isAuthenticated: false });
      },
    }),
    {
      name: 'auth-storage',
      storage: createJSONStorage(() => AsyncStorage),
    }
  )
);
```

**Benefits**:
- Automatic persistence
- Type safety
- Simple API
- Performance optimized

**Lessons**: Prefer Zustand over Context API for complex state

---

## ❌ Mistakes Avoided and Solutions

### [Date] - Navigation Type Safety Issue
**Mistake**: Using untyped navigation without proper type checking
**Problem**: Runtime errors when navigating with wrong parameters
**Impact**: App crashes during navigation

**Solution Implemented**:
```typescript
// Define navigation types
type RootStackParamList = {
  Home: undefined;
  Profile: { userId: string };
  Settings: undefined;
};

// Use typed navigation
const navigation = useNavigation<NavigationProp<RootStackParamList>>();

// Type-safe navigation
navigation.navigate('Profile', { userId: '123' });
```

**Prevention Rule**: Always define navigation types at project start
**Saved Time**: ~2 hours of debugging per navigation implementation

---

### [Date] - AsyncStorage JSON Parse Error
**Mistake**: Not handling AsyncStorage parsing errors
**Problem**: App crash when stored data is corrupted
**Context**: User settings persistence

**Solution Implemented**:
```typescript
const getStoredData = async (key: string, defaultValue: any) => {
  try {
    const stored = await AsyncStorage.getItem(key);
    return stored ? JSON.parse(stored) : defaultValue;
  } catch (error) {
    console.warn(`Failed to parse stored data for ${key}:`, error);
    await AsyncStorage.removeItem(key); // Clear corrupted data
    return defaultValue;
  }
};
```

**Prevention Rule**: Always wrap AsyncStorage operations in try-catch
**Impact**: Eliminated 100% of storage-related crashes

---

### [Date] - Memory Leak in useEffect
**Mistake**: Not cleaning up subscriptions in useEffect
**Problem**: Memory leaks and warnings in development
**Context**: Real-time notifications listener

**Solution Implemented**:
```typescript
useEffect(() => {
  const subscription = notificationService.onReceive(handleNotification);
  
  return () => {
    subscription.unsubscribe(); // Always cleanup
  };
}, []);
```

**Prevention Rule**: Every subscription must have cleanup
**Performance Impact**: 50% reduction in memory usage

---

## 🔧 Dependencies Evaluation

### Recommended Dependencies

#### Expo Router - ⭐⭐⭐⭐⭐
**Version**: v3.x
**Use Case**: File-based navigation
**Pros**: 
- Easy to use and understand
- Great TypeScript support
- File-based routing like Next.js
- Built-in deep linking
**Cons**: 
- Learning curve from React Navigation
- Some advanced navigation patterns harder to implement
**Recommendation**: **Use for all new projects**
**Performance**: Excellent
**Documentation**: Excellent

---

#### Zustand - ⭐⭐⭐⭐⭐
**Version**: 4.x
**Use Case**: State management
**Pros**:
- Minimal boilerplate
- Excellent TypeScript support
- Great performance
- Easy to test
**Cons**:
- Less ecosystem than Redux
- Learning curve for complex state
**Recommendation**: **Use instead of Context API or Redux**
**Performance**: Excellent - 30% faster than Context API
**Bundle Size**: Very small (~2KB)

---

#### React Native Reanimated - ⭐⭐⭐⭐⭐
**Version**: 3.18.x
**Use Case**: Animations and gestures
**Pros**:
- 60fps animations on UI thread
- Powerful gesture handling
- Great API design
**Cons**:
- Setup complexity
- Learning curve
- iOS/Android differences
**Recommendation**: **Essential for smooth animations**
**Performance**: Excellent
**Setup Time**: ~1 hour initial setup

---

#### TanStack Query - ⭐⭐⭐⭐⭐
**Version**: v5.x
**Use Case**: Server state management
**Pros**:
- Automatic caching
- Background refetching
- Optimistic updates
- Great dev tools
**Cons**:
- Learning curve
- Bundle size increase
**Recommendation**: **Use for any app with server data**
**Performance**: Excellent
**Development Speed**: 50% faster API integration

---

### Dependencies to Avoid

#### React Native Elements - ⭐⭐⭐☆☆
**Issue**: Heavy bundle size, outdated design patterns
**Alternative**: Build custom components with design system
**Reason**: Better performance and customization control

#### Moment.js - ⭐⭐☆☆☆
**Issue**: Large bundle size (67KB)
**Alternative**: date-fns (smaller, tree-shakeable)
**Bundle Impact**: 80% size reduction

---

## 🚀 Performance Insights

### [Date] - Image Optimization Discovery
**Context**: ProductCard component performance
**Issue**: Slow image loading causing UI lag
**Solution**: 
```typescript
import { Image } from 'expo-image';

// Use expo-image instead of React Native Image
<Image
  source={{ uri: imageUrl }}
  placeholder={{ blurhash: 'L6Pj0^jE.AyE_3t7t7R**0o#DgR4' }}
  contentFit="cover"
  transition={200}
/>
```

**Performance Impact**: 
- 60% faster image loading
- Smooth placeholder transitions
- Better memory management
- Automatic caching

**Recommendation**: Always use expo-image for network images

---

### [Date] - FlatList Optimization
**Context**: Large data lists in HomeScreen
**Issue**: Scroll performance degradation with 100+ items
**Solution**:
```typescript
<FlatList
  data={items}
  renderItem={renderItem}
  getItemLayout={(data, index) => ({
    length: ITEM_HEIGHT,
    offset: ITEM_HEIGHT * index,
    index,
  })}
  removeClippedSubviews={true}
  maxToRenderPerBatch={10}
  windowSize={10}
  initialNumToRender={10}
/>
```

**Performance Impact**:
- 90% reduction in scroll lag
- 50% less memory usage
- Smooth 60fps scrolling

**Rule**: Always optimize FlatList for lists >20 items

---

### [Date] - Bundle Size Optimization
**Context**: App bundle size was 45MB
**Actions Taken**:
1. Analyzed bundle with `expo-bundle-analyzer`
2. Removed unused dependencies
3. Optimized images and assets
4. Enabled Hermes engine

**Results**:
- Bundle size: 45MB → 28MB (38% reduction)
- Cold start time: 3.2s → 2.1s (34% improvement)
- Memory usage: 120MB → 85MB (29% reduction)

**Key Learnings**:
- Image optimization has biggest impact
- Tree-shaking doesn't work for all libraries
- Hermes significantly improves performance

---

## 🎯 Best Practices Emerged

### Code Organization
1. **Feature-based folder structure** works better than type-based
2. **Co-locate related files** (component, styles, types, tests)
3. **Use barrel exports** for cleaner imports
4. **Separate business logic** from UI components

### Component Patterns
1. **Composition over configuration** for flexible components
2. **Always handle loading and error states** in data components
3. **Use TypeScript interfaces** for all component props
4. **Implement accessibility props** by default

### Performance Rules
1. **Memoize expensive computations** with useMemo
2. **Use useCallback** for functions passed to child components
3. **Optimize images** before including in app
4. **Lazy load** non-critical screens

### Error Handling
1. **Use Error Boundaries** for graceful fallbacks
2. **Always provide user-friendly error messages**
3. **Log errors** for debugging but don't expose internals
4. **Implement retry mechanisms** for network requests

---

## 📊 Metrics and Improvements

### Development Velocity
- **Week 1**: 2 screens completed
- **Week 2**: 4 screens completed (pattern reuse)
- **Week 3**: 6 screens completed (component library mature)

**Improvement**: 200% velocity increase through pattern reuse

### Code Quality Metrics
- **TypeScript coverage**: 98%
- **Component reuse**: 85% of UI uses shared components
- **Performance**: All screens load <2 seconds
- **Accessibility**: 95% VoiceOver/TalkBack compatible

### User Experience
- **App launch time**: <2 seconds
- **Screen transitions**: 60fps animations
- **Error handling**: 100% of error states designed
- **Loading states**: All data operations have feedback

---

## 🔄 Recurring Patterns to Watch

### Good Patterns (Keep Using)
- ✅ Custom hooks for reusable logic
- ✅ Composition pattern for flexible components
- ✅ Type-safe navigation
- ✅ Consistent error handling
- ✅ Performance-first approach

### Anti-Patterns (Avoid)
- ❌ Inline styles in components
- ❌ Unhandled promise rejections
- ❌ Direct state mutations
- ❌ Missing key props in lists
- ❌ Untyped external data

### Emerging Patterns (Experiment)
- 🧪 Server components pattern (React 18)
- 🧪 Suspense for data fetching
- 🧪 Concurrent features
- 🧪 Advanced gesture recognition

---

## 📝 Development Guidelines Update

Based on learnings, these guidelines should be followed:

### Setup Phase
1. Always start with TypeScript strict mode
2. Configure ESLint + Prettier immediately  
3. Set up error boundaries early
4. Create design system first

### Development Phase
1. Write types before implementation
2. Handle loading/error states immediately
3. Test on real devices frequently
4. Optimize performance proactively

### Quality Assurance
1. Test accessibility with screen readers
2. Verify performance on low-end devices
3. Test offline scenarios
4. Validate error scenarios

---

**Next Documentation Review**: [Date + 1 week]
**Pattern Usage Analysis**: [Quarterly review]
**Performance Metrics Update**: [Monthly review]
