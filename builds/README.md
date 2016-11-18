# Opsweekly builds

Opsweekly consists of two containers:
- aabbate/opsweeklydb which is built starting from aabbate/mariadb container
- aabbate/opsweekly which is built from scratch

Both containers use Alpine Linux as base. The `firstbuild.sh` script for opsweeklydb is used only for the first build, in order to initialize the database and to add the schema.
