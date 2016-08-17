default:
	@echo "==> creating volumes scaffold (to be mounted on containers)"
	mkdir -p ./volumes/go-server/var/lib/go-server/artifacts
	mkdir -p ./volumes/go-server/etc/go
	mkdir -p ./volumes/go-server/var/go
	@echo "==> chowning with go user/group id (used by containers)"
	sudo chown -R 999:999 ./volumes/go-server
	@echo "==> copying ssh folders to be added to containers"
	sudo cp -r ./ssh/.ssh ./gocd-agent/
	sudo cp -r ./ssh/.ssh ./gocd-server/
	@echo "==> building images"
	docker-compose build

clean:
	docker-compose down || true
	sudo -v
	sudo rm -rf ./volumes
