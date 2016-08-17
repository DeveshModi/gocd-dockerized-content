default:
	@echo "==> creating volumes scaffold (to be mounted on containers)"
	mkdir -p ./volumes/go-server/var/lib/go-server/artifacts
	mkdir -p ./volumes/go-server/etc/go
	mkdir -p ./volumes/go-server/var/go
	@echo "==> chowning with go user/group id (used by containers)"
	sudo chown -R 999:999 ./volumes/go-server
	@echo "==> building containers"
	docker build --no-cache ./gocd-agent
	docker build --no-cache ./gocd-server

clean:
	sudo -v
	docker-compose down || true
	sudo rm -rf ./volumes
