import Config

config :social_network, SocialNetwork.Repo,
  database: "social_network_repo",
  username: "postgres",
  password: "socialsecret",
  hostname: "localhost",
  port: 5432

config :social_network, ecto_repos: [SocialNetwork.Repo]
