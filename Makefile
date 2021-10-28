INSOMNIA_DIR="/Users/paulo.koch/Library/Application Support/Insomnia/"

create-dirs: 
	[ ! -d "json-server/data/" ] && mkdir -p json-server/data/ || true
	[ ! -d "insomnia-inso/data/" ] && mkdir -p insomnia-inso/data/ || true
	[ ! -d "kong/data/" ] && mkdir -p kong/data/ || true
	[ ! -d "postgres/data/" ] && mkdir -p postgres/data/ || true

setup: create-dirs
	[ -f "json-server/data/db.json" ] || cp docs/assets/db.json.example json-server/data/db.json
	[ -d $(INSOMNIA_DIR) ] && cp -r $(INSOMNIA_DIR) insomnia-inso/data/ || true

	@docker-compose build
	@docker-compose up -d
clean:
	rm -rf json-server/data
	rm -rf insomnia-inso/data
	rm -rf postgres/data
	rm -rf kong/data

	@docker-compose down -v

inso-lint-spec:
	@docker-compose run --rm inso lint spec

inso-run-test:
	@docker-compose run --rm inso run test

inso-generate-config:
	@docker-compose run --rm inso generate config
	
exec-kong:
	@docker-compose exec kong bash

exec-postgres:
	@docker-compose exec postgres bash

.PHONY: setup create-dirs clean inso-lint-spec inso-run-test inso-generate-config exec-kong exec-postgres