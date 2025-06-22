# 📋 CLAUDE TASKS - [NOMBRE_DEL_PROYECTO]

*Generated from PRD.md on [Fecha]*
*Last Updated: [Fecha y Hora]*

## 📊 Project Overview

**Project**: [Nombre del proyecto]
**Current Phase**: Phase 1 - Frontend Development (Dummy Data Only)
**Total Tasks**: [Número] 
**Completed**: [Número] ([Porcentaje]%)
**In Progress**: [Número]
**Blocked**: [Número]

## 🏁 CURRENT SPRINT

### 🔄 IN PROGRESS
*[Tasks currently being worked on]*

#### [Task Name] - [Priority] - Phase [1/2]
**Status**: IN PROGRESS  
**Assigned**: [Date started]
**Progress**: [Percentage]% - [Current subtask being worked on]
**Estimated Completion**: [Date]
**Last Update**: [Date and time]

**Completed Subtasks**:
- [✅] Subtask 1: [Description] - [Completion date]
- [✅] Subtask 2: [Description] - [Completion date]

**Current Subtask**:
- [🔄] Subtask 3: [Description] - [Progress notes]

**Next Subtasks**:
- [ ] Subtask 4: [Description]
- [ ] Subtask 5: [Description]

**Files Modified**: [List of files]
**Blockers**: [Any current issues]

---

## 📋 READY TO START - PHASE 1 (Frontend Only)

### 🏗️ SETUP TASKS

#### 📦 Project Base Setup - CRITICAL - Phase 1
**Description**: Initialize and configure the React Native/Expo project
**Estimated Effort**: Medium (4-6 hours)
**Dependencies**: None
**Priority**: CRITICAL

**Acceptance Criteria**:
- [ ] Expo project initialized with TypeScript
- [ ] Package.json with all required dependencies
- [ ] Folder structure created (src/, assets/, etc.)
- [ ] ESLint and Prettier configured
- [ ] Git repository initialized with .gitignore

**Subtasks**:
- [ ] Initialize Expo project with TypeScript template
- [ ] Install core dependencies (navigation, state management)
- [ ] Create folder structure
- [ ] Configure development tools
- [ ] Test development server

#### 🎨 Design System Setup - HIGH - Phase 1
**Description**: Implement base design system with colors, typography, and spacing
**Estimated Effort**: Medium (4-6 hours)
**Dependencies**: Project Base Setup
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] Colors.ts with complete color palette
- [ ] Typography.ts with text styles
- [ ] Spacing.ts with layout constants
- [ ] Base component library started
- [ ] Theme provider implemented

### 🧭 NAVIGATION TASKS

#### 🗺️ Navigation Setup - HIGH - Phase 1
**Description**: Configure Expo Router with main navigation structure
**Estimated Effort**: Medium (3-4 hours)
**Dependencies**: Project Base Setup
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] Expo Router configured
- [ ] Tab navigation structure
- [ ] Stack navigation for detail screens
- [ ] Navigation types defined
- [ ] Basic screens created with placeholders

#### 📱 Screen Structure - MEDIUM - Phase 1
**Description**: Create base screen components and layouts
**Estimated Effort**: Small (2-3 hours)
**Dependencies**: Navigation Setup, Design System Setup
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Screen wrapper component
- [ ] Header component with navigation
- [ ] Safe area handling
- [ ] Loading and error state components
- [ ] Responsive layout system

### 🔐 AUTHENTICATION UI

#### 🚪 Login Screen - HIGH - Phase 1
**Description**: Create login screen with form validation (UI only, dummy auth)
**Estimated Effort**: Medium (4-5 hours)
**Dependencies**: Navigation Setup, Design System Setup
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] Login form with email/password inputs
- [ ] Form validation (client-side)
- [ ] Error states and messaging
- [ ] Loading states
- [ ] Navigation to register/forgot password
- [ ] Dummy authentication working

**Mock Data**:
```typescript
const DUMMY_USERS = [
  { email: 'user@example.com', password: 'password123' },
  { email: 'admin@example.com', password: 'admin123' }
];
```

#### 📝 Register Screen - HIGH - Phase 1
**Description**: Create registration screen with form validation
**Estimated Effort**: Medium (4-5 hours)
**Dependencies**: Login Screen
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] Registration form (email, password, confirm password)
- [ ] Form validation with real-time feedback
- [ ] Terms acceptance checkbox
- [ ] Success flow to login
- [ ] Error handling
- [ ] Dummy registration working

#### 🔐 Forgot Password Screen - MEDIUM - Phase 1
**Description**: Create password recovery screen
**Estimated Effort**: Small (2-3 hours)
**Dependencies**: Login Screen
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Email input form
- [ ] Validation and submission
- [ ] Success message
- [ ] Navigation back to login
- [ ] Mock email sending feedback

### 🏠 DASHBOARD/HOME

#### 🏠 Home Screen - HIGH - Phase 1
**Description**: Main dashboard with summary information
**Estimated Effort**: Large (6-8 hours)
**Dependencies**: Authentication UI, Navigation Setup
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] Welcome header with user name
- [ ] Quick action buttons/cards
- [ ] Recent activity feed (dummy data)
- [ ] Pull-to-refresh functionality
- [ ] Navigation to main features
- [ ] Empty states handled

**Mock Data**:
```typescript
const DUMMY_HOME_DATA = {
  user: { name: 'John Doe', avatar: null },
  recentActivity: [...],
  quickActions: [...],
  notifications: [...]
};
```

#### 🔍 Search Functionality - MEDIUM - Phase 1
**Description**: Global search with filtering and results
**Estimated Effort**: Medium (4-5 hours)
**Dependencies**: Home Screen
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Search input component
- [ ] Real-time search (debounced)
- [ ] Results categorization
- [ ] Empty search state
- [ ] Search history (local storage)
- [ ] Dummy search data

### 🧩 CORE COMPONENTS

#### 🎛️ Base UI Components - HIGH - Phase 1
**Description**: Essential reusable UI components
**Estimated Effort**: Large (8-10 hours)
**Dependencies**: Design System Setup
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] Button variants (primary, secondary, text)
- [ ] Input components (text, password, email)
- [ ] Card components
- [ ] List item components
- [ ] Loading indicators
- [ ] Modal/sheet components

**Components to Create**:
- Button (primary, secondary, text, icon)
- TextInput (regular, password, search)
- Card (base, with header, with actions)
- ListItem (basic, with avatar, with actions)
- LoadingSpinner, LoadingScreen
- Modal, BottomSheet
- Avatar, Badge
- Divider, Spacer

#### 📊 Data Display Components - MEDIUM - Phase 1
**Description**: Components for displaying data and content
**Estimated Effort**: Medium (5-6 hours)
**Dependencies**: Base UI Components
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Data list components
- [ ] Empty state components
- [ ] Error state components
- [ ] Image components with placeholders
- [ ] Statistics/metrics display
- [ ] Chart components (if needed)

### 👤 PROFILE MODULE

#### 👤 Profile Screen - MEDIUM - Phase 1
**Description**: User profile view and edit functionality
**Estimated Effort**: Medium (5-6 hours)
**Dependencies**: Base UI Components, Authentication UI
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Profile information display
- [ ] Edit profile form
- [ ] Avatar upload/change (dummy)
- [ ] Form validation
- [ ] Save functionality (local storage)
- [ ] Navigation and layout

**Profile Fields**:
- Avatar image
- Full name
- Email (readonly)
- Phone number
- Date of birth
- Bio/description

#### ⚙️ Settings Screen - MEDIUM - Phase 1
**Description**: App settings and preferences
**Estimated Effort**: Small (3-4 hours)
**Dependencies**: Profile Screen
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Settings list layout
- [ ] Toggle switches for preferences
- [ ] Theme selection (light/dark)
- [ ] Language selection
- [ ] About section
- [ ] Logout functionality

### 🔔 NOTIFICATIONS

#### 🔔 Notifications Center - LOW - Phase 1
**Description**: In-app notifications list and management
**Estimated Effort**: Medium (4-5 hours)
**Dependencies**: Base UI Components
**Priority**: LOW

**Acceptance Criteria**:
- [ ] Notifications list view
- [ ] Read/unread states
- [ ] Mark as read functionality
- [ ] Clear all notifications
- [ ] Empty state when no notifications
- [ ] Dummy notifications data

---

## 📋 BLOCKED - PHASE 1

*[Tasks that are blocked by dependencies or issues]*

#### [Blocked Task Name] - [Priority] - Phase 1
**Status**: BLOCKED
**Blocked By**: [Dependency or issue]
**Description**: [What this task involves]
**Impact**: [How this affects other tasks]
**Resolution Needed**: [What needs to happen to unblock]

---

## 📋 READY TO START - PHASE 2 (Backend Integration)

*[These tasks can only start after Phase 1 is 100% complete]*

### 🔌 BACKEND SETUP

