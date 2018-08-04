# MCContainer
> Docker container for Minecraft server

## Running
> To get it up and running:

    docker build . -t minecraftserver
    docker run -d -p 25565:25565 -e SERVER_PORT=25565 minecraftserver

> You should now be able to connect to it at `localhost:25565`
