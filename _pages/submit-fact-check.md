---
layout: default
title: "Submit Fact-Check Request"
description: "Request fact-checking for claims made in HAIEF documentation or suggest claims that need verification."
permalink: /submit-fact-check/
---

<div class="page-header">
  <div class="container">
    <h1 class="page-header__title">Submit Fact-Check Request</h1>
    <p class="page-header__subtitle">
      Help us maintain accuracy and credibility. Submit claims that need fact-checking or verification.
    </p>
  </div>
</div>

<div class="page-content">
  <div class="container container--narrow">

<div class="callout callout--info">
  <p class="callout__title">How It Works</p>
  <p>Submit a fact-check request using the form below. You can choose to submit anonymously or provide your email address if you'd like a private response. All requests help us maintain the accuracy of HAIEF documentation.</p>
</div>

<form id="fact-check-form" class="form" style="margin-top: var(--space-8);">
  
  <div class="form-group">
    <label for="claim" class="form-label">Claim or Statement to Fact-Check *</label>
    <textarea 
      id="claim" 
      name="claim" 
      class="form-input" 
      rows="4" 
      required
      placeholder="Enter the specific claim or statement that needs fact-checking..."
    ></textarea>
    <small class="form-help">Please be as specific as possible. Include the page or document where you found this claim if applicable.</small>
  </div>

  <div class="form-group">
    <label for="source_location" class="form-label">Where did you find this claim?</label>
    <input 
      type="text" 
      id="source_location" 
      name="source_location" 
      class="form-input"
      placeholder="e.g., Homepage, The Problem page, Solidarity Framework docs, etc."
    >
    <small class="form-help">Help us locate the claim quickly by providing the page or section.</small>
  </div>

  <div class="form-group">
    <label for="concern" class="form-label">What is your concern?</label>
    <textarea 
      id="concern" 
      name="concern" 
      class="form-input" 
      rows="3"
      placeholder="Why do you think this claim needs fact-checking? Do you have contradictory information?"
    ></textarea>
    <small class="form-help">Optional: Explain why this claim seems questionable or needs verification.</small>
  </div>

  <div class="form-group">
    <label for="evidence" class="form-label">Supporting Information (Optional)</label>
    <textarea 
      id="evidence" 
      name="evidence" 
      class="form-input" 
      rows="3"
      placeholder="Do you have links to sources, studies, or evidence that contradicts the claim?"
    ></textarea>
    <small class="form-help">If you have sources or evidence to share, please include them here.</small>
  </div>

  <div class="form-group">
    <label for="priority" class="form-label">Priority Level</label>
    <select id="priority" name="priority" class="form-input">
      <option value="normal">Normal - General fact-checking</option>
      <option value="high">High - Central to HAIEF's mission</option>
      <option value="urgent">Urgent - Potentially harmful misinformation</option>
    </select>
    <small class="form-help">Help us prioritize by indicating the importance of this fact-check.</small>
  </div>

  <div class="form-group">
    <label class="form-label">Response Preference *</label>
    <div style="margin-top: var(--space-2);">
      <label style="display: block; margin-bottom: var(--space-2);">
        <input type="radio" name="response_type" value="anonymous" checked>
        Submit anonymously (results will be updated in documentation)
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
        You may also update the public documentation based on this request (optional)
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
    <small class="form-help">Only used if you want to be credited for identifying this issue. Leave blank to remain anonymous.</small>
  </div>

  <div class="form-actions" style="margin-top: var(--space-6);">
    <button type="submit" class="btn btn--primary btn--large">Submit Fact-Check Request</button>
    <a href="{{ '/fact-checking/research-checklist.md' | relative_url }}" class="btn btn--outline btn--large" style="margin-left: var(--space-3);">View Fact-Check Checklist</a>
  </div>

  <div id="form-message" style="margin-top: var(--space-4); display: none;"></div>
</form>

<script>
// Show/hide email field based on response type selection
const emailGroup = document.getElementById('email-group');
const emailInput = document.getElementById('email');

function updateEmailVisibility() {
  const selectedResponseType = document.querySelector('input[name="response_type"]:checked');

  if (!selectedResponseType) {
    // Default to hiding the email field if nothing is selected
    emailGroup.style.display = 'none';
    emailInput.required = false;
    return;
  }

  if (selectedResponseType.value === 'private') {
    emailGroup.style.display = 'block';
    emailInput.required = true;
  } else {
    emailGroup.style.display = 'none';
    emailInput.required = false;
  }
}

document.querySelectorAll('input[name="response_type"]').forEach(radio => {
  radio.addEventListener('change', updateEmailVisibility);
});

// Initialize email field visibility/required state on page load
updateEmailVisibility();
// Handle form submission
document.getElementById('fact-check-form').addEventListener('submit', function(e) {
  e.preventDefault();
  
  const formData = new FormData(this);
  const data = Object.fromEntries(formData.entries());
  
  // Get the form message element
  const messageEl = document.getElementById('form-message');
  
  // For now, we'll create a GitHub issue
  // In a real implementation, this would connect to a backend service
  const responseType = data.response_type;
  
  let issueBody = `**Claim to Fact-Check:** ${data.claim}\n\n`;
  
  if (data.source_location) {
    issueBody += `**Source Location:** ${data.source_location}\n\n`;
  }
  
  if (data.concern) {
    issueBody += `**Concern:** ${data.concern}\n\n`;
  }
  
  if (data.evidence) {
    issueBody += `**Supporting Information:** ${data.evidence}\n\n`;
  }
  
  issueBody += `**Priority:** ${data.priority}\n\n`;
  
  if (data.name) {
    issueBody += `**Submitted by:** ${data.name}\n\n`;
  }
  
  issueBody += `---\n\n*This fact-check request was submitted via the HAIEF fact-checking form.*`;
  
  const truncatedClaim = data.claim.substring(0, 60);
  const encodedIssueTitle = encodeURIComponent(`Fact-Check: ${truncatedClaim}${data.claim.length > 60 ? '...' : ''}`);
  const issueBodyEncoded = encodeURIComponent(issueBody);
  
  // Create a GitHub issue URL with pre-filled content (for anonymous submissions)
  const githubIssueUrl = `https://github.com/NeuroLift-Technologies/haief/issues/new?title=${encodedIssueTitle}&body=${issueBodyEncoded}&labels=fact-check`;
  
  // For private responses, use email only (do not expose email in public GitHub issues)
  const emailSubject = encodeURIComponent(`Fact-Check Request: ${data.claim.substring(0, 50)}${data.claim.length > 50 ? '...' : ''}`);
  let emailBody = `Claim to Fact-Check: ${data.claim}\n\n`;
  if (data.source_location) {
    emailBody += `Source Location: ${data.source_location}\n\n`;
  }
  if (data.concern) {
    emailBody += `Concern: ${data.concern}\n\n`;
  }
  if (data.evidence) {
    emailBody += `Supporting Information: ${data.evidence}\n\n`;
  }
  emailBody += `Priority: ${data.priority}\n\n`;
  if (data.name) {
    emailBody += `Name: ${data.name}\n`;
  }
  if (data.email) {
    emailBody += `Reply to: ${data.email}\n`;
  }
  if (data.allow_public) {
    emailBody += `\nPermission to update public documentation: Yes\n`;
  }
  const emailBodyEncoded = encodeURIComponent(emailBody);
  const emailUrl = `mailto:haief@neuroliftsolutions.com?subject=${emailSubject}&body=${emailBodyEncoded}`;
  
  // Show success message based on response type
  messageEl.className = 'callout callout--success';
  messageEl.style.display = 'block';
  
  if (responseType === 'private') {
    messageEl.innerHTML = `
      <p class="callout__title">Thank You!</p>
      <p>For private responses, please email us directly to protect your privacy. Click the button below to open your email client with your request pre-filled.</p>
      <p style="margin-top: var(--space-4);">
        <a href="${emailUrl}" class="btn btn--primary">Send Email</a>
      </p>
      <p><small>Your email address will not be shared publicly. We'll respond directly to your email.</small></p>
    `;
  } else {
    messageEl.innerHTML = `
      <p class="callout__title">Thank You!</p>
      <p>Your fact-check request has been prepared. Click the button below to submit it as a GitHub issue. We'll review and investigate it as soon as possible.</p>
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
