setup:
	npm install

dev:
	npm run predev
	npm run dev

build:
	npm run build

start:
	npm run sequelize.dbmigrate
	npm run start

ansible-generate-env:
	cp .env.example .env

test:
	NODE_ENV=test docker compose -f docker-compose.yml -f docker-compose.override.yml run --rm --build app npm run pretest && \
	NODE_ENV=test docker compose -f docker-compose.yml -f docker-compose.override.yml run --rm --build app npm run test

dev-up:
	docker compose -f docker-compose.yml -f docker-compose.override.yml up --build -d

dev-down:
	docker compose -f docker-compose.yml -f docker-compose.override.yml down

prod-up:
	docker compose -f docker-compose.yml up --build -d

prod-down:
	docker compose -f docker-compose.yml down

ci:
	make test