# Advanced Admin Mode for Teachers and Administrators

## Problem

Beyond basic authentication, teachers and administrators need comprehensive management capabilities with different permission levels. There's no distinction between regular teachers, activity coordinators, and school administrators.

## Recommended Solution

Implement an advanced role-based admin system:

- Define admin roles with different permission levels:
  - Super Admin (full system access)
  - School Administrator (manage teachers, view all activities)
  - Activity Coordinator (manage specific activities)
  - Teacher (basic admin functions)
  - View-only Admin (reporting and analytics)

- Add comprehensive admin dashboard:
  - Overview statistics (total students, activities, signups)
  - Recent activity feed
  - Quick actions menu
  - System health monitoring

- Implement admin capabilities:
  - Create, edit, and delete activities
  - Manage student accounts (create, suspend, delete)
  - Assign and remove students from activities
  - Manage other admin accounts
  - Set activity capacity limits
  - Close or archive activities
  - Export data and reports
  - View audit logs
  - Bulk operations (mass email, bulk signup)

- Add advanced features:
  - Activity templates for quick creation
  - Scheduling conflict detection
  - Automated email notifications
  - Waitlist management
  - Emergency announcements
  - Data backup and restore
  - Custom reports and analytics

- Create detailed permission matrix:
  - Define what each role can view, create, edit, and delete
  - Activity-specific permissions (coordinators only manage their activities)
  - Implement permission checks in all API endpoints

## Context

Extend the existing `admin-mode.md` concept with role-based access control. Store admin roles and permissions in the authentication system. Create an admin-specific UI section accessible only after admin login. Log all admin actions for audit trail. Consider implementing a separate admin API prefix (e.g., `/admin/`) for admin-only endpoints.
