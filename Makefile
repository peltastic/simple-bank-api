postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e  POSTGRES_PASSWORD=secret -d postgres:14-alpine

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it postgres14 dropdb --username=root --owner=root simplebank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down
migratedown1:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

sqlcdocker: 
	 docker run --rm -v ${pwd}:/src -w /src kjconroy/sqlc generate	

test: 
	go test -v -cover ./...
	
server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/peltastic/simple-bank-api/db/sqlc Store


.PHONY: postgres createdb dropdb migrateup migratedown sqlc sqlcdocker server mock migratedown1 migratedown1
	