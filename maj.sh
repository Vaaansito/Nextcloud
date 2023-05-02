confirmation="N"

while [ "$confirmation" != "O" ] && [ "$confirmation" != "o" ]
do
    echo "Entrez l'ancienne version (exemple : 25.0.0):"
    read VERSION_ANCIENNE
    echo "Entrez la nouvelle version (exemple : 25.0.1):"
    read VERSION_NOUVELLE

    echo "Vous avez pour but de passer de $VERSION_ANCIENNE vers $VERSION_NOUVELLE."

    echo "Confirmez-vous cette information ? (O/N)"
    read confirmation
done

wget https://download.nextcloud.com/server/releases/nextcloud-$VERSION_NOUVELLE.zip -O /var/www/nextcloud-$VERSION_NOUVELLE.zip
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --on
mv /var/www/nextcloud var/www/nextcloud-$VERSION_ANCIENNE
unzip nextcloud-$VERSION_NOUVELLE.zip -d /var/www/
cp /var/www/ nextcloud-$VERSION_ANCIENNE/config/config.php nextcloud/config
sudo -u www-data php /var/www/nextcloud/occ upgrade