# Simple CRUD Product Management (Laravel + Docker)
## Overview

This project is a simple Product Management CRUD application built using Laravel.
It allows users to perform basic operations on products: 

- **Display product list**
- **Add new products** 
- **Edit existing products**
- **Delete products**

The application is fully containerized using Docker, making it easy to run the entire development environment with minimal setup.

The project uses Laravel for the backend, Vue.js with Vite for the frontend build system, and runs inside Docker containers.

---
## Project Architecture

The application runs using multiple Docker containers that work together. 

### Containers Used
 

| Container | Purpose|
| ------ | ------ |
| PHP App| Runs the Laravel backend|
| Nginx| Serves the web application|
| Node| Compiles frontend assets using Vite|
| MySQL| Database server|
| phpMyAdmin| Web-based database management|
  

#### Technologies Used
- Laravel 
- Nginx
- PHP
- MySQL
- Node.js
- Vite
- Docker
- phpMyAdmin
 
---

### First Time Setup (After Cloning the Repository)

**Clone the repository:**

git clone <repository-url>

**Go to the project directory:**

cd TestTask

**Run the setup command:**

make install

**This single command will:**

1. Stop existing containers

2. Rebuild Docker containers

3. Install PHP dependencies using Composer

4. Generate Laravel application key

5. Run database migrations

6. Optimize the Laravel application

After installation finishes, the application will be running.

---

### Application URLs

**Laravel Application**

http://task.test

**phpMyAdmin**

http://pma.test

**Database credentials:**

Host: db
Database: simple_crud_db
User: laravel_user
Password: password
Root Password: root

---

### Host File Configuration

Add these entries to your system hosts file:

127.0.0.1 task.test
127.0.0.1 pma.test

Windows path:

C:\Windows\System32\drivers\etc\hosts

Linux / Mac path:

/etc/hosts

---
### Makefile Commands
The project uses a Makefile to simplify common commands.

#### Install Project
make install

Rebuilds containers and prepares the Laravel application.

#### Start Containers
make up

#### Stop Containers
make down

#### View Logs
make logs

#### Enter Laravel Container
make bash

#### Run Migrations
make migrate

#### Optimize Laravel
make optimize

#### Clear Laravel Cache
make clear

---
### Development Workflow

Typical development flow:

**Start containers**

make up

**Open application**

http://task.test

Frontend assets automatically rebuild through the Vite server.

## Summary
This project demonstrates a clean Docker-based development environment for a Laravel CRUD application.

Key benefits of this setup:

- Consistent environment using Docker

- Easy setup using a single command

- Separation of services using containers

- Frontend asset compilation using Node and Vite

- Database management using phpMyAdmin

---

# Written Knowledge Question

## 1. Have you ever built a multi-stage Dockerfile? If yes, walk us through why you split the stages the way you did and what it saved you.

I have not yet implemented a full multi-stage Dockerfile in one of my projects, but I understand how it works and why it is useful.

A multi-stage Dockerfile is a technique where multiple build stages are defined in a single Dockerfile. Each stage is responsible for a specific task, such as building assets or compiling dependencies. For example, in Laravel the first stage could install Node dependencies and build frontend assets, while the final stage would only copy the compiled assets and PHP application.


---

## 2. If two containers need to talk to each other but neither should be exposed to the outside world, how do you set that up?

A containers can communicate through an internal network created by Docker Compose.
Place both containers in the same Docker network and do not expose their ports to the host machine. 

---
## 3. What is the difference between a bind mount and a named volume, and when would you use one over the other?

A bind mount links a folder on the host machine directly to a folder inside the container. A named volume is managed entirely by Docker.

---

## 4. Your database container starts before your app is ready and the app crashes on boot because the connection is not available yet. How do you solve that?

Use a wait script. A script can be added to the application container that waits until the database is available before starting the app.


---

## 5. What does a production Dockerfile look like versus a development one? What changes and why?

A development Dockerfile usually includes debugging tools, hot reload tools, bind mounts, and development dependencies. While the production dockerfile focuses on smaller image size, faster startup, security, and fewer dependencies.

---

## 6. Walk us through how you would handle environment-specific configuration — dev, staging, prod — without duplicating your entire compose file.

This can be handled using environment files since the in Docker Compose, the correct file can be loaded depending on the environment.

---

## 7. How do you make sure a secret like a database password never ends up in your image or your git history?

Secrets should never be hardcoded in the Dockerfile or committed to Git, use environment variables instead.

---

## 8. Your container is running but the app inside it is hanging. It is not crashing, just unresponsive. How do you debug that without restarting it?

Commands like `top` or `ps` can help identify processes that are blocking or consuming resources. This allows debugging without restarting or stopping the container.

---

## 9. What is a health check and why does it matter beyond just "is the container running"?

A **health check** is a command that periodically verifies whether a container is functioning correctly. Health checks allow systems to detect these situations automatically.

---

## 10. If you had to bring an entire stack up — app, database, reverse proxy — run migrations, and seed data, all in one command, how would you build that?

This can be automated using **Docker Compose** combined with a task runner like a **Makefile**.


