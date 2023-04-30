---
title: "PostgreSQL Query Planning"
date: 2023-04-30T16:21:26+02:00
draft: false

slug: "pg-query-planning"
tags: []
categories: []
---

This past week I triggered an incident on one of the production systems.
The issue was a result of a AWS Aurora Postgres major version upgrade (10->11) gone wrong.
Here is a brief summary of what I learnt from it.

Every running DBMS has some state associated with the data it stores.
This state enables the DBMS to tune it's own performance.

Upgrading the DB is tricky for sure.
Always try to create contingency plans (backups, snapshots, redundant DBs) before executing destructive operations.
Migrating the data from one DB to another is part of the work.
It's rather straightforward thanks to Cloud Providers.
Verifing and validating data correctness post-migration is simple.

However, the difficult part is to understand the DBMS state migration.
Usually, this state is not migrated by default.
DBAs need to force it post migration.

The inconsistency between the states pre and post migration resulted in slower queries.
Comparing the query plans can point out missing indexes, inefficient plans.
This is how I discovered that PostgreSQL's query planner uses the statistics collected in `pg_statistic` catalog table to determine the most efficient execution plans.[^1]
Morever, PostgreSQL provides a special statement called `ANALYZE` to populate the statistics into this table.[^2]
Note: The `ANALYZE` statement is not in the SQL standard.

There are considerations to be made around the `ANALYZE` statement.

1. `ANALYZE` requires only a read lock on the target table. This enables concurrent queries to run in parallel.
2. In default configuration, `AUTOVACCUM` daemon automates the execution of the `ANALYZE` statement. Check for the `AUTOVACCUM` configuation of your DBs.
3. A common strategy for read-mostly databases is to run `ANALYZE` once a day during a low-usage time of day.

I'm still trying to figure out a good strategy to tune `ANALYZE` on the production DBs for individual use cases.
But that's a story for another time.

I have learnt this lesson about query planning the hard way.
Now, there is wisdom, and some scar tissue.

[^1]: [PostgreSQL: Documentation: 11: Updating Planner Statistics](https://www.postgresql.org/docs/11/routine-vacuuming.html#VACUUM-FOR-STATISTICS)
[^2]: [PostgreSQL: Documentation: 11: ANALYZE](https://www.postgresql.org/docs/11/sql-analyze.html)
