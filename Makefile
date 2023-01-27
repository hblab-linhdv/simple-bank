migrateup:
	migrate -path db/migration -database "postgresql://postgres:admin@localhost:5432/simple-bank?sslmode=disable" -verbose up
migrateup1:
	migrate -path db/migration -database "postgresql://postgres:admin@localhost:5432/simple-bank?sslmode=disable" -verbose up 1
migratedown:
	migrate -path db/migration -database "postgresql://postgres:admin@localhost:5432/simple-bank?sslmode=disable" -verbose down
migratedown1:
	migrate -path db/migration -database "postgresql://postgres:admin@localhost:5432/simple-bank?sslmode=disable" -verbose down 1
migratecreate:
	migrate create -ext sql -dir db/migration -seq add_users
sqlc:
	sqlc generate

sqlc-docker:
	docker pull kjconroy/sqlc
	docker run --rm -v "%cd%:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	go mod download github.com/golang/mock
	go mod tidy
	mockgen -package mockdb -destination db/mock/store.go github.com/hblab-linhdv/simplebank/db/sqlc Store