#### 🗄️ Backend Service Setup - CRITICAL - Phase 2
**Description**: Configure Supabase/Firebase backend service
**Estimated Effort**: Medium (4-6 hours)
**Dependencies**: Phase 1 completion
**Priority**: CRITICAL

**Acceptance Criteria**:
- [ ] Supabase/Firebase project created
- [ ] Database schema designed
- [ ] Authentication configured
- [ ] Storage buckets configured
- [ ] API endpoints documented
- [ ] Environment variables configured

### 🔐 AUTHENTICATION BACKEND

#### 🔑 Real Authentication - CRITICAL - Phase 2
**Description**: Replace dummy auth with real backend authentication
**Estimated Effort**: Large (6-8 hours)
**Dependencies**: Backend Service Setup, Authentication UI (Phase 1)
**Priority**: CRITICAL

**Acceptance Criteria**:
- [ ] User registration with backend
- [ ] Login/logout with JWT tokens
- [ ] Token refresh mechanism
- [ ] Password reset functionality
- [ ] Email verification (if required)
- [ ] Session management

### 📊 DATA INTEGRATION

#### 💾 Data Persistence - HIGH - Phase 2
**Description**: Replace dummy data with real backend data
**Estimated Effort**: Large (8-10 hours)
**Dependencies**: Backend Service Setup, All Phase 1 UI
**Priority**: HIGH

**Acceptance Criteria**:
- [ ] API integration for all data fetching
- [ ] CRUD operations for user data
- [ ] Error handling for API failures
- [ ] Loading states during API calls
- [ ] Offline capability (basic)
- [ ] Data caching strategy

### 🔄 REAL-TIME FEATURES

#### 📡 Push Notifications - MEDIUM - Phase 2
**Description**: Implement real push notifications
**Estimated Effort**: Medium (4-6 hours)
**Dependencies**: Backend Service Setup
**Priority**: MEDIUM

**Acceptance Criteria**:
- [ ] Push notification setup (Expo Notifications)
- [ ] Backend notification sending
- [ ] Notification permissions handling
- [ ] In-app notification display
- [ ] Notification preferences
- [ ] Deep linking from notifications

---

## ✅ COMPLETED TASKS

### [Completed Task Name] - [Priority] - Phase [1/2] ✅
**Completed**: [Date]
**Time Invested**: [Actual hours] vs [Estimated hours]
**Key Deliverables**:
- ✅ [Deliverable 1]: [Description]
- ✅ [Deliverable 2]: [Description]

**Files Created/Modified**:
- `src/path/to/file.tsx` - [Description of changes]
- `src/path/to/another.ts` - [Description of changes]

**Lessons Learned**:
- [Technical insight or pattern discovered]
- [Challenge overcome and solution]

**Impact on Other Tasks**:
- Unblocked: [List of tasks now ready to start]
- Dependencies: [New dependencies created]

---

## 🔮 FUTURE ENHANCEMENTS

*[Features for future versions, not included in current scope]*

### 📈 Analytics Integration - LOW - Future
**Description**: Add analytics tracking for user behavior
**Estimated Effort**: Small (2-3 hours)
**Priority**: LOW

### 🌍 Internationalization - LOW - Future
**Description**: Add multi-language support
**Estimated Effort**: Medium (4-6 hours)
**Priority**: LOW

### 🎨 Advanced Animations - LOW - Future
**Description**: Enhanced animations and micro-interactions
**Estimated Effort**: Medium (5-7 hours)
**Priority**: LOW

---

## 📊 Progress Tracking

### Phase 1 Progress: [X]% Complete
- 🏗️ Setup: [X/Y] tasks completed
- 🧭 Navigation: [X/Y] tasks completed  
- 🔐 Authentication UI: [X/Y] tasks completed
- 🏠 Dashboard: [X/Y] tasks completed
- 🧩 Components: [X/Y] tasks completed
- 👤 Profile: [X/Y] tasks completed

### Key Milestones
- [ ] **MVP UI Complete**: All core screens with dummy data
- [ ] **Navigation Complete**: Full app navigation working
- [ ] **Component Library**: Reusable components ready
- [ ] **Phase 1 Complete**: App works 100% offline
- [ ] **Backend Integration**: Real data connected
- [ ] **Production Ready**: App ready for stores

### Next Session Focus
*[What should be prioritized in the next development session]*

1. **Immediate Priority**: [Current task to complete]
2. **Next Task**: [Next logical task to start]
3. **Blockers to Resolve**: [Any issues to address]

---

**Last Updated**: [Date and time]
**Next Review**: [Date for next task review]
**Phase Target**: [Target date for current phase completion]
