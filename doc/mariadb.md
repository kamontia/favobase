
# mariadbへのログイン方法
docker-compose up -dまでやった前提。

## コンテナ確認

```
⋊> ~/g/favobase on chenge_db_to_mariadb ⨯ docker ps                         18:39:21
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
72681d09f810        5e566eb315b9        "bundle exec rails..."   15 minutes ago      Up 15 minutes       0.0.0.0:3000->3000/tcp   favobase_web_1
f6600040a303        mariadb:10.2.12     "docker-entrypoint..."   17 minutes ago      Up 17 minutes       0.0.0.0:3306->3306/tcp   favobase_db_1
```

## mysqlクライアントでログイン

コンテナID見て、execでmysqlコマンド叩く。パスワードをいれてるので-pが必要。パスワードはconfig/mariadb.ymlに記載したものが使われる。ぼくはpasswordにしてた。

```
⋊> ~/g/favobase on chenge_db_to_mariadb ⨯ docker exec -it f6600040a303 mysql -p                                                                                          18:39:27
Enter password:  <password>
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 13
Server version: 10.2.12-MariaDB-10.2.12+maria~jessie mariadb.org binary distribution

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

## DB確認

```
MariaDB [(none)]> show databases;
+----------------------+
| Database             |
+----------------------+
| favobase_development |
| favobase_test        |
| information_schema   |
| mysql                |
| performance_schema   |
+----------------------+
5 rows in set (0.02 sec)
```

## development DBを選択、テーブル確認

```
MariaDB [(none)]> use favobase_development
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [favobase_development]> show tables;
+--------------------------------+
| Tables_in_favobase_development |
+--------------------------------+
| ar_internal_metadata           |
| favorites                      |
| schema_migrations              |
| users                          |
+--------------------------------+
4 rows in set (0.00 sec)
```

## users tableのレコード確認

```
MariaDB [favobase_development]> select * from users;
+----+----------+----------+----------+------+-----------+---------------------+---------------------+
| id | provider | uid      | nickname | name | image_url | created_at          | updated_at          |
+----+----------+----------+----------+------+-----------+---------------------+---------------------+
|  1 | twitter  | 95131720 | tktnknr  | take | NULL      | 2018-01-07 09:23:48 | 2018-01-07 09:23:48 |
+----+----------+----------+----------+------+-----------+---------------------+---------------------+
1 row in set (0.00 sec)
```

## DBの実データ
data/volumes以下にある。

```
⋊> ~/g/favobase on chenge_db_to_mariadb ⨯ ll data/volumes/                                                                                                               18:45:22
total 245856
-rw-rw----   1 take  staff    16K  1  7 18:22 aria_log.00000001
-rw-rw----   1 take  staff    52B  1  7 18:22 aria_log_control
drwx------  11 take  staff   374B  1  7 18:23 favobase_development
drwx------   3 take  staff   102B  1  7 18:23 favobase_test
-rw-rw----   1 take  staff   2.7K  1  7 18:22 ib_buffer_pool
-rw-rw----   1 take  staff    48M  1  7 18:24 ib_logfile0
-rw-rw----   1 take  staff    48M  1  7 18:22 ib_logfile1
-rw-rw----   1 take  staff    12M  1  7 18:24 ibdata1
-rw-rw----   1 take  staff    12M  1  7 18:22 ibtmp1
-rw-rw----   1 take  staff     0B  1  7 18:22 multi-master.info
drwx------  89 take  staff   3.0K  1  7 18:22 mysql
drwx------   3 take  staff   102B  1  7 18:22 performance_schema
-rw-rw----   1 take  staff    24K  1  7 18:22 tc.log
```
