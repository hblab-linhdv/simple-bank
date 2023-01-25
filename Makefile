migrateup:
	migrate -path db/migration -database "postgresql://postgres:admin@localhost:5432/simple-bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://postgres:admin@localhost:5432/simple-bank?sslmode=disable" -verbose up
sqlc:
	sqlc generate

sqlc-docker:
	docker pull kjconroy/sqlc
	docker run --rm -v "%cd%:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

