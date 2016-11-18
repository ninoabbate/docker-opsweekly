#!/bin/sh

# Wait 5 seconds because the mysql server doesn't accept connections at early startup
sleep 5

# Init opsweekly database
mysqladmin create opsweekly \
  && mysqladmin -f drop test \
  && mysql < /install.sql \
  && mysql opsweekly < /opsweekly.sql 
