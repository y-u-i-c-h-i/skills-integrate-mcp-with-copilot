# Membership Fee Management

## Problem

Some activities and clubs require membership fees, equipment fees, or event participation costs. Currently there's no way to track payments, outstanding balances, or financial obligations.

## Recommended Solution

Implement a membership fee management system:

- Add fee tracking per activity:
  - Activity membership fee (annual or per-semester)
  - One-time registration fee
  - Event-specific fees (competitions, trips, materials)
  - Equipment rental fees
  - Optional donation amounts

- Create payment tracking:
  - Payment status (paid, pending, overdue)
  - Payment method (cash, check, online)
  - Payment date and amount
  - Receipt generation
  - Payment history

- Add financial features:
  - Fee schedule display
  - Payment deadlines
  - Late fee calculation
  - Scholarship/waiver tracking
  - Financial aid eligibility
  - Installment payment plans

- Create API endpoints to:
  - Get fee information for activities
  - Record payment
  - Get payment history for a student
  - Get outstanding balances
  - Generate payment receipts
  - Export financial reports (admin only)

- Build UI components for:
  - Fee information on activity pages
  - Payment submission form
  - Student payment dashboard
  - Admin financial overview
  - Outstanding balance notifications

## Context

Store payment information in a `payments.json` file with student email, activity name, amount, payment date, method, and status. Only teachers (admin users) should be able to record payments and view all financial data. Students should only see their own payment history. This is tracking only - not processing real payments.
