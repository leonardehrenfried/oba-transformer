OBA_URL="https://repo.camsys-apps.com/releases/org/onebusaway/onebusaway-gtfs-transformer-cli/1.3.102/onebusaway-gtfs-transformer-cli-1.3.102.jar"
GTFS_URL="http://vbb.de/vbbgtfs"

CURL=curl -\# -L

transform: oba-transformer.jar gtfs.zip
	java -Xmx40g -jar oba-transformer.jar --transform=transformations.txt gtfs.zip gtfs-transformed.zip
	mkdir -p output
	rm -f output/*
	unzip gtfs-transformed.zip -d output

oba-transformer.jar:
	${CURL} ${OBA_URL} -o oba-transformer.jar

gtfs.zip:
	${CURL} ${GTFS_URL} -o gtfs.zip

clean:
	rm -rf *.jar *.zip
