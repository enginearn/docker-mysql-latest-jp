# Docker MySQL

<details>
<summary>Dockerfile</summary>

``` Dockerfile
FROM mysql:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

COPY mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
```

</details>

<details>
<summary>docker image build</summary>

``` Powershell
 docker image build -t enginearn/mysql-latest-jp:latest .
```

</details>

<details>
<summary>CREATE DB</summary>

``` PowerShell
docker run -d `
--name mysql-store-jp `
--platform linux/amd64 `
-e MYSQL_ROOT_PASSWORD=secret `
-e MYSQL_DATABASE=store-jp-data `
-p 3306:3306 `
enginearn/mysql-latest-jp:latest
```

</details>

<details>
<summary>mysqlへアクセス</summary>

``` PowerShell
docker exec -it <mysql-container-id> mysql -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.29 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

</details>

<details>
<summary>CREATE TABLE</summary>

``` MySQL 8
mysql> create table user(id integer, name varchar(255), address varchar(255));
Query OK, 0 rows affected (0.06 sec)
```

</details>


<details>
<summary>INSERT INTO</summary>

``` MySQL 8
mysql> insert into user values (1, 'Yamada', 'Tokyo');
Query OK, 1 row affected (0.04 sec)
mysql> insert into user values (2, '山下', '大阪');
Query OK, 1 row affected (0.02 sec)
mysql> select * from user;
+------+--------+---------+
| id   | name   | address |
+------+--------+---------+
|    1 | Yamada | Tokyo   |
|    2 | 山下   | 大阪    |
+------+--------+---------+
2 rows in set (0.01 sec)
```

</details>

<details>
<summary>DELETE</summary>

``` MySQL 8
mysql> delete from user where id = 2;
Query OK, 1 rows affected (0.03 sec)

mysql> select * from user;
+------+--------+---------+
| id   | name   | address |
+------+--------+---------+
|    1 | Yamada | Tokyo   |
+------+--------+---------+
1 row in set (0.00 sec)
```

</details>

## Docker Hubへimageをアップロード

<details>
<summary>docker push</summary>

``` PowerShell
docker push enginearn/mysql-latest-jp
Using default tag: latest
The push refers to repository [docker.io/enginearn/mysql-latest-jp]
5e3d4cdcc2bb: Pushed
f75082af30bf: Pushing [======>                                            ]  28.22MB/221.6MB
833406460d31: Pushing [============================>                      ]   14.6MB/26.07MB
4086a16b8614: Mounted from library/mysql
351b8d982925: Mounted from library/mysql
95c2da8ba70a: Mounted from library/mysql
50c4e318e1da: Mounted from library/mysql
6d403307d5b8: Mounted from library/mysql
d444021b09d7: Mounted from library/mysql
a225a9c60d38: Mounted from library/mysql
f00dfaf864a5: Mounted from library/mysql
98f8218a8128: Mounted from library/mysql
3ad9b12510f0: Mounted from library/mysql
36f1f5523535: Mounted from library/mysql
6be90f1a2d3f: Mounted from library/mysql
```

</details>
