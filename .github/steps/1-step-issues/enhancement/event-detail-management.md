# Event Detail Management

## Problem

Activities need more detailed information such as competitions, prizes, judges, special events, and achievements. The current system only tracks basic activity information and participants.

## Recommended Solution

Enhance the activity/event system with detailed event management:

- Extend the activity data model to include:
  - Event type (regular meeting, competition, performance, tournament)
  - Prize information (1st place, 2nd place, 3rd place awards)
  - Prize money or rewards
  - Judges/evaluators list
  - Competition rules and criteria
  - Registration deadlines
  - Event location and venue details
  - Required materials or prerequisites

- Add special event features:
  - Ability to create one-time special events
  - Event announcements and updates
  - Results and winner announcements
  - Photo gallery or event highlights

- Create API endpoints to:
  - Get detailed event information
  - Submit competition results
  - Announce winners
  - Update event details

## Context

Store event details in the existing activities data structure or create a separate `events.json` file. Consider how to distinguish between regular recurring activities and special one-time events. Only teachers should be able to add prize information and announce results.
