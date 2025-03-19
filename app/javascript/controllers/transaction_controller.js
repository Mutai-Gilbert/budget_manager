import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit(event) {
    event.preventDefault()
    const form = event.target

    fetch(form.action, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: new FormData(form)
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // Redirect back to categories page
        window.location.href = '/categories'
      } else {
        // Handle errors
        console.error('Error:', data)
      }
    })
    .catch(error => {
      console.error('Error:', error)
    })
  }

  close(event) {
    event.preventDefault()
    window.location.href = event.currentTarget.href
  }
} 