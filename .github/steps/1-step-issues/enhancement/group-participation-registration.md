# Group Participation Registration

## Problem

Many activities and events (like Debate Team, Drama Club performances, or group competitions) require teams or groups of students working together. Currently, students can only sign up individually with no way to form or manage groups.

## Recommended Solution

Implement a group registration system:

- Add group/team functionality:
  - Create groups with a team name
  - Add group leader/captain
  - Add multiple team members
  - Set minimum and maximum team sizes per activity
  - Allow students to join existing groups or create new ones

- Update the activity data model to support:
  - Group-based activities flag
  - List of registered groups (instead of just individual participants)
  - Maximum number of groups allowed
  - Team member roles (leader, member)

- Add API endpoints to:
  - Create a group for an activity
  - Join an existing group
  - Leave a group
  - View all groups for an activity
  - Invite other students to a group

- Create UI components to:
  - Display existing groups and their members
  - Show available spots in groups
  - Allow group creation and management
  - Browse and join open groups

## Context

Store group information in a `groups.json` file or extend the activities structure. Some activities should support both individual and group registration (e.g., Drama Club can have solo performers and ensemble groups). Consider group size validation and prevent students from being in multiple groups for the same activity.
