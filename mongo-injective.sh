cd docker
sudo docker compose -f docker-compose.yaml -f docker-compose.prod.yaml up -d mongo injective-core

sudo docker compose -f docker-compose.yaml -f docker-compose.prod.yaml -f addons/docker-compose.dex.yaml up -d indexer-eventprovider-process indexer-eventprovider-api 

# To follow the sync progress:
docker logs -f indexer-eventprovider-process
sudo docker logs indexer-eventprovider-process 2>&1 | grep "initial sync completed"


# Indexer
sudo docker compose -f docker-compose.yaml -f docker-compose.prod.yaml -f addons/docker-compose.dex.yaml up -d indexer-exchange-api indexer-exchange-process

# To follow the sync progress: 
docker logs -f indexer-exchange-process
sudo docker logs indexer-exchange-process 2>&1 | grep "initial sync completed"


# Dex Stack

sudo docker compose -f docker-compose.yaml -f docker-compose.prod.yaml -f addons/docker-compose.dex.yaml up -d indexer-explorer-api indexer-explorer-process indexer-chronos-api indexer-chronos-process indexer-web3gw-api

docker logs $SERVICE_PROCESS 2>&1 | grep "initial sync completed"

