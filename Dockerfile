https://hub.docker.com/r/jboss/keycloak/

Restructure this commands to a single file

Create network:
docker network create keycloak-network

Run DB(postgres) and add it to the network:
docker run -d --name postgres --net keycloak-network -e POSTGRES_DB=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=password postgres

Run keycloak app add it to the network and connect it to the DB:
docker run -p 8180:8080 --name keycloak --net keycloak-network -e KEYCLOAK_USER=keycloak -e KEYCLOAK_PASSWORD=password -e DB_ADDR=postgres jboss/keycloak
