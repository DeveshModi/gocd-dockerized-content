default:

config:
	mkdir -p ./volumes/go-server/var/lib/go-server
	mkdir -p ./volumes/go-server/etc/go
	mkdir -p ./volumes/go-server/var/go
	sudo chown -R 999:999 ./volumes/go-server

clean:
	sudo -v
	docker-compose down
	sudo rm -rf ./volumes

restore_backup: clean config
	docker-compose --rm up
	sudo -v
	sudo unzip ./backups/db.zip -d ./volumes/go-server/var/lib/go-server/db/h2db
	sudo unzip ./backups/config-dir.zip -d ./volumes/go-server/etc/go
	sudo unzip ./backups/config-repo.zip -d ./volumes/go-server/var/lib/go-server/db/config.git
