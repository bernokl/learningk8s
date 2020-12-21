## This is quick overview of what docker is

### Lets go over a few practical things, Org allows literate programming and that means I can run the commands right in my documentation

Here is a quick example:

```shell
pwd
```

### The second neat thing we can do is to tangel a block of code into a file

```yaml
Here is a file we tangled
You can create full bash scripts here
```

### Lets confirm

```shell
cat example.txt
```

# Lets tie things together

We will be creating a very simple container. We will push it to my dockerhub registry and then run it.

### First I am going to create a very simple nodejs app that I can run in a container

```nodejs
const http = require('http');
const os = require('os');
console.log("Kubia server starting...");
var handler = function(request, response) {
  console.log("Received request from " + request.connection.remoteAddress);
  response.writeHead(200);
  response.end("You've hit " + os.hostname() + "\n");
};
var www = http.createServer(handler);
www.listen(8080);
```

### Lets package it with a working environment and see what we get

```yaml
FROM node:7
ADD app.js /app.js
ENTRYPOINT ["node", "app.js"]
```

### Lets use the docker build command to create our docker image

```shell
docker build -t kubia .
```

### Lets look if we can see the docker image

```shell
docker images
```

### Lets start a container with the kubia image

```shell
docker run --name kubia-container -p 8080:8080 -d kubia
```

### Lets see if we see it run

```shell
docker ps
```

### Now lets see if we can hit our container

```shell
curl localhost:8080
```

### Lets inspect our container

```shell
docker inspect kubia-container
```

### Lets go exploring inside the running container

```shell
docker exec -it kubia-container bash
```

### Lets clean up what we did by stopping and removing the container

```shell
docker stop kubia-container
docker rm kubia-container
```

### Last steps, lets build and push our container to my registry

```shell
docker tag kubia bernokl/kubia
```

### Did our images change?

```shell
docker images
```

### Push image to our repo so others can use it

```shell
docker push bernokl/kubia
```

# Lets see if we can make this into a presentation

The theory is that this file gets a footnotes to set up reveal things Aite, added the footnotes below, lets try to tangle it out the plan is to hit ", e e v b"
