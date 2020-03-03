OBA_URL="http://nexus.onebusaway.org/service/local/artifact/maven/content?r=public&g=org.onebusaway&a=onebusaway-gtfs-transformer-cli&v=1.3.87"
GTFS_URL="https://www.openvvs.de/dataset/e66f03e4-79f2-41d0-90f1-166ca609e491/resource/bfbb59c7-767c-4bca-bbb2-d8d32a3e0378/download/vvs_gtfs.zip"

CURL=curl -\#

# https://gis.stackexchange.com/questions/219382/how-to-extract-a-small-area-from-a-big-gtfs-feed
transform: oba-transformer.jar gtfs.zip
	java -jar oba-transformer.jar --transform=transformations.txt gtfs.zip gtfs-transformed.zip

oba-transformer.jar:
	${CURL} ${OBA_URL} -o oba-transformer.jar

gtfs.zip:
	${CURL} ${GTFS_URL} -o gtfs.zip

clean:
	rm -rf *.jar *.zip
