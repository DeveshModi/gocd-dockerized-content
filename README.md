# Running

To get a clean `go-server` box:

```bash
make clean # (optional, to start fresh if you ran this previously)
make config
docker-compose up
```

# Restoring a backup

1. Place the following backup files in `./backups`
```
config-dir.zip
config-repo.zip
db.zip
```
2. run `./bin/restore_backup`
