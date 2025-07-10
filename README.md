# Posera API

Laravel-powered backend for **Posera**, a custom POS system designed for sari-sari stores and beyond. Built for simplicity now, with growth and modularity in mind.

---

## 🚀 Quick Start (For Developers)

This project runs inside Docker and will **auto-setup everything**: environment, dependencies, database, and Laravel initialization.

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

- Build the PHP + Laravel container
- Create `.env` file if missing
- Generate the Laravel `APP_KEY`
- Wait for MySQL to be ready
- Run database migrations automatically
- Set permissions for Laravel storage/cache
- Start the app via Nginx

Access the app via:  
📍 http://localhost:8000

---

## 🔁 Daily Use

After initial setup, just run:

```bash
docker compose up
```

The containers will reuse existing builds and run smoothly.

---

## 🗂 Project Structure

| Path                 | Description                                      |
|----------------------|--------------------------------------------------|
| `/posera-api`        | Laravel app root                                 |
| `/docker/`           | Nginx and container config                        |
| `Dockerfile`         | PHP + Laravel container build instructions       |
| `docker-compose.yml` | Defines app, web server, and database containers |
| `bootstrap.sh`       | Startup script: waits for MySQL, runs Laravel setup |

---

## 🧪 Verifying It Works

To verify Laravel is running:

```bash
docker logs -f posera-app
```

You should see:

```
✅ Bootstrap complete. Laravel is ready!
```

Visit [http://localhost:8000](http://localhost:8000) — Laravel welcome page should appear.

---

## 📦 Laravel Features Enabled

- MySQL 10.5 (via MariaDB)
- Auto-run migrations on boot
- `.env` auto-generation
- `bootstrap.sh` handles setup every run
- Queue, Cache, and Session drivers configured

---

## ⚙️ Environment Overview

- DB: `MySQL` via Docker container `posera-db`
- Laravel backend: `php-fpm` in `posera-app`
- Web server: `nginx` container `posera-nginx`
- Database credentials are defined in `.env` and injected at runtime

---

## 🚀 Future Scaling (Optional)

When you're ready for remote devs, CI/CD, or production:

### Build and push your own image:

```bash
docker build -t yourname/posera-api:latest .
docker push yourname/posera-api:latest
```

Then update `docker-compose.yml`:

```yaml
services:
  app:
    image: yourname/posera-api:latest
```

💡 Now others can start with:

```bash
docker compose pull
docker compose up
```

---

## 🧼 Resetting Everything (Hard Rebuild)

Use this to fully reset the environment:

```bash
docker compose down -v
rm -rf vendor/ database/database.sqlite
docker compose up --build
```

---

## 🛠 Troubleshooting

### MySQL Access Denied?

- Ensure `.env` DB credentials match those in `docker-compose.yml`
- Run `docker exec -it posera-db mysql -u root -p` and verify

### Cache Table Missing?

Bootstrap script now runs migrations automatically on first boot.

---

## 🛣 What's Next

The frontend (`/posera-frontend`) using **Vue 3 + TailwindCSS** will interact with this API and share auth via token-based headers (coming soon).

---

## 👋 About

**Posera** is a proudly Filipino-made POS system built for sari-sari stores, with big plans to scale into grocery chains and commercial use — all starting from one passionate developer. 🇵🇭
