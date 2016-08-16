# Running

To get a clean `go-server` box:

```bash
make clean # (optional, to start fresh if you ran this previously)
make config
docker-compose up
```

# Restoring a backup

1. Do a dry run of gocd (i.e. `docker-compose up` has succeeded)
1. Place the following backup files in `./backups`
   ```
   # these come from a go backup
   config-dir.zip
   config-repo.zip
   db.zip

   # the ssh keys
   .ssh/
   ```
1. run `./bin/restore_backup`

