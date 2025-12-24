# Architecture Diagram

## High-Level Architecture


┌─────────────────────────────────────────────────────────┐
│                     CLIENT (Browser)                    │
│                    (HTML/CSS/JavaScript)                │
└─────────────────────────────────────────────────────────┘
                           │
                           │ HTTP Requests
                           ▼
┌─────────────────────────────────────────────────────────┐
│              PRESENTATION LAYER (Controllers)           │
│                                                         │
│  ┌──────────────┐    ┌─────────────────────────┐        │
│  │Task          │    │  - Input Validation     │        │
│  │Controller    │───▶│  - Response Formatting  │        │
│  └──────────────┘    │  - HTTP Error Handling  │        │
│                      └─────────────────────────┘        │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│            BUSINESS LOGIC LAYER (Services)              │
│                                                         │
│  ┌──────────────┐    ┌─────────────────────────┐        │
│  │Task          │    │  - Business Rules       │        │
│  │Service       │───▶│  - Validation Logic     │        │
│  └──────────────┘    │  - Orchestration        │        │
│                      └─────────────────────────┘        │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│           DATA ACCESS LAYER (Repositories)              │
│                                                         │
│  ┌──────────────┐    ┌─────────────────────────┐        │
│  │Task          │    │  - CRUD Operations      │        │
│  │Repository    │───▶│  - Query Execution      │        │
│  └──────────────┘    │  - Data Mapping         │        │
│                      └─────────────────────────┘        │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
                   ┌──────────────┐
                   │   DATABASE   │
                   │   (SQLite)   │
                   └──────────────┘

## Data Flow Example: Create Task

1. Client sends POST /api/tasks
   ↓
2. TaskController.createTask()
   - Validates HTTP request
   - Extracts data
   ↓
3. TaskService.createTask(data)
   - Validates business rules
   - Applies business logic
   ↓
4. TaskRepository.create(task)
   - Executes SQL INSERT
   - Returns created task
   ↓
5. Response flows back up
   Repository → Service → Controller → Client
