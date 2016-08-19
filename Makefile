default: _volumes_scaffold _copy_ssh
	@echo "==> building images"
	docker-compose build --no-cache

clean:
	docker-compose down || true
	sudo -v
	sudo rm -rf ./volumes
	sudo rm -rf ./gocd-agent/ssh
	sudo rm -rf ./gocd-server/ssh

_volumes_scaffold:
	@echo "==> creating volumes scaffold (to be mounted on containers)"
	mkdir -p ./volumes/go-server/var/lib/go-server/artifacts
	mkdir -p ./volumes/go-server/etc/go
	mkdir -p ./volumes/go-server/var/go
	mkdir -p ./volumes/go-agent/var/go
	@echo "==> chowning with go user/group id (used by containers)"
	sudo chown -R 999:999 ./volumes/go-server

_copy_ssh:
	@echo "==> own ssh"
	sudo chown -R $$(id -u):$$(id -g) ./ssh/.ssh
	@echo "==> copying ssh folders to be added to containers"
	sudo cp -r --preserve=all ./ssh ./gocd-agent/
	sudo cp -r --preserve=all ./ssh ./gocd-server/
