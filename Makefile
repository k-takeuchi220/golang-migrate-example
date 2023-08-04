migrate-create:
	migrate create -ext sql -dir ${PWD}/database/migrations -seq ${class}
# examle: make migrate-create class=users

migrate-run:
	docker run -v ${PWD}/database/migrations:/migrations --network=network migrate/migrate -path=/migrations/ -database "mysql://root:password@tcp(go-mysql)/example-db" up

migrate-rollback:
	docker run -itv ${PWD}/database/migrations:/migrations --network=network migrate/migrate -path=/migrations/ -database "mysql://root:password@tcp(go-mysql)/example-db" down
