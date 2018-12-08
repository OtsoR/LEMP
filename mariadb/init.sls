mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed

/tmp/create_user.sql:
  file.managed:
    - mode: 600
    - source: salt://LAMP/mariadb/komennot.sql

'cat /tmp/create_user.sql | sudo mariadb -u root':
  cmd.run:
    - unless: "echo 'show databases' | sudo mariadb -u- root | grep '^heppa$'"

/home/xubuntu/.my.cnf:
  file.managed:
    - source: salt://LAMP/mariadb/.my.cnf
    - replace: False
    - user: xubuntu
    - group: xubuntu

#   - (mode: 600) # this is not necessary
#   You need to give sudo chown root.salt .my.cnf  



# these do not work correctly

#/tmp/.my.cnf:
#  file.managed:
#    - mode: 744
#    - source: salt://LAMP/.my.cnf

#'sudo cp /tmp/.my.cnf /home/$USER/.my.cnf':
# cmd.run:
#    - unless: "echo 'show databases' | sudo mariadb -u- root | grep '^heppa$'"
#    - onlyif: "echo 'show databases' | sudo mariadb -u- root | grep '^heppa$'"
