export const mockAuth = {
  signIn: async (email, password) => {
    if (process.env.NODE_ENV === 'development') {
      if (email === 'test@example.com' && password === 'password123') {
        return { user: { email, name: 'Test User' }, error: null }
      }
    }
    return { user: null, error: 'Invalid credentials' }
  }
} 