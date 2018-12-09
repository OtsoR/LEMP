nginx:
  pkg.installed

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/default

/var/www/example.com/html/index.html:
  file.managed:
    - source: salt://nginx/index.html
    - makedirs: true

/etc/nginx/sites-available/example.com:
  file.managed:
    - source: salt://nginx/example.com

/etc/nginx/sites-enabled/example.com:
  file.symlink:
    - target: /etc/nginx/sites-available/example.com

/etc/hosts:
  file.managed:
    - source: salt://nginx/hosts

nginx_service:
  service.running:
    - name: nginx
    - watch:
      - file: /etc/nginx/sites-available/default
      - file: /etc/nginx/sites-available/example.com
