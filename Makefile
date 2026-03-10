APP_CONTAINER=simple_crud

install:
	docker-compose down -v
	docker-compose up -d --build
	sleep 10
	docker exec $(APP_CONTAINER) composer install
	docker exec $(APP_CONTAINER) php artisan key:generate
	docker exec $(APP_CONTAINER) php artisan migrate
	docker exec $(APP_CONTAINER) php artisan optimize:clear
	docker exec $(APP_CONTAINER) php artisan optimize

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

bash:
	docker exec -it $(APP_CONTAINER) bash

migrate:
	docker exec $(APP_CONTAINER) php artisan migrate

optimize:
	docker exec $(APP_CONTAINER) php artisan optimize

clear:
	docker exec $(APP_CONTAINER) php artisan optimize:clear