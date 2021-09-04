+++ 
date = 2019-01-13T20:47:59+05:30
title = "Postgres with Docker"
description = ""
slug = "postgres-with-docker" 
tags = ["postgres", "docker", "databases"]
categories = ["Tutorial"]
externalLink = ""
series = []
+++

Lately, I have been experimenting with running PostgreSQL in a Docker container and communicating with it - from an application. This article documents my experience, learnings and methodology.

# Problem

I have got a lot of small personal projects which use separate databases.  
Each DB is associated with a unique configuration (combination of user, password, name) which as exported as environment variables in the relevant applications.

Now, this soon got messy as my machine was polluted with lots of DBs and their configurations. Thus, I started exploring the possibility of using containers for the task of running the DBs.

# Getting Started

Before starting diving into reading endless documentation, articles and tutorials, I wrote down some basic questions which I wanted to be answered first. My prime concern was getting up to speed with performing fundamental DB operations as quickly as possible with the new container layer.

1. How can I initialise the DB with some schema as soon as it starts up?
2. Can I access the DB via command-line and perform SQL commands using `psql`?
3. How do I connect to the DB via a running application?
4. What is the way to persist data once the running DB container is stopped?

Based on my prior experience with Docker, I already knew that as soon as a container is stopped all the data stored in it gets deleted. Thus, persisting data changes would be a major challenge otherwise the whole point of using containers is *moo*. 🐮

### Prerequisites

- [Install `docker`](https://docs.docker.com/install/#supported-platforms)
- [Install `docker-compose`](https://docs.docker.com/compose/install/)

# Project

We will a PostgreSQL DB for all the members of the infamous **League of Shadows** 👹.  
This database is mission-critical to the Gotham PD for protecting the city from future acts of terrorisms.

## Basic

### 1. Design the DB schema

We will keep it simple for now as we are more concerned with learning how to use Postgres from a running container rather than focusing on the database schema design.

We will use a single table called `members` as follows:

--------------------
| id | 	name |	bio |
|----|-------|------|
| 1 |Ra’s al Ghul|He is the founder of The League of Shadows.|
| 2 |Bruce Wayne|Batman’s secret identity is Bruce Wayne, an American billionaire, playboy, philanthropist, and owner of Wayne Enterprises.|
| 3 |Talia al Ghul|She is the daughter of Ra’s al Ghul.|
| 4 |Bane|Bane was once a member of The League until he was excommunicated by Ra’s al Ghul.|

### 2. Create and run the PostgresDB container

```bash
$ docker run --detach \ # run the container in background
            --name "shadowsDB" # name the container
            -e POSTGRES_USER="batman" \ # configuration specific to our database
            -e POSTGRES_PASSWORD="blueflower" \
            -e POSTGRES_DB="league_of_shadows" \         
            postgres:11.1-alpine 
```

- This command will run a container with a DB named “league_of_shadows” for the user “batman”.
- We are using `--detach` primarily because we do not want to pollute our terminal with logs from PostgreSQL.
- We use the Alpine image for experimentation purpose only. (`bash`)

### 3. Using `docker-compose` instead for a simpler interface.

As you can see, the multi-line command looks a bit clunky and is prone to mistakes.
Let’s rewrite the same command in a `docker-compose.yml` file instead.

Create the following `docker-compose.yml` file inside the project directory `shadows`:
{{< gist kshitij10496 0fd513ea8c8ece1d4c9dba03bd988489 "docker-compose.yml" >}}

Now we can run the container from within the `shadows` directory with:
```bash
$ docker-compose up
```

### 4. Access the DB running within the container

Now that the container is running, open a new terminal.

Exercise: Check whether the DB has any tables or data?

```bash
$ docker exec -it shadowsDB bash # opens up a Bash session inside the DB container

$ psql league_of_shadows -U batman # connect to the DB
league_of_shadows= \dt # list tables in the DB
Did not find any relations.
```
It’s empty! 😢

- Thanks to naming our container and using the Alpine image, we can easily use bash here.
- Password is not required when you are connecting to the DB from inside the container.

*I encourage you to play around inside the container.*

### 5. Loading data into the DB

(pwd: `shadows`)

Let’s add our all important data to the empty DB.

1. (optional) If you are still inside the container, exit it by closing the bash session.
2. Create `1.sql` and `2.sql` files inside a postgres directory within the project.  
    The SQL files hold the SQL instructions required for creating the DB table and populating it respectively.

{{< gist kshitij10496 4eb85645164a454b7db72a9bb5c2ba48 "1.sql" >}}

{{< gist kshitij10496 aada57ee13fecb9ae8a8f9f4264339b4 "2.sql" >}}

1. Add the files to the container as volume by modifying the docker-compose.yml

{{< gist kshitij10496 88474f0a63643f59337574774a00f52a "docker-compose.yml" >}}

4. Rebuild and run the container
 
```bash
$ docker-compose down # Stop the running container
Stopping shadowsDB ... done
Removing shadowsDB ... done
Removing network shadows_default

$ docker-compose up
```
5. Access the container using Step#4 from above.
6. Verify that the DB is populated with the data.

**Notes**

- The SQL files inside the `postgres` directory are executed in alphabetic order. i.e. `1.sql` -> `2.sql`.
- You can access the `./docker-entrypoint-initdb.d` folder from within the container to locate the SQL files.

### 6. The Dark Knight

Now that Gotham PD has created the DB, Gordon reveals that Mr. Wayne is infact Batman and not a member of the League. Thus, we should remove `Bruce Wayne` from the table.

1. Connect to the DB within the continer using Step#4.
2. Delete the row with `Bruce Wayne`: `DELETE FROM members WHERE id=2;`
3. Close the connection.
4. Exit the container.
5. Stop the container with `$ docker-compose down`
6. Restart the container: `$ docker-compose up`
7. Is `Bruce Wayne` removed from our DB?

Sadly, **no**! The reason being we are not persisting the changes made in the previous container to the current container.

### 7. Data Persistence

We simply need to define a new volume for the container where we can store a dump of the database. This could any empty directory on your machine which will reflect the `/var/lib/postgresql/data` directory present inside the DB container.

1. Modify `docker-compose.yml` by adding the new volume.
{{< gist kshitij10496 2e203ce2651671cd8b5d10ff23c1c319 "docker-compose.yml" >}}
2. Repeat Step#7
3. Verify that `Bruce Wayne` is successfully removed from the DB.

Gotham is now more resilient than ever! Kudos 🎉

# Summary

After spending an entire afternoon exploring Docker and Postgres, I’m convinced that using containers for running the DB and application provides me a lot of peace of mind worth the initial burden of writing the `Dockerfile` and `docker-compose.yml` files. From now onwards, I will definitely use Docker containers for running my databases.
Hopefully, you will consider the same when starting a new project! 😁

# References

- [PostgreSQL](https://www.postgresql.org/)
- [PostgreSQL Docker Image](https://hub.docker.com/_/postgres/)
- [League of Assassins Members Wikipedia](https://en.wikipedia.org/wiki/League_of_Assassins#Members)
