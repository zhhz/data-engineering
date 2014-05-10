
# LSCC
LivingSocial Coding Challenge

![lscc](https://github.com/zhhz/data-engineering/blob/master/lscc.png)

## Requirements
This application was created and tested using OS X 10.9.2, Ruby 2.0.0p451, Rails 4.1.1, MySQL 5.6.16.

## Setup Instructions on dev machine

Get the source code
``` shell
git clone git://github.com/zhhz/data-engineering lscc
cd lscc
bundle install
```

Configuration
Modify ``` config/database.yml```

Create DB
``` shell
$ msyql -uroot -ppassword
mysql> create database lscc_development character set utf8;
```
or you can
``` shell
rake db:create
```

Migration
``` shell
rake db:migrate
```

## Start the app
``` shell
rails server
```

Go to localhost:3000

For the basic authentication
```
username/password = lscc/lscc
```
