import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  start(event) {
    event.preventDefault()
    
    const downloadUrl = event.currentTarget.href
    
    fetch(downloadUrl, {
      headers: {
        'Accept': 'application/xlsx'
      }
    })
    .then(response => response.blob())
    .then(blob => {
      const url = window.URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `budget_report_${new Date().toISOString().split('T')[0]}.xlsx`
      document.body.appendChild(a)
      a.click()
      window.URL.revokeObjectURL(url)
      a.remove()
    })
    .catch(error => {
      console.error('Download failed:', error)
      // Show error message to user
      alert('Download failed. Please try again.')
    })
  }
} 