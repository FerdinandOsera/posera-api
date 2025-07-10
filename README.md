# Posera API

Laravel-powered backend for **Posera**, a custom POS system designed for sari-sari stores and beyond. Built for simplicity now, with growth and modularity in mind.

---

## 🚀 Quick Start (For Developers)

This project runs inside Docker and will **auto-setup everything** (dependencies, `.env`, SQLite database, permissions, etc.).

### ✅ Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Optional: [Visual Studio Code](https://code.visualstudio.com/) with Docker extension

---

## 🐳 First-Time Setup

```bash
cd posera-api
docker compose up --build
```

This will:

- Install PHP dependencies via Composer
- Create `.env` if not found
- Generate `APP_KEY`
- Create SQLite database if missing
- Set Laravel permissions
- Start the app via Nginx

Once running, access at:  
📍 http://localhost:8000

---

## 🔁 Daily Use

After the first build, just run:

```bash
docker compose up
```

---

## 🗂 Project Structure

| Path               | Description                          |
|--------------------|--------------------------------------|
| `/posera-api`      | Laravel app root                     |
| `/docker/`         | Nginx config                         |
| `Dockerfile`       | PHP + Laravel container build        |
| `docker-compose.yml` | Defines app + web server services  |
| `bootstrap.sh`     | Auto-run setup script inside the container |

---

## 🧪 Verifying It Works

Run:

```bash
docker logs -f posera-app
```

Look for:

```
GET /index.php" 200
```

Visit http://localhost:8000 — you should see the Laravel welcome page.

---

## ⚙️ Current Setup (Local Docker Build)

This setup is optimized for:

- Solo development
- Small team (1–2 developers)
- Rapid iteration with full Laravel access

When you run:

```bash
docker compose up --build
```

Everything is built fresh, ensuring consistency and allowing troubleshooting during early development.

---

## 🚀 Future Scaling (Optional)

When you're ready to grow the team or introduce CI/CD pipelines:

### Build and push your image:

```bash
docker build -t yourname/posera-api:latest .
docker push yourname/posera-api:latest
```

### Update `docker-compose.yml` to:

```yaml
services:
  posera-app:
    image: yourname/posera-api:latest
```

💡 This allows new developers to get started with:

```bash
docker compose pull
docker compose up
```

### Benefits:

- Much faster setup time
- Ideal for onboarding and automation
- Ensures known-good builds are used

---

## 🧼 Troubleshooting

To fully reset the environment:

```bash
docker compose down -v
rm -rf vendor/ database/database.sqlite
docker compose up --build
```

---

## 🛣 What's Next

Frontend (Vue + Tailwind) will live in `/posera-frontend` and communicate via API.

---

## 👋 About

**Posera** is a proudly Filipino-made POS system built for sari-sari stores, with big plans to scale into grocery chains and commercial use — all starting from one passionate developer. 🇵🇭
