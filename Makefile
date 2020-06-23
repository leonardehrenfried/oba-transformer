OBA_URL="http://nexus.onebusaway.org/service/local/artifact/maven/content?r=public&g=org.onebusaway&a=onebusaway-gtfs-transformer-cli&v=1.3.87"
GTFS_URL="https://gtfs.mfdz.de/hbg.merged.gtfs.zip"

CURL=curl -\#

# https://gis.stackexchange.com/questions/219382/how-to-extract-a-small-area-from-a-big-gtfs-feed
transform: oba-transformer.jar gtfs.zip
	java -Xmx16g -jar oba-transformer.jar --transform=transformations.txt gtfs.zip gtfs-transformed.zip

oba-transformer.jar:
	${CURL} ${OBA_URL} -o oba-transformer.jar

gtfs.zip:
	${CURL} ${GTFS_URL} -o gtfs.zip

clean:
	rm -rf *.jar *.zip
