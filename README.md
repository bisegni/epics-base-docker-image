# epics-base-docker-image
 a modified version of https://github.com/JeffersonLab/softioc


## Getting started

### docker compose example
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

### kubernetes example
This illustrate the usage of two differente IOC software channel pods within K8S:

- create configuration and deployment
```
    kubectl apply -f k8s
```
- show all running pods:
``` 
    kubectl get pods:
    NAME                                    READY   STATUS    RESTARTS   AGE
    softioc-a-deployment-XXXXXXXXX-YYYYY    1/1     Running   0          6s
    softioc-b-deployment-XXXXXXXXX-YYYYY    1/1     Running   0          6s
```
- execute terminal within one of the two created pods
```
    kubectl exec --stdin --tty softioc-b-deployment-XXXXXXXXX-YYYYY  -- /bin/bash
    [root@softioc-b-deployment-XXXXXXXXX-YYYYY /]# source /opt/env.sh
    [root@softioc-b-deployment-XXXXXXXXX-YYYYY /]# camonitor channel:a
    channel:a                      <undefined> 0 UDF INVALID
    channel:a                      2022-12-05 21:58:51.128905 1 HIHI MAJOR
```
- othere test can be done, laso bring down and restart a pod
