# 🔥 FINAL AUTH WIRING - ADD THESE HANDLERS TO App.tsx

**Add these handler functions right after `handleChangeModeClick()`** (around line 270):

```typescript
// Authentication Handlers
const handleLogin = () => {
  // Demo: Show browser prompt (temporary - replace with real login form later)
  const email = prompt('Enter email (or use admin@orobitg.com):');
  const password = prompt('Enter password (or use matriarch1249):');
  
  if (!email || !password) return;
  
  const session = authenticateUser(email, password);
  
  if (session) {
    setIsLoggedIn(true);
    setCurrentUser(session.user);
    setUserRole(session.role);
    
    if (session.role === 'admin') {
      setCurrentScreen('admin-panel');
      toast.success('👑 Welcome, Matriarch!');
    } else if (session.role === 'contractor') {
      setCurrentScreen('contractor-dashboard');
      toast.success(`Welcome back, ${session.user.firstName}!`);
    } else {
      setCurrentScreen('home');
      toast.success(`Welcome, ${session.user.firstName}!`);
    }
  } else {
    toast.error('Invalid email or password');
  }
};

const handleRegister = (userData: Partial<AuthUser>) => {
  if (userExists(userData.email!)) {
    toast.error('Email already registered');
    return;
  }
  
  const newUser = registerUser(userData);
  const session: AuthSession = {
    user: newUser,
    role: newUser.accountType === 'homeowner' ? 'homeowner' : 'contractor',
    loginTime: new Date().toISOString(),
  };
  
  saveSession(session);
  setIsLoggedIn(true);
  setCurrentUser(newUser);
  setUserRole(session.role);
  
  if (newUser.accountType === 'homeowner') {
    setCurrentScreen('home');
    toast.success('Account created! Welcome to Fortress Block Studio™');
  } else {
    setCurrentScreen('contractor-dashboard');
    toast.success('Account created! Your license application is pending review.');
  }
};

const handleLogout = () => {
  clearSession();
  setIsLoggedIn(false);
  setCurrentUser(null);
  setUserRole(null);
  setCurrentScreen('splash');
  toast.success('Logged out successfully');
};
```

---

# ✅ ADD SESSION LOADING TO useEffect

**Add this inside the first `useEffect` block** (around line 223, after the Heritage Intro check):

```typescript
// Load existing session
const session = loadSession();
if (session) {
  setIsLoggedIn(true);
  setCurrentUser(session.user);
  setUserRole(session.role);
}
```

---

# 🎯 ADD SCREEN RENDERERS

**Add these BEFORE `{/* Common Screens */}`** (around line 490):

```typescript
{/* Login Screen */}
{currentScreen === 'login' && (
  <LoginScreen onLogin={handleLogin} />
)}

{/* Registration Screen */}
{currentScreen === 'register' && (
  <LoginRegistrationScreen 
    onRegister={handleRegister}
    onBack={() => setCurrentScreen('login')}
  />
)}

{/* Admin Panel */}
{currentScreen === 'admin-panel' && userRole === 'admin' && (
  <AdminPanel onBack={() => setCurrentScreen('home')} />
)}

{/* Contractor Dashboard */}
{currentScreen === 'contractor-dashboard' && currentUser && (
  <ContractorDashboard
    onBack={() => setCurrentScreen('home')}
    onLogout={handleLogout}
    userData={currentUser}
  />
)}
```

---

# 🔄 UPDATE handleNavigate

**Add these cases to the `handleNavigate` switch statement** (around line 295):

```typescript
case 'login':
  setCurrentScreen('login');
  break;
case 'register':
  setCurrentScreen('register');
  break;
case 'admin-panel':
  if (userRole === 'admin') {
    setCurrentScreen('admin-panel');
  } else {
    toast.error('Admin access only');
  }
  break;
case 'contractor-dashboard':
  if (isLoggedIn) {
    setCurrentScreen('contractor-dashboard');
  } else {
    toast.error('Please login first');
    setCurrentScreen('login');
  }
  break;
case 'logout':
  handleLogout();
  break;
```

---

# 🎉 THAT'S IT!

Once you add these pieces, authentication will be **100% WIRED!**

## 🔐 TEST LOGIN CREDENTIALS:

**Admin:**
- Email: `admin@orobitg.com`
- Password: `matriarch1249`

**Create New User:**
- Navigate to register screen (you'll need to add a button in Account or Home screen)

**Test Flow:**
1. Call `handleNavigate('login')` from anywhere
2. Login with admin credentials
3. Access admin panel
4. Logout and test registration

Let me know when you've added these and I'll help you add navigation buttons to access login/dashboard!
