OBA_URL="http://nexus.onebusaway.org/service/local/artifact/maven/content?r=public&g=org.onebusaway&a=onebusaway-gtfs-transformer-cli&v=1.3.87"
GTFS_URL="https://leonard.io/ibi/marta.unknown-accessibility.gtfs.zip"

CURL=curl -\#

transform: oba-transformer.jar gtfs.zip
	java -Xmx16g -jar oba-transformer.jar --transform=transformations.txt gtfs.zip gtfs-transformed.zip
	mkdir -p output
	rm -f output/*
	unzip gtfs-transformed.zip -d output

oba-transformer.jar:
	${CURL} ${OBA_URL} -o oba-transformer.jar

gtfs.zip:
	${CURL} ${GTFS_URL} -o gtfs.zip

clean:
	rm -rf *.jar *.zip
