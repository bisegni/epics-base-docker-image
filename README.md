# epics-base-docker-image
 a modified version of https://github.com/JeffersonLab/softioc


## Getting started

This illustrate the usage of two differente IOC software channel container:

in one terminal execute the command-> *docker compose up softioc_a softioc_b*
in another terminal execute:
- docker compose  run  client
- source /opt/env.sh
- caget channel:a
- caget channel:b
- caput channel:a 1
- caget channel:a
- caget channel:b