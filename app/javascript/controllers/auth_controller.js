import { Controller } from "@hotwired/stimulus"
import { supabase } from "../supabase_client"

export default class extends Controller {
  static targets = ["nameInput", "emailInput", "passwordInput", "passwordConfirmInput"]
  static values = { 
    mockEnabled: Boolean,
    mockEmail: String,
    mockPassword: String
  }

  connect() {
    if (this.mockEnabledValue) {
      this.nameInputTarget.value = "Test User"
      this.emailInputTarget.value = this.mockEmailValue
      this.passwordInputTarget.value = this.mockPasswordValue
      this.passwordConfirmInputTarget.value = this.mockPasswordValue
    }
  }

  async handleSignup(event) {
    event.preventDefault()

    const userData = {
      name: this.nameInputTarget.value,
      email: this.emailInputTarget.value,
      password: this.passwordInputTarget.value
    }

    if (this.mockEnabledValue) {
      try {
        const response = await fetch('/users/sign_in', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
          },
          body: JSON.stringify({
            user: {
              email: userData.email,
              password: userData.password,
              name: userData.name
            }
          })
        })

        if (!response.ok) throw new Error('Authentication failed')

        const data = await response.json()
        if (data.redirect) window.location.href = data.redirect
      } catch (error) {
        console.error('Error:', error)
        // Handle error (show message to user)
      }
    } else {
      // Supabase authentication
      const { user, error } = await supabase.auth.signUp({
        email: userData.email,
        password: userData.password,
        options: {
          data: {
            name: userData.name
          }
        }
      })

      if (error) throw error

      // Redirect on success
      window.location.href = '/categories'
    }
  }
} 