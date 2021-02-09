import User

user =
  create_user()
  |> set_name("Duban", "Piraban")
  |> set_country("Colombia")
  |> set_languages(["spanish", "english", "german"])

  inspect(user) |> IO.puts()
