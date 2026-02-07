# Committee and Position Management

## Problem

The school has various student committees (Student Council, Class Representatives, Club Officers) and positions that need to be tracked and managed, but there's currently no system for this.

## Recommended Solution

Add a committee and position management system:

- Create a data structure to store committees and positions:
  - Committee name (e.g., "Student Council", "Chess Club Leadership")
  - Available positions (e.g., "President", "Vice President", "Secretary", "Treasurer")
  - Position holders (student assignments)
  - Term duration (start and end dates)
  - Responsibilities description

- Add API endpoints to:
  - List all committees and their positions
  - Assign students to positions
  - Remove students from positions
  - View position history

- Create a UI section to display:
  - All active committees
  - Current position holders
  - Open positions
  - Application/nomination functionality

## Context

Store committee and position data in a `committees.json` file. Consider how this relates to existing activities - some activities (like Chess Club) might have associated leadership positions. Only teachers (admin users) should be able to assign positions.
