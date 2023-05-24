# docker-networks
open bridge-network branch with `git checkout bridge-network`. Run `docker-compose up -d` and you see that it creates two container named alice and bob. By entering the alice's container with `docker exec -ti alice ash` we can `ping bob` and see that alice and bob can communicate !

You can check the docker-compose.yml file and see that we have just declared our two container with no netword at all but alice and bob can communicate. This is because by default docker create all containers in a network called bridge. This allows to the containers to communicate between them but we don't always want that. 

And here comes the docker networks ! Before switching branch it is better to run `docker-compose down` so all the networks and containers created are deleted. Now go to the `same-network` branch to continue. 


You can open the docker-compose.yml file and see that we only add a network "HOME_NET" and add alice and bob to it with an ip and a default driver which is the bridge. Now you can rerun `docker-compose up -d` and check the connectivity between alice and bob and see that it still works now you can even check by pinging the address in the docker-compose. 

So we can create a network but the containers still have total connectivity between them. This chapter was just to show how to declare a network and assign a network to a container. Now we will dig more into the seperation of the containers in the branch `two-networks`. Don't forget to run `docker-compose down` before switching ;).

You see a new file called "router.sh" but don't pay attetion to it for now. In the docker-compose.yml we have created two networks "ALICE_NET" and "BOB_NET" and assigned each containers to its network address. Now if you test the connectivity between alice and bob you will see that it doesn't work anymore. Now that the containers are in two different networks we can no more test with `ping bob`, we have to use the ip so `ping 10.1.0.2` (all the packages will be lost). This is because all different networks in docker will be seperate by default. To connect them we will need a routage between them.

There `router.sh` comes in. You can execute the file in sudo `sudo ./router.sh` to add two rules of routage. One to say that you accept the traffic from alice's IP to bob's IP and another one to say that you accept the traffic from bob's IP to alice's IP. Now that the rules are declared the ping should pass in both way.