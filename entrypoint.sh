set -e

dir=`ls /data`
if [ "$dir" == "" ]; then
  echo 'copy /web/data to /data'
  cp -r /web/data/* /data/
fi
chmod -R 777 /web /data

php-fpm7 -F
