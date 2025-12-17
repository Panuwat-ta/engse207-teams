# ✅ Week 3 Lab - TODO Checklist

Print this checklist and check off each item as you complete it!

---

## 🎯 BEFORE LAB

- [✅] Read Timeline document (ENGSE207_Task_Board_Timeline.md)
- [✅] Read Quick Reference guide
- [✅] Laptop charged and ready
- [✅] Internet connection available
- [✅] VS Code installed

---

## 📦 SETUP (30 min)

### Environment Setup:
- [✅] WSL2/Ubuntu installed (Windows users)
- [✅] Node.js 20+ installed
- [✅] npm installed
- [✅] SQLite3 installed
- [✅] Git installed
- [✅] VS Code extensions installed:
  - [✅] Remote - WSL
  - [✅] ESLint
  - [✅] SQLite Viewer
  - [✅] Thunder Client

### Project Setup:
- [✅] Created project folder: `week3-monolithic`
- [✅] Extracted starter code to folder
- [✅] Ran `npm install` successfully
- [✅] Created database: `sqlite3 tasks.db < schema.sql`
- [✅] Verified database has 4 sample tasks
- [✅] Opened project in VS Code

---

## 💻 BACKEND IMPLEMENTATION (60 min)

### File: `server.js`

#### Basic Setup:
- [✅] **Part 1:** Uncommented imports (express, sqlite3, path)
- [✅] **Part 2:** Created app instance and defined PORT
- [✅] **Part 3:** Added JSON and static file middleware
- [✅] **Part 4:** Connected to database
- [✅] **Test:** Ran `npm run dev` - server starts without errors

#### GET Endpoints:
- [✅] **Part 5:** Implemented GET `/api/tasks` (all tasks)
  - [✅] **Test:** Thunder Client shows all tasks
- [✅] **Part 6:** Implemented GET `/api/tasks/:id` (single task)
  - [✅] **Test:** Can get task by ID
  - [✅] **Test:** Returns 404 for invalid ID

#### POST Endpoint:
- [✅] **Part 7:** Implemented POST `/api/tasks` (create)
  - [✅] Added title validation
  - [✅] Returns created task with ID
  - [✅] **Test:** Can create task with Thunder Client
  - [✅] **Test:** Returns 400 if title is empty

#### PUT/PATCH Endpoints:
- [✅] **Part 8:** Implemented PUT `/api/tasks/:id` (update)
  - [✅] Builds dynamic SQL
  - [✅] Returns updated task
  - [✅] **Test:** Can update task fields
- [✅] **Part 10:** Implemented PATCH `/api/tasks/:id/status`
  - [✅] Validates status values
  - [✅] **Test:** Can change status
  - [✅] **Test:** Returns 400 for invalid status

#### DELETE Endpoint:
- [✅] **Part 9:** Implemented DELETE `/api/tasks/:id`
  - [✅] Returns appropriate messages
  - [✅] **Test:** Can delete task
  - [✅] **Test:** Returns 404 if task not found

#### Final Backend Setup:
- [✅] **Part 11:** Added route to serve index.html
- [✅] **Part 12:** Started server with listen()
- [✅] **Part 13:** Added graceful shutdown (bonus)
- [✅] **Test:** All API endpoints working correctly

### Backend Checkpoint ✓
- [✅] Server runs without errors
- [✅] All 6 API endpoints work
- [✅] Thunder Client tests pass
- [✅] No console errors

---

## 🎨 FRONTEND IMPLEMENTATION (60 min)

### File: `public/app.js`

#### State & DOM:
- [✅] **Part 1:** Declared state variables (allTasks, currentFilter)
- [✅] **Part 2:** Got all DOM element references
  - [✅] Form element
  - [✅] Filter select
  - [✅] Task containers (todo, progress, done)
  - [✅] Counter spans

#### Utility Functions:
- [✅] **Part 11:** Implemented utility functions
  - [✅] `escapeHtml()` - prevents XSS
  - [✅] `formatDate()` - formats dates nicely
  - [✅] `showLoading()` - shows overlay
  - [✅] `hideLoading()` - hides overlay
  - [✅] **Test:** Call functions in console

#### API Functions:
- [✅] **Part 3:** Implemented `fetchTasks()`
  - [✅] Fetches from `/api/tasks`
  - [✅] Updates allTasks array
  - [✅] Calls renderTasks()
  - [✅] **Test:** Call in console - tasks load

- [✅] **Part 4:** Implemented `createTask()`
  - [✅] POSTs to `/api/tasks`
  - [✅] Updates allTasks
  - [✅] Resets form
  - [✅] Shows success message
  - [✅] **Test:** Create task manually

- [✅] **Part 5:** Implemented `updateTaskStatus()`
  - [✅] PATCHes to `/api/tasks/:id/status`
  - [✅] Updates local state
  - [✅] Re-renders
  - [✅] **Test:** Change status manually

- [✅] **Part 6:** Implemented `deleteTask()`
  - [✅] Shows confirmation
  - [✅] DELETEs from API
  - [✅] Removes from local state
  - [✅] **Test:** Delete manually

#### Render Functions:
- [✅] **Part 7:** Implemented `renderTasks()`
  - [✅] Clears all lists
  - [✅] Filters tasks
  - [✅] Separates by status
  - [✅] Updates counters
  - [✅] Calls renderTaskList()

- [✅] **Part 8:** Implemented `renderTaskList()`
  - [✅] Shows empty state if no tasks
  - [✅] Loops through tasks
  - [✅] Creates cards

- [✅] **Part 9:** Implemented `createTaskCard()`
  - [✅] Creates card element
  - [✅] Sets correct HTML structure
  - [✅] Includes all task data
  - [✅] Has proper classes

- [✅] **Part 10:** Implemented `createStatusButtons()`
  - [✅] Shows appropriate buttons for status
  - [✅] Includes onclick handlers

#### Event Listeners:
- [✅] **Part 12:** Added form submit listener
  - [✅] Prevents default
  - [✅] Gets form data
  - [✅] Validates title
  - [✅] Calls createTask()

- [✅] **Part 12:** Added filter change listener
  - [✅] Updates currentFilter
  - [✅] Calls renderTasks()

#### Initialization:
- [✅] **Part 13:** Added DOMContentLoaded listener
  - [✅] Logs startup message
  - [✅] Calls fetchTasks()

- [✅] **Part 14:** Exposed global functions
  - [✅] window.updateTaskStatus
  - [✅] window.deleteTask

### Frontend Checkpoint ✓
- [✅] Page loads without errors
- [✅] Tasks display correctly
- [✅] Can create new task via form
- [✅] Can move tasks between columns
- [✅] Can delete tasks
- [✅] Filter works
- [✅] Counters update
- [✅] No console errors

---

## 🧪 FULL APPLICATION TESTING (15 min)

### Functionality Tests:
- [✅] Can view all tasks on page load
- [✅] Tasks appear in correct columns
- [✅] Can create task with only title
- [✅] Can create task with description
- [✅] Can create task with priority
- [✅] Can move task: TODO → IN_PROGRESS
- [✅] Can move task: IN_PROGRESS → DONE
- [✅] Can move task backwards
- [✅] Can delete task with confirmation
- [✅] Filter "All Tasks" shows everything
- [✅] Filter "To Do" shows only TODO
- [✅] Filter "In Progress" shows only IN_PROGRESS
- [✅] Filter "Done" shows only DONE
- [✅] Counters update correctly
- [✅] Priority badges show correct colors

### Error Handling:
- [✅] Empty title shows error
- [✅] Deleted task disappears immediately
- [✅] Network errors show alert
- [✅] Loading overlay appears/disappears

### UI/UX:
- [✅] Buttons look good and work
- [✅] Cards have hover effects
- [✅] Page is responsive (try resizing)
- [✅] Forms clear after submit
- [✅] Confirmations show for delete

---

## 📝 DOCUMENTATION (15 min)

- [✅] Wrote README.md with:
  - [✅] Project overview
  - [✅] Installation steps
  - [✅] How to run
  - [✅] Architecture description
  - [✅] API endpoints list
  - [✅] Screenshots (optional)

- [✅] Answered REFLECTION.md questions:
  - [✅] What did you learn?
  - [✅] Main advantages of monolithic?
  - [✅] Challenges encountered?
  - [✅] Solutions found?
  - [✅] When to use monolithic?
  - [✅] What would you do differently?

- [✅] Updated time tracking in reflection

---

## 🔄 GIT VERSION CONTROL (15 min)

- [✅] Initialized git: `git init`
- [✅] Created/verified .gitignore:
  - [✅] node_modules/ excluded
  - [✅] *.db excluded
  - [✅] .env excluded

- [✅] Added files: `git add .`
- [✅] First commit with message:
  ```
  git commit -m "Week 3: Complete monolithic Task Board

  - Implement all CRUD operations
  - Create REST API with 6 endpoints
  - Build responsive frontend UI
  - Use SQLite for data persistence
  - All features working in single codebase"
  ```

- [✅] Additional commits for improvements (if any)
- [✅] Pushed to GitHub (optional):
  ```bash
  git remote add origin <your-repo-url>
  git branch -M main
  git push -u origin main
  ```

---

## 📤 SUBMISSION PREPARATION (10 min)

### Pre-submission Checklist:
- [✅] All features work correctly
- [✅] No console errors in DevTools
- [✅] No errors when starting server
- [✅] README.md is complete
- [✅] REFLECTION.md is complete
- [✅] Git commits are meaningful
- [✅] Code has comments where needed
- [✅] No node_modules in submission
- [✅] No database files in submission (.db)

### Create Submission:

**Option A: GitHub**
- [✅] Repository is public (or shared with instructor)
- [✅] README visible on GitHub
- [✅] Copy GitHub URL
- [✅] Submit URL in LMS

**Option B: ZIP File**
- [✅] Created ZIP excluding:
  - [✅] node_modules/
  - [✅] *.db files
  - [✅] .git/ (optional)
- [✅] Tested extraction and running
- [✅] Upload to LMS

---

## 🎓 SELF-ASSESSMENT

Rate yourself (1-5):

| Criteria | Rating | Notes |
|----------|--------|-------|
| Understanding of Monolithic | __/5 | |
| Backend API implementation | __/5 | |
| Frontend implementation | __/5 | |
| Git usage | __/5 | |
| Documentation quality | __/5 | |
| Code cleanliness | __/5 | |
| Problem-solving | __/5 | |
| **Total** | __/35 | |

**Strengths:**
- What did you do well?

**Areas for Improvement:**
- What could be better?

**Questions for Instructor:**
- What are you still confused about?

---

## 🎯 GRADING EXPECTATIONS

| Criteria | Points | Your Notes |
|----------|--------|------------|
| **Functionality** (4 pts) | | |
| - All CRUD operations work | | |
| - API endpoints correct | | |
| - Frontend interactive | | |
| **Code Quality** (2 pts) | | |
| - Clean, readable code | | |
| - Good practices used | | |
| - Comments where needed | | |
| **Documentation** (2 pts) | | |
| - Complete README | | |
| - Reflection answers | | |
| **Git Usage** (1 pt) | | |
| - Meaningful commits | | |
| **Creativity** (1 pt) | | |
| - Extra features | | |
| - Improved UI | | |
| **TOTAL** | __/10 | |

---

## 🚀 BONUS CHALLENGES (Optional)

Completed any of these?

- [✅] Added search functionality
- [✅] Added due dates for tasks
- [✅] Added task categories/tags
- [✅] Implemented dark mode
- [✅] Added drag-and-drop
- [✅] Added export/import JSON
- [✅] Added pagination
- [✅] Improved UI design significantly
- [✅] Added unit tests
- [✅] Added API documentation (Swagger)

---

## 📅 TIME MANAGEMENT

Actual time spent:

| Activity | Planned | Actual | Notes |
|----------|---------|--------|-------|
| Setup | 30 min | ____ min | |
| Backend | 60 min | ____ min | |
| Frontend | 60 min | ____ min | |
| Testing | 15 min | ____ min | |
| Documentation | 15 min | ____ min | |
| Git & Submission | 10 min | ____ min | |
| **Total** | 180 min | ____ min | |

---

## ✅ FINAL CHECKLIST

Before submitting, confirm:

- [✅] ✅ I can run the application without errors
- [✅] ✅ I tested all features thoroughly
- [✅] ✅ I understand what monolithic architecture is
- [✅] ✅ I can explain my code to someone else
- [✅] ✅ My README helps someone else run my code
- [✅] ✅ My reflection answers are thoughtful
- [✅] ✅ My Git history shows my progress
- [✅] ✅ I'm proud of what I built! 🎉

---

## 🎉 CONGRATULATIONS!

You've completed Week 3 Lab!

**Key Achievements:**
- ✅ Built a full-stack application
- ✅ Implemented REST API
- ✅ Used SQLite database
- ✅ Created interactive UI
- ✅ Practiced Git workflow
- ✅ Understood Monolithic Architecture

**Keep this code!** We'll refactor it to Layered Architecture in Week 4!

---

*TODO Checklist v1.0*  
*ENGSE207 Software Architecture - Week 3*  
*Print and check off as you go! ✓*
