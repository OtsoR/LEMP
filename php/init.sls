php_installation:
  pkg.installed:
    - pkgs:
      - php7.2
      - php-mysql
      - php-fpm

/etc/php/7.2/fpm/php.ini:
  file.managed:
    - source: salt://php//php.ini

/home/xubuntu/public_html/index.php:
  file.managed:
    - source: salt://php/index.php

php.check:
 service.running:
   - name: php7.2-fpm
   - watch:
     - file: /home/xubuntu/public_html/index.php
     - file: /etc/php/7.0/fpm/php.ini

