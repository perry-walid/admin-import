// Configure your import map in config/importmap.rb
import "@hotwired/turbo-rails" 

document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.copy-json').forEach(button => {
    button.addEventListener('click', function() {
      const recordId = this.dataset.recordId;
      const jsonContent = document.getElementById(`jsonContent${recordId}`);
      
      // Create a temporary textarea to copy the content
      const textarea = document.createElement('textarea');
      const content = {};
      
      // Build the JSON object from the displayed data
      jsonContent.querySelectorAll('.json-item').forEach(item => {
        const key = item.querySelector('.json-key').textContent;
        const value = item.querySelector('.json-value').textContent;
        content[key] = value;
      });
      
      textarea.value = JSON.stringify(content, null, 2);
      document.body.appendChild(textarea);
      textarea.select();
      document.execCommand('copy');
      document.body.removeChild(textarea);
      
      // Show feedback
      const originalText = this.innerHTML;
      this.innerHTML = '<i class="fas fa-check me-1"></i>Copied!';
      this.classList.add('copy-feedback');
      
      setTimeout(() => {
        this.innerHTML = originalText;
        this.classList.remove('copy-feedback');
      }, 2000);
    });
  });
}); 