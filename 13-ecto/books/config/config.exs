import Config

config :books, Books.Repo,
  database: "books_repo",
  username: "postgres",
  password: "booksecret",
  hostname: "localhost",
  port: 5432

config :books, ecto_repos: [Books.Repo]
