# Admin Mode Authentication

This document explains the authentication system implemented to prevent students from removing each other from activities.

## Overview

The application now has two modes of access:

- **Student Mode (Not Logged In)**: Can view activities and registered participants
- **Teacher Mode (Logged In)**: Can register and unregister students from activities

## Teacher Accounts

Two demo teacher accounts are available in `src/teachers.json`:

| Username | Password |
|----------|----------|
| msmith   | teacher123 |
| jdoe     | teacher456 |

## How to Use

### For Students

1. Open the application in your browser
2. View available activities and see who is registered
3. You cannot register or unregister anyone without logging in

### For Teachers

1. Open the application in your browser
2. Click the **user icon (👤)** in the top right corner
3. Click the **Login** button in the dropdown
4. Enter your username and password
5. Click **Login** in the modal

Once logged in, you can:
- Register students for activities using the signup form
- Remove students from activities using the delete buttons (❌)
- Log out by clicking the user icon and selecting **Logout**

## API Endpoints

### Public Endpoints

- `GET /activities` - List all activities and participants

### Protected Endpoints (Require Authentication)

- `POST /activities/{activity_name}/signup?email={email}` - Register a student
- `DELETE /activities/{activity_name}/unregister?email={email}` - Unregister a student

### Authentication Endpoints

- `POST /auth/login` - Login with username and password
  ```json
  {
    "username": "msmith",
    "password": "teacher123"
  }
  ```
  Returns:
  ```json
  {
    "token": "session_token_here",
    "username": "msmith"
  }
  ```

- `POST /auth/logout` - Logout and invalidate session
  - Requires `Authorization: Bearer {token}` header

- `GET /auth/verify` - Check if session is valid
  - Requires `Authorization: Bearer {token}` header

## Technical Details

### Backend

- Session tokens generated using Python's `secrets.token_urlsafe()`
- In-memory session storage (tokens reset on server restart)
- Bearer token authentication for protected endpoints

### Frontend

- Session persistence using localStorage
- Conditional UI rendering based on authentication state
- Automatic token inclusion in API requests

## Security Considerations

This is a demo application designed for educational purposes:

- Passwords are stored in plaintext in `teachers.json` (not production-ready)
- Sessions are stored in memory (no persistence across restarts)
- No session expiration implemented
- Authentication tokens stored in localStorage

For a production application, you would need:
- Password hashing (bcrypt, Argon2, etc.)
- Database storage for users and sessions
- Session expiration and refresh tokens
- HTTPS for secure communication
- httpOnly cookies for token storage
- CSRF protection
