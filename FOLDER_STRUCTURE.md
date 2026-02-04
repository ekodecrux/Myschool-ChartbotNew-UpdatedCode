# MySchool Chatbot - Project Structure

```
myschool-chatbot4/
├── client/                          # Frontend React Application
│   ├── public/                      # Static assets
│   ├── src/
│   │   ├── components/              # React components
│   │   │   ├── ui/                  # UI components (button, card, etc.)
│   │   │   ├── ChatWidget.tsx       # Main chat interface
│   │   │   ├── SimpleText.tsx       # Text rendering component
│   │   │   ├── OnboardingTutorial.tsx # User onboarding
│   │   │   ├── DashboardLayout.tsx  # Dashboard layout
│   │   │   └── ErrorBoundary.tsx    # Error handling
│   │   ├── contexts/                # React contexts
│   │   │   └── ThemeContext.tsx     # Theme management
│   │   ├── hooks/                   # Custom hooks
│   │   │   ├── useComposition.ts
│   │   │   ├── useMobile.tsx
│   │   │   └── usePersistFn.ts
│   │   ├── lib/                     # Utility libraries
│   │   │   ├── trpc.ts              # tRPC client setup
│   │   │   └── utils.ts             # Helper functions
│   │   ├── pages/                   # Page components
│   │   │   ├── Home.tsx             # Homepage
│   │   │   ├── Dashboard.tsx        # Dashboard page
│   │   │   └── NotFound.tsx         # 404 page
│   │   ├── App.tsx                  # Main application component
│   │   ├── main.tsx                 # Entry point
│   │   ├── index.css                # Global styles
│   │   └── const.ts                 # Constants
│   └── index.html                   # HTML template
│
├── dist/                            # Production build output
│   ├── public/                      # Compiled frontend assets
│   │   ├── assets/                  # JS, CSS bundles
│   │   └── index.html               # Production HTML
│   └── index.js                     # Compiled server code
│
├── drizzle/                         # Database schema and migrations
│   ├── meta/                        # Migration metadata
│   ├── migrations/                  # SQL migrations
│   ├── schema.ts                    # Database schema definitions
│   └── relations.ts                 # Table relationships
│
├── .env                             # Environment variables (not in repo)
├── package.json                     # Dependencies and scripts
├── pnpm-lock.yaml                   # Lock file
├── tsconfig.json                    # TypeScript configuration
├── vite.config.ts                   # Vite build configuration
├── drizzle.config.ts                # Drizzle ORM configuration
├── components.json                  # ShadcnUI configuration
├── deploy.sh                        # Deployment script
├── DEPLOYMENT_GUIDE.md              # Deployment instructions
├── FOLDER_STRUCTURE.md              # This file
└── README.md                        # Project overview
```

---

## Key Files Description

### Frontend (client/)

| File | Description |
|------|-------------|
| `ChatWidget.tsx` | Main chat interface with voice input, multilingual support, and search functionality |
| `SimpleText.tsx` | Renders markdown-like text responses |
| `App.tsx` | Application root with routing and theme provider |
| `trpc.ts` | tRPC client configuration for API calls |
| `ThemeContext.tsx` | Light/dark theme management |

### Backend (compiled to dist/)

| Component | Description |
|-----------|-------------|
| `routers.ts` | API endpoints for chat, autocomplete, analytics |
| `translation_util.ts` | Multi-language translation using Groq |
| `enhancedSemanticSearch.ts` | Search with spell correction and matching |
| `db.ts` | Database connection and user management |

### Database (drizzle/)

| Table | Purpose |
|-------|--------|
| `users` | User accounts and roles |
| `search_analytics` | Search query tracking |
| `resource_clicks` | Resource interaction logs |
| `chat_messages` | Conversation history |

---

## Build Commands

```bash
# Install dependencies
npm install

# Development mode
npm run dev

# Production build
npm run build

# Start production server
npm start

# Type checking
npm run check

# Database migrations
npm run db:push
```

---

## Environment Variables

```env
GROQ_API_KEY=           # Required for translation
DATABASE_URL=           # MySQL connection string
JWT_SECRET=             # Session encryption key
NODE_ENV=               # production or development
PORT=                   # Server port (default: 3000)
```

---

**Developed by Abhishek & Mahesh**
