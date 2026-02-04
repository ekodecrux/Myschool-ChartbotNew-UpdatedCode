# MySchool Chatbot

An intelligent educational assistant chatbot for MySchool platform, supporting multilingual queries in English, Hindi, Telugu, and Gujarati.

## Features

- **Multilingual Support**: Automatic translation for Telugu, Hindi, and Gujarati queries
- **Voice Input**: Speech-to-text for hands-free interaction
- **Smart Search**: Intelligent search with spell correction and semantic matching
- **Resource Navigation**: Direct links to educational resources on portal.myschoolct.com
- **Responsive Design**: Works on desktop and mobile devices

## Tech Stack

- **Frontend**: React 19, TypeScript, TailwindCSS v4
- **Backend**: Node.js, Express, tRPC
- **Database**: MySQL with Drizzle ORM
- **Translation**: Groq API (LLaMA-3)
- **Build**: Vite, esbuild

## Quick Start

```bash
# Install dependencies
npm install

# Configure environment
cp .env.example .env
# Edit .env with your credentials

# Run development server
npm run dev

# Build for production
npm run build

# Start production server
npm start
```

## Environment Setup

Create a `.env` file with:

```env
GROQ_API_KEY=your_groq_api_key
DATABASE_URL=mysql://user:password@localhost:3306/myschool
JWT_SECRET=your_jwt_secret
NODE_ENV=production
```

## Supported Languages

| Language | Code | Example Query |
|----------|------|---------------|
| English | en | "Class 5 Maths" |
| Hindi | hi | "कक्षा 5 गणित" |
| Telugu | te | "జంతువుల చిత్రాలు" |
| Gujarati | gu | "વિજ્ઞાન પરીક્ષા" |

## Documentation

- [Deployment Guide](./DEPLOYMENT_GUIDE.md) - Hostinger deployment instructions
- [Folder Structure](./FOLDER_STRUCTURE.md) - Project organization

## Live Sites

- **Production**: https://myschoolchatbot.in
- **Demo**: https://demo.myschoolchatbot.in

## License

MIT License

---

**Developed by Abhishek & Mahesh**
