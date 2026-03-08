APP_CONTAINER=simple_crud
DB_CONTAINER=laravel_mysql

install:
	docker compose down -v
	docker compose up -d --build
	docker exec -it $(APP_CONTAINER) composer install
	docker exec -it $(APP_CONTAINER) npm install
	docker exec -it $(APP_CONTAINER) php artisan key:generate
	docker exec -it $(APP_CONTAINER) php artisan cache:table || true
	docker exec -it $(APP_CONTAINER) php artisan migrate
	docker exec -it $(APP_CONTAINER) php artisan optimize:clear
	docker exec -it $(APP_CONTAINER) php artisan optimize

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

bash:
	docker exec -it $(APP_CONTAINER) bash

composer-install:
	docker exec -it $(APP_CONTAINER) composer install

composer-update:
	docker exec -it $(APP_CONTAINER) composer update

npm-install:
	docker exec -it $(APP_CONTAINER) npm install

npm-update:
	docker exec -it $(APP_CONTAINER) npm update

npm-dev:
	docker exec -it $(APP_CONTAINER) npm run dev

npm-build:
	docker exec -it $(APP_CONTAINER) npm run build

migrate:
	docker exec -it $(APP_CONTAINER) php artisan migrate

optimize:
	docker exec -it $(APP_CONTAINER) php artisan optimize

clear:
	docker exec -it $(APP_CONTAINER) php artisan optimize:clear