#!/usr/bin/with-contenv bashio

# Run the Zattoo script from your script folder to start the API

#cat /data/options.json

cd ~/telerising
#cp -rf /data/options.json userfile.json
#ln -s /data/options.json userfile.json
#bashio::log.info $(cat userfile.json)
perl zattoo.pl
