# Clear existing files
#
rm hello-world.php php.ini README.md
# Install phpmyadmin
#
phpmyadmin-ctl install
# Install and configure PHP 7.1 Ondrej Repository
#
sudo add-apt-repository ppa:ondrej/php -y
# sudo add-apt-repository ppa:nijel/phpmyadmin -y
sudo apt-get update
sudo apt-get install libapache2-mod-php7.1 -y
sudo a2dismod php5
sudo a2enmod php7.1
sudo apt-get install php7.1-curl php7.1-cli php7.1-dev php7.1-gd php7.1-intl php7.1-mcrypt php7.1-json php7.1-mysql php7.1-opcache php7.1-bcmath php7.1-mbstring php7.1-soap php7.1-xml php7.1-zip -y

#Install Laravel
#
sudo composer global require 'laravel/installer'
export PATH=~/.composer/vendor/bin:$PATH
sudo chown -R $USER $HOME/.composer
laravel new 
rm -rf ./composer

#Configure public folder
#
printf '%s\n' ':%s/DocumentRoot\ \/home\/ubuntu\/workspace/DocumentRoot\ \/home\/ubuntu\/workspace\/public/g' 'x'  | sudo ex /etc/apache2/sites-enabled/001-cloud9.conf

#Select and install the mysql version 5.7 or up
#
wget https://dev.mysql.com/get/mysql-apt-config_0.8.9-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.9-1_all.deb
sudo service apache2 restart
sudo apt-get update
sudo apt-get install mysql-server -y 
sudo service  mysql restart 
sudo mysql_upgrade

#Configure database and .env file database=laravel, user=root, no password
#
sudo mysql --user="root" -e "CREATE DATABASE laravel character set UTF8mb4 collate utf8mb4_bin;"
printf '%s\n' ':%s/DB_DATABASE=homestead/DB_DATABASE=laravel/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_USERNAME=homestead/DB_USERNAME=root/g' 'x'  | sudo ex .env
printf '%s\n' ':%s/DB_PASSWORD=secret/DB_PASSWORD=/g' 'x'  | sudo ex .env

#Artisan auth scaffolding and migration
#
php artisan make:auth
php artisan migrate

# Reinstall phpmyadmin
#
phpmyadmin-ctl install
#remove laravel installer
#
rm -rf test.sh
rm -rf laravel.sh
rm -rf mysql-apt-config_0.8.9-1_all.deb

sudo service apache2 restart
sudo service mysql restart
#Edited by Bretfelean Sorin Cristian
