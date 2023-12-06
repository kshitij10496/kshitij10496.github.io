---
title: "Testcontainers Integration Tests"
date: 2023-11-30T16:33:50+01:00
draft: true

slug: "" 
tags: []
categories: []
---

# TODOs
- [ ] Clean up the process first.
- [ ] Read about test setup and cleanup in Go.

Problem
Let's say you want to test the layer of the code that integrates with external dependencies like DBs.
It's a problem I find to solve in a generic manner.
There is always nuance involved. Maybe it's a characteristic of the problem space itself.

Challenges:
- Need to run additional processes and co-ordinate them
- Setup the state of the DB with migrations and mock data (fixtures).

Solution:
Lately, I have started experimenting with TestContainers and am quite pleased with the results.
Hence, I thought I would share my setup here in order to collect feedback, and suggestions.

In my case, I have Postgres DB that I would like to test.

# Blueprint
- Spin up the DB before any tests.
- Run the DB migrations. This should be shared across all the tests.
- Load relevant fixtures into the DB for each test case.
- Run the test scenario.
- Remove the data from the DB after each test run.
- Terminate the DB process.

# Example

```go

var dsn string
var spinUpContainer, runMigrations sync.Once


func setupTestDB(t *testing.T) *sqlx.DB {
	t.Helper()
	ctx := context.Background()


	spinUpContainer.Do(func() {
		container, err := postgres.RunContainer(ctx,
			testcontainers.WithImage("postgres:14-alpine"),
			postgres.WithDatabase("db"),
			postgres.WithUsername("user"),
			postgres.WithPassword("secret"),
			testcontainers.WithWaitStrategy(
				wait.ForLog("database system is ready to accept connections").
					WithOccurrence(2).WithStartupTimeout(5*time.Second)),
		)
		if err != nil {
			t.Fatal(err)
		}

		connStr, err := container.ConnectionString(ctx, "sslmode=disable")
		if err != nil {
			t.Fatal(err)
		}

		dsn = connStr
	})

	db, err := sqlx.Connect("postgres", dsn)
	if err != nil {
		t.Fatal(err)
	}

	// SQL Migrations.
	runMigrations.Do(func() {
		migrations := &migrate.FileMigrationSource{
			Dir: filepath.Join("..", "db", "migrations"),
		}

		n, err := migrate.Exec(db.DB, "postgres", migrations, migrate.Up)
		if err != nil {
			t.Fatalf("failed to apply DB migrations: %v", err)
		}
		t.Logf("applied %d DB migrations", n)
	})

	return db
}

func TestManager_FetchQuizByAlias_Success(t *testing.T) {
	t.Run("sponsored quiz", func(t *testing.T) {
		ctx := context.Background()

		db := setupTestDB(t)
		t.Cleanup(func() { db.Close() })

		truncateTables := func() {
			if _, err := db.Exec(`TRUNCATE quizzes, questions, choices CASCADE;`); err != nil {
				t.Errorf("failed to truncate tables: %v", err)
			}
		}
		t.Cleanup(truncateTables)

		is := is.New(t)

		tm, err := New(db)
		is.NoErr(err)
```

# Conclusions

This is really promising, and I believe it has potential to bring value to few codebases I work with.
There are still many things about the setup that annoy me.
I still believe this is not as expressive as I would like it to be.
I want to simplify this pattern further as well as polish the use of globals and mutuable state.
If you have any suggestions or feedback, please let me know.