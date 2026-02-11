---
layout: default
title: "Submit a Question"
description: "Have questions about HAIEF? Submit them here and we'll provide answers on our Q&A page."
permalink: /submit-question/
---

<div class="page-header">
  <div class="container">
    <h1 class="page-header__title">Submit a Question</h1>
    <p class="page-header__subtitle">
      Have questions about HAIEF, the Solidarity Framework, or AI governance? Submit your question below and we'll answer it on our Q&A page.
    </p>
  </div>
</div>

<div class="page-content">
  <div class="container container--narrow">

<div class="callout callout--info">
  <p class="callout__title">How It Works</p>
  <p>Submit your question using the form below. You can choose to submit anonymously or provide your email address if you'd like a private response. All questions submitted anonymously (or with permission) will be answered publicly on our <a href="{{ '/questions-and-answers/' | relative_url }}">Q&A page</a>.</p>
</div>

<form id="question-form" class="form" style="margin-top: var(--space-8);">
  
  <div class="form-group">
    <label for="question" class="form-label">Your Question *</label>
    <textarea 
      id="question" 
      name="question" 
      class="form-input" 
      rows="6" 
      required
      placeholder="What would you like to know about HAIEF, the Solidarity Framework, or AI governance?"
    ></textarea>
    <small class="form-help">Please be as specific as possible. This will help us provide a better answer.</small>
  </div>

  <div class="form-group">
    <label for="category" class="form-label">Question Category</label>
    <select id="category" name="category" class="form-input">
      <option value="general">General / About HAIEF</option>
      <option value="framework">Solidarity Framework</option>
      <option value="technical">Technical Implementation</option>
      <option value="governance">Governance & Standards</option>
      <option value="contribution">How to Contribute</option>
      <option value="other">Other</option>
    </select>
  </div>

  <div class="form-group">
    <label class="form-label">Response Preference *</label>
    <div style="margin-top: var(--space-2);">
      <label style="display: block; margin-bottom: var(--space-2);">
        <input type="radio" name="response_type" value="anonymous" checked>
        Submit anonymously (answer will be posted publicly on Q&A page)
      </label>
      <label style="display: block;">
        <input type="radio" name="response_type" value="private">
        I want a private response (provide email below)
      </label>
    </div>
  </div>

  <div class="form-group" id="email-group" style="display: none;">
    <label for="email" class="form-label">Your Email Address</label>
    <input 
      type="email" 
      id="email" 
      name="email" 
      class="form-input"
      placeholder="your.email@example.com"
    >
    <small class="form-help">We'll respond privately to this email address. Your email will not be shared publicly.</small>
    
    <div style="margin-top: var(--space-3);">
      <label>
        <input type="checkbox" name="allow_public" id="allow_public">
        You may also post this question and answer publicly on the Q&A page (optional)
      </label>
    </div>
  </div>

  <div class="form-group">
    <label for="name" class="form-label">Your Name (Optional)</label>
    <input 
      type="text" 
      id="name" 
      name="name" 
      class="form-input"
      placeholder="How should we address you?"
    >
    <small class="form-help">Only used if you want to be credited on the Q&A page. Leave blank to remain anonymous.</small>
  </div>

  <div class="form-actions" style="margin-top: var(--space-6);">
    <button type="submit" class="btn btn--primary btn--large">Submit Question</button>
    <a href="{{ '/questions-and-answers/' | relative_url }}" class="btn btn--outline btn--large" style="margin-left: var(--space-3);">View Q&A Page</a>
  </div>

  <div id="form-message" style="margin-top: var(--space-4); display: none;"></div>
</form>

<script>
// Show/hide email field based on response type selection
function updateEmailFieldVisibility() {
  const emailGroup = document.getElementById('email-group');
  const emailInput = document.getElementById('email');
  const selected = document.querySelector('input[name="response_type"]:checked');

  if (!emailGroup || !emailInput) {
    return;
  }

  if (selected && selected.value === 'private') {
    emailGroup.style.display = 'block';
    emailInput.required = true;
  } else {
    emailGroup.style.display = 'none';
    emailInput.required = false;
  }
}

document.querySelectorAll('input[name="response_type"]').forEach(radio => {
  radio.addEventListener('change', updateEmailFieldVisibility);
});

// Initialize email field visibility on page load
updateEmailFieldVisibility();
// Handle form submission
document.getElementById('question-form').addEventListener('submit', function(e) {
  e.preventDefault();
  
  const formData = new FormData(this);
  const data = Object.fromEntries(formData.entries());
  
  // Get the form message element
  const messageEl = document.getElementById('form-message');
  
  // For now, we'll create a GitHub issue
  // In a real implementation, this would connect to a backend service
  const responseType = data.response_type;
  
  let issueBody = `**Question:** ${data.question}\n\n`;
  issueBody += `**Category:** ${data.category}\n\n`;
  
  if (data.name) {
    issueBody += `**Submitted by:** ${data.name}\n\n`;
  }
  
  issueBody += `---\n\n*This question was submitted via the HAIEF Q&A form.*`;
  
  const truncatedQuestion = data.question.substring(0, 80);
  const encodedIssueTitle = encodeURIComponent(`Q&A: ${truncatedQuestion}${data.question.length > 80 ? '...' : ''}`);
  const issueBodyEncoded = encodeURIComponent(issueBody);
  
  // Create a GitHub issue URL with pre-filled content (for anonymous submissions)
  const githubIssueUrl = `https://github.com/NeuroLift-Technologies/haief/issues/new?title=${encodedIssueTitle}&body=${issueBodyEncoded}&labels=question`;
  
  // For private responses, use email only (do not expose email in public GitHub issues)
  const emailSubject = encodeURIComponent(`Q&A Question: ${data.question.substring(0, 50)}${data.question.length > 50 ? '...' : ''}`);
  let emailBody = `Question: ${data.question}\n\nCategory: ${data.category}\n\n`;
  if (data.name) {
    emailBody += `Name: ${data.name}\n`;
  }
  if (data.email) {
    emailBody += `Reply to: ${data.email}\n`;
  }
  if (data.allow_public) {
    emailBody += `\nPermission to post publicly: Yes\n`;
  }
  const emailBodyEncoded = encodeURIComponent(emailBody);
  const emailUrl = `mailto:haief@neuroliftsolutions.com?subject=${emailSubject}&body=${emailBodyEncoded}`;
  
  // Show success message based on response type
  messageEl.className = 'callout callout--success';
  messageEl.style.display = 'block';
  
  if (responseType === 'private') {
    messageEl.innerHTML = `
      <p class="callout__title">Thank You!</p>
      <p>For private responses, please email us directly to protect your privacy. Click the button below to open your email client with your question pre-filled.</p>
      <p style="margin-top: var(--space-4);">
        <a href="${emailUrl}" class="btn btn--primary">Send Email</a>
      </p>
      <p><small>Your email address will not be shared publicly. We'll respond directly to your email.</small></p>
    `;
  } else {
    messageEl.innerHTML = `
      <p class="callout__title">Thank You!</p>
      <p>Your question has been prepared. Click the button below to submit it as a GitHub issue. We'll review and answer it as soon as possible.</p>
      <p style="margin-top: var(--space-4);">
        <a href="${githubIssueUrl}" target="_blank" class="btn btn--primary">Complete Submission on GitHub</a>
      </p>
      <p><small>Note: You'll need a GitHub account to complete the submission. If you don't have one, you can <a href="${emailUrl}">email us instead</a>.</small></p>
    `;
  }
  
  // Scroll to message
  messageEl.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
});
</script>

<style>
.form-group {
  margin-bottom: var(--space-6);
}

.form-label {
  display: block;
  font-weight: 600;
  margin-bottom: var(--space-2);
  color: var(--color-text);
}

.form-input,
.form-textarea {
  width: 100%;
  padding: var(--space-3);
  border: 2px solid var(--color-border);
  border-radius: var(--border-radius-sm);
  font-size: var(--font-size-base);
  font-family: inherit;
  transition: border-color 0.2s;
}

.form-input:focus,
.form-textarea:focus {
  outline: none;
  border-color: var(--color-primary);
}

.form-help {
  display: block;
  margin-top: var(--space-2);
  color: var(--color-text-muted);
  font-size: var(--font-size-sm);
}

.form-actions {
  display: flex;
  align-items: center;
  gap: var(--space-3);
}

select.form-input {
  background-color: white;
  cursor: pointer;
}

input[type="radio"],
input[type="checkbox"] {
  margin-right: var(--space-2);
}
</style>

  </div>
</div>
