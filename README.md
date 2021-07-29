# dream-postgres-graphql

Combines a few of the features of some of the Dream examples, in particular
`h-sql`, `i-graphql` and `w-postgres`. Accesses the `person` table in a `demo`
database.

The URL `/view` displays an HTML view of everything in the database table. Using
the query query parameters `after` and/or `first` gives a partial Relay-style
pagination. For example, `/view?after=2&first=3` will get the 3rd, 4th and 5th
rows of the table.

The URL `/` displays a GraphiQL interface to a GraphQL schema for the same
table. The `person` query has the same optional `after` and `first` pagination
arguments.

## Files

- `bin/main.ml`: Main program / starting point. This is where you see the Dream
  handler / middleware / router pipeline.

- `lib/person.ml[i]`: Person model

- `lib/sql.ml[i]`: Caqti types and query for fetching people from the database

- `lib/api.ml[i]`: GraphQL schema definition

- `templates/person.eml.html`: HTML/OCaml template for displaying a single
  person as a table row. (A bit like a Jinja2 macro.)

- `templates/page.eml.html`: HTML/OCaml template for the people page

- `db.sql`: Postgres database dump with schema and data

## Setup

After cloning this repo, do:

```
opam install dream caqti-driver-postgresql
```

Create an empty Postgres database called `demo`, then run

```psql --file=db.sql demo```

and it should create and populate the tables you'll need.

## Build

```
dune build
```

## Run

```
dune exec main
```

And then point your browser at <http://localhost:8080>.
