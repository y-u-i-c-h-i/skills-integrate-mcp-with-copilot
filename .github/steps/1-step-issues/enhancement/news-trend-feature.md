# News and Trend Feature

## Problem

Students and teachers have no central place to share announcements, achievements, upcoming events, or trending activities. Important information gets lost in emails or word-of-mouth.

## Recommended Solution

Add a news and trend section to keep everyone informed:

- Create a news feed system with:
  - Announcements (school-wide, activity-specific)
  - Achievement highlights (competition wins, notable performances)
  - Upcoming events calendar
  - Activity spotlights
  - Photo/media attachments

- Add trending/popular features:
  - Most popular activities (by signup count)
  - Recently added activities
  - Activities with upcoming events
  - Featured activities of the week/month

- Implement news categories:
  - General announcements
  - Competition results
  - New activities
  - Schedule changes
  - Student achievements

- Create API endpoints to:
  - Post news items (admin only)
  - Get recent news
  - Get news by category
  - Get trending activities
  - Filter news by activity or date

- Add UI components for:
  - News feed on homepage
  - Trending activities sidebar
  - Activity-specific news sections
  - News detail pages

## Context

Store news items in a `news.json` file with timestamps, categories, author, and content. Only teachers (admin users) should be able to post news. Consider adding a "pin to top" feature for important announcements. Trending should be calculated based on recent signups and activity.
