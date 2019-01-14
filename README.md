# tvm-playround

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
$ cd /work
$ docker-compose up -d dev
$ docker-compose exec dev bash
$ make tvm
```

## TODO

- [ ] PyCharm debug configurations