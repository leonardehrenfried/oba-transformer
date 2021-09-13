OBA_URL="https://leonard.io/downloads/onebusaway-gtfs-transformer-cli-1.3.100.jar"
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
