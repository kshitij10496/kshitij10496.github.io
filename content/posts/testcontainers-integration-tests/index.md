---
title: "Testcontainers Integration Tests"
date: 2023-11-30T16:33:50+01:00
draft: true

slug: "" 
tags: []
categories: []
---

```go
func setupTestDB(t *testing.T) *sqlx.DB {
	t.Helper()
	ctx := context.Background()

	once.Do(func() {
		pgContainer, err := postgres.RunContainer(ctx,
			testcontainers.WithImage("postgres:14-alpine"),
			postgres.WithDatabase("quiz"),
			postgres.WithUsername("quiz"),
			postgres.WithPassword("secret"),
			testcontainers.WithWaitStrategy(
				wait.ForLog("database system is ready to accept connections").
					WithOccurrence(2).WithStartupTimeout(5*time.Second)),
		)
		if err != nil {
			t.Fatal(err)
		}

		connStr, err := pgContainer.ConnectionString(ctx, "sslmode=disable")
		if err != nil {
			t.Fatal(err)
		}

		pgDSN = connStr
	})

	db, err := sqlx.Connect("postgres", pgDSN)
	if err != nil {
		t.Fatal(err)
	}

	// SQL Migrations.
	twice.Do(func() {
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