# dokuwiki-web-vyfuk
Repo of Výfuk's website

## Instalation
  1. Download and install Apache with PHP 7.3 (Windows - XAMPP; Linux & MacOS - apache2 package).
  2. Clone this repo & run `git submodule update --init --recursive`.
  3. Configure apache to listen to 8080 port (Windows - `XAMPP\Apache\conf\httpd.conf`; Linux & MacOS - `/etc/apache/httpd.conf`):
```
Listen 80
Listen 8080
```
  4. Configure **vyfuk.local** to redirect to localhost (Windows - `C:\Windows\System32\drivers\etc\hosts`; Linux & MacOS - `/etc/hosts`):
```
127.0.0.1 vyfuk.local
```
  5. Add following configuration to appache conf (Windows - `XAMPP\Apache\conf\extra\httpd-vhosts.conf`; Linux & MacOS - `/etc/apache/sites-enabled`):
 ```xml
<Directory "/path/to/web/root"> # Add your path to web root here
	Options FollowSymLinks
	AllowOverride All
	Require all granted
</Directory>

<VirtualHost *:8080> 
    DocumentRoot "/path/to/web/root" # Add your path to web root here
    ServerName vyfuk.local
</VirtualHost>
```
  6. Remove **.dist** extension from _acl.auth.php.dist_, _local.php.dist_ & _users.auth.php.dist_.
  7. Enter **http://vyfuk.local:8080** in your browser
  8. Profit
