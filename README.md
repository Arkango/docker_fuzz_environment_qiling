# docker_fuzz_environment_qiling



This testing environment has been created to easily follow tests made during this conference, explaining qiling framework https://www.youtube.com/watch?v=e3_T3KLh2NU&ab_channel=HackInTheBoxSecurityConference .

Particurarly the DLINK firmware has been included


In order to be able to run all examples do the following

```
rf -rf /qiling/examples/rootfs
cd /qiling/examples; git clone https://github.com/qilingframework/rootfs
```

To run the lab docker is nedded.

```
git clone https://github.com/Arkango/docker_fuzz_environment_qiling
cd docker_fuzz_environment_qiling
docker-compose up -d
docker container ls | grep ubuntuos
docker exec -it <container name> /bin/bash
```
