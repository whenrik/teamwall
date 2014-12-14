#TODO: this will not work since teamwall Dockerfile instanciate mongod

# Start a mongodb instance with
docker run -d -p :27017 --name mongodb dockerfile/mongodb mongod

# Start teamwall
docker run -d -p 3000:80 --name teamwall --link db:db whenrik/teamwall
