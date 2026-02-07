# Database Persistence

## Problem

All data is currently stored in memory and JSON files. When the server restarts, any changes made to the data (new signups, user accounts, etc.) are lost. The application needs proper data persistence.

## Recommended Solution

Migrate from in-memory storage to a proper database system:

- Choose an appropriate database:
  - SQLite for simple deployment (good for learning)
  - PostgreSQL for production-ready solution
  - MySQL as an alternative
  - Consider MongoDB for flexibility

- Design database schema:
  - Students table (id, email, name, grade, password_hash, created_at)
  - Activities table (id, name, description, schedule, max_participants)
  - Activity_Participants table (student_id, activity_id, signup_date)
  - Teachers table (id, email, name, password_hash, role)
  - Committees table (id, name, description)
  - Positions table (id, committee_id, student_id, position_name, term_start, term_end)
  - Events table (id, activity_id, name, date, prizes, judges)
  - Groups table (id, activity_id, name, leader_id)
  - Group_Members table (group_id, student_id, role)
  - News table (id, title, content, author_id, category, created_at)
  - Feedback table (id, student_id, activity_id, rating, review, created_at)
  - Payments table (id, student_id, activity_id, amount, status, payment_date)

- Implement database layer:
  - Create database connection management
  - Implement database migration scripts
  - Add CRUD operations for all tables
  - Handle transactions properly
  - Add database connection pooling
  - Implement proper error handling

- Add data migration:
  - Script to import existing JSON data
  - Backup and restore functionality
  - Database initialization script

## Context

Use an ORM (Object-Relational Mapping) library like SQLAlchemy for Python to simplify database operations. Create a `database.py` module to handle all database operations. Add database configuration to environment variables. Include database setup instructions in the README. Consider using database migrations (like Alembic) for version control of schema changes.
