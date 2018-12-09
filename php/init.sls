php_installation:
  pkg.installed:
    - pkgs:
      - php7.2
      - php-mysql
      - php-fpm


  file.managed:
    - source: salt://LAMP/php//php.ini

/home/xubuntu/public_html/index.php:
  file.managed:
    - source: salt://php/index.php

php.check:
 service.running:
   - name: nginx
   - watch:
     - file: /etc/apache2/mods-available/php7.2.conf
     - file: /home/xubuntu/public_html/index.php

