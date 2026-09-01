---
name: 💬 Discussion
description: Explore an idea, share a use case, or debate an approach.
title: "[Discussion]: "
labels: ["discussion"]
body:
  - type: markdown
    attributes:
      value: |
        Start an open-ended conversation. Ideas, feedback, use cases, and explorations belong here.
  - type: textarea
    id: context
    attributes:
      label: What's the idea or question?
      description: Set the context. What are you exploring, proposing, or debating?
      placeholder: Tell us what you're thinking, experimenting with, or watching happen in AI governance.
    validations:
      required: true
  - type: textarea
    id: engagement
    attributes:
      label: Your perspective
      description: Why does this matter to you? What context or experience are you bringing?
      placeholder: Share whatever background helps the conversation — user, engineer, researcher, maintainer, policymaker, advocate.
    validations:
      required: true
---