php_installation:
  pkg.installed:
    - pkgs:
      - php7.2
      - libapache2-mod-php7.2
      - php-mysql

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://LAMP/php//php.conf

/home/xubuntu/public_html/index.php:
  file.managed:
    - source: salt://LAMP/php/default-index.php

php.check:
 service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-available/php7.2.conf
     - file: /home/xubuntu/public_html/index.php

