import { Application } from "@hotwired/stimulus"
import AuthController from "../../app/javascript/controllers/auth_controller"

describe("AuthController", () => {
  let application

  beforeEach(() => {
    document.body.innerHTML = `
      <form data-controller="auth">
        <input data-auth-target="nameInput" type="text">
        <input data-auth-target="emailInput" type="email">
        <input data-auth-target="passwordInput" type="password">
        <input data-auth-target="passwordConfirmInput" type="password">
        <button data-action="auth#handleSignup">Sign up</button>
      </form>
    `

    application = Application.start()
    application.register("auth", AuthController)
  })

  it("fills mock credentials in development", () => {
    const controller = new AuthController()
    controller.mockEnabledValue = true
    controller.mockEmailValue = "test@example.com"
    controller.mockPasswordValue = "password123"
    controller.connect()

    expect(controller.emailInputTarget.value).toBe("test@example.com")
    expect(controller.passwordInputTarget.value).toBe("password123")
  })
}) 