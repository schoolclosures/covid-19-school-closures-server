# OSX Installation Guide

> This guide assumes that you have already installed homebrew and Ruby on Rails.

## Installing Postgresql 
The Odin Project uses PostgreSQL as it's database. You will need to install it if you haven't already via one of the two methods below:

### via Postgres.app:
The easiest way to get up and running with Postgres is to install [Postgres.App](https://postgresapp.com/) - a nifty program wrapper for PostgreSQL. Once downloaded, install the app and run it.

To log into the psql command line click on the elephant icon in your menu bar and choose **Open Postgres** then double click on the [database icon with your username under it.](https://imgur.com/4wHTwxv.png) Once open, continue with [Database Setup](#database-setup)

### via Brew:
PostgreSQL is also available via Brew package manager. Before installing postgres make sure that homebrew is up to date.
```
$ brew update
```

First, install PostgreSQL
```
$ brew install postgresql
```

Once installed, we will need to initialize a new database, then start the Postgres daemon.
```
$ initdb /usr/local/var/postgres
$ pg_ctl -D /usr/local/var/postgres start

# Optional - Start Postgres on system boot:
$ brew services start postgresql
```

Finally, we'll log into the PostgreSQL command line:
```bash
$ psql postgres
```

## Database Setup
With Postgres installed, we can now turn our attention to setting up the database.  We will be using the postgres command line to set up a new user.
```
postgres=# CREATE USER your-username WITH PASSWORD 'your-password-here';
postgres=# ALTER ROLE your-username WITH CREATEDB;
postgres=# \q
```
(Be sure to change `your-username` and `your-password-here` with usernames and passwords of your choosing. Note that `your-username` in the above commands should **not** have `'single quotes'` around it, but the `your-password-here` should have single quotes.)

With PostgreSQL installed, continue on with the [Running School Closures Server Locally](https://github.com/schoolclosures/covid-19-school-closures-server/blob/development/README.md) instructions.