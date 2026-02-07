# Feedback Feature

## Problem

Students have no way to provide feedback about activities, and teachers have no way to collect opinions to improve the programs. There's no mechanism for reviews, ratings, or suggestions.

## Recommended Solution

Implement a comprehensive feedback system:

- Add activity ratings and reviews:
  - Star rating system (1-5 stars)
  - Written reviews
  - Feedback categories (content quality, instructor, schedule, facilities)
  - Anonymous option for honest feedback

- Create feedback types:
  - Activity reviews (after participating)
  - General suggestions
  - Problem reports
  - New activity requests
  - Schedule change requests

- Implement feedback management:
  - Only registered participants can review activities
  - One review per student per activity
  - Teachers can respond to feedback
  - Aggregate rating display on activity cards
  - Trending issues/suggestions dashboard

- Add API endpoints to:
  - Submit feedback/reviews
  - Get feedback for an activity
  - Get average ratings
  - Filter reviews by rating
  - Mark feedback as helpful
  - Respond to feedback (admin only)

- Create UI components for:
  - Star rating display on activities
  - Review submission form
  - Reviews list with helpful votes
  - Feedback management dashboard for teachers

## Context

Store feedback in a `feedback.json` file with student email, activity name, rating, review text, timestamp, and admin responses. Only students who have participated in an activity should be able to leave reviews. Consider moderation capabilities for inappropriate content.
