// ========================================
// ADD THESE AUTHENTICATION HANDLERS
// Add RIGHT AFTER handleChangeModeClick()
// ========================================

// Authentication Handlers  
const handleLogin = () => {
  // Temporary: Use browser prompt (replace with actual LoginScreen form later)
  const email = prompt('Enter email (admin@orobitg.com for admin):');
  const password = prompt('Enter password (matriarch1249 for admin):');
  
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

// ========================================
// ADD THESE NAVIGATION CASES
// Add inside handleNavigate switch statement
// ========================================

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

// ========================================
// ADD THESE SCREEN RENDERERS
// Add BEFORE {/* Common Screens */} section
// ========================================

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

// ========================================
// REPLACE AccountScreen WITH AccountScreenEnhanced
// Find this line and replace it:
// ========================================

// OLD:
{currentScreen === 'account' && userMode && (
  <AccountScreen 
    userMode={userMode}
    onChangeModeClick={handleChangeModeClick}
    onNavigate={handleNavigate}
  />
)}

// NEW:
{currentScreen === 'account' && userMode && (
  <AccountScreenEnhanced 
    userMode={userMode}
    onChangeModeClick={handleChangeModeClick}
    onNavigate={handleNavigate}
  />
)}
