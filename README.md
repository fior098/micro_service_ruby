# School API Service

REST API сервис для управления учениками и классами школы.  
Реализован на Ruby on Rails с базой данных PostgreSQL.  
Полностью контейнеризирован с помощью Docker.

## Технологии

- Ruby 3.2
- Ruby on Rails 7.1 (API mode)
- PostgreSQL 15
- Docker / Docker Compose

## Быстрый старт

### Требования

- Docker
- Docker Compose

### Запуск

```bash
git clone <your-repo-url>
cd school-api
cp .env.example .env
docker compose up