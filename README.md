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

