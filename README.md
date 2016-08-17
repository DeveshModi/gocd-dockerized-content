# Running

To get a clean `go-server` box:
1. put the ssh keys (used by git) in `./ssh/.ssh`

2. Start it up
   ```bash
   make clean # (optional, to start fresh if you ran this previously)
   make config
   make
   docker-compose up
   ```

# Restoring a backup

1. Do a dry run of gocd (i.e. described in prev. section)
1. Place the following backup files in `./backups`
   ```
   # these come from a go backup
   config-dir.zip
   config-repo.zip
   db.zip
   ```
1. run `./bin/restore_backup`

