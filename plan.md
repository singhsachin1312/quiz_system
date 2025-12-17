Assumptions:
  Single admin user manages quizzes.
  Public users can take quizzes without login.
  Each quiz contains multiple questions.
  Supported question types: MCQ, True/False, Text.
  Only one correct option per question.
  Quiz results are shown immediately after submission.

Scope:
  Included - 
    Admin login
    Create and publish quizzes
    Add questions and options
    Public quiz listing
    Take quiz and view score
    Rails + PostgreSQL + jQuery
    Deployed on Render (free tier)


  Excluded - 
    User accounts
    Timers and analytics
    Question randomization
    Automated tests

Approach:
  Ruby on Rails MVC architecture
  Normalized PostgreSQL database
  Secure admin authentication
  Server-rendered ERB views
  Public access restricted to published quizzes

Scope Changes:
  Added published flag to control quiz visibility
  Combined question and option creation into quiz edit page
  Added root page with Admin and User navigation