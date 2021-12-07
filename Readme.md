# oba-transformer

Makefile for applying transformations to GTFS feeds via OneBusAway's `gtfs-transformer-cli`.

## Prerequisites

- Java
- curl

## Instructions

1. Add the URL to the GTFS feed to the Makefile variable `GTFS_URL`
1. Write your transformation and add it to the `transformations` folder
1. Symlink the transformations to `transformation.txt`: `ln -sf transformations/add-accessibility.txt ./transformations.txt`
1. `make transform`
1. The transformed file will be available as `gtfs-transformed.zip`
