# tvm-playground

## requirements

- virtualbox
- vagrant

```bash
$ vagrant plugin install vagrant-disksize
```

## setup environment

```bash
$ varant up
$ vagrant ssh
```

```bash
# bind ./:/work
$ cd /work
# build Docker Image and create container
$ docker-compose up -d dev
# login to container
$ docker-compose exec dev bash
# build tvm
$ make tvm
```

```bash
$ python3
>>> import tvm
>>> import topi
>>> import nnvm
```

```bash
$ make jupyter
#=> 192.168.33.10:8888 (private network)
```

## TODO

- Vagrant
    - [ ] network setting for RPC
- [ ] add sample notebook
- [ ] PyCharm debug configurations
