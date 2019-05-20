#  Bank Accounting

This Project is an open source API for a bank account management system, allowing you to make transfers from one customer to another and expose the current account balance.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* Install ruby version 2.5.5 and set it with your ruby environment manager
([more info here](https://www.ruby-lang.org/en/documentation/installation/))..

* Install Postgres or Mysql and start the server in the foreground
	

### Project Setup

**Install all gems**:

```console
$ bundle install
```

**Create a new Database** 

```console
$ rake db:create
```

**Update the database with new data model**:

```console
$ rake db:migrate
```

**Creating a new user**:

```console
$ rails c 
```

```console
$ User.create(name: 'Example Name', email:'emails@example.com', password: 12345678) 
```


**Feed the database with default seeds**:

```console
$ rake db:seed
```

**Start the web server on `http://localhost:3000` by default**:

```console
$ rails server
```