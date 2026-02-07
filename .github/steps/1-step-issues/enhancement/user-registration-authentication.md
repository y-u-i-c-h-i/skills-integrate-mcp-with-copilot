# User Registration and Authentication

## Problem

Currently, the system only uses email addresses to identify students, with no proper user accounts or authentication system. This makes it difficult to manage student information, verify identities, and provide personalized experiences.

## Recommended Solution

Implement a comprehensive user registration and authentication system:

- Create a user registration page where students can sign up with:
  - Email address
  - Password
  - Full name
  - Grade level
  - Student ID number

- Implement a login system with:
  - Secure password hashing
  - Session management
  - "Remember me" functionality
  - Password reset capability

- Add a user profile page where students can:
  - View and update their information
  - See their registered activities
  - Change their password

## Context

Since there is no database yet, store user credentials in a `users.json` file with hashed passwords. Use a secure hashing algorithm like bcrypt or similar. Ensure the authentication system integrates with the existing activity signup functionality.
