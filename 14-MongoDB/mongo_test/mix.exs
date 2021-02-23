defmodule MongoTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :mongo_test,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MongoTest.Application, []},
      applications: [:mongodb, :poolboy]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      #{:mongodb, "~> 0.5.1"},
      {:mongodb, git: "https://github.com/kobil-systems/mongodb.git"},
      {:poolboy, ">= 0.0.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end

# {:ok, conn} = Mongo.start_link(url: "mongodb://root:example@localhost:27017/admin")
# cursor = Mongo.find(conn, "persons", %{})
# cursor |> Enum.to_list()
# {:ok, conn} = Mongo.start_link(url: "mongodb://root:example@localhost:27017/curso_elixir")
# {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/curso_elixir", username: "root", password: "example", auth_source: "admin")

# cursor = Mongo.insert_one!(conn, "persons", %{"name" => "Nico",
# "email" => "ngonzales@gmail.com",
# "phone" => "1478524587",
# "lastname" => "Gonzales",
# "age" => 35
# })

# iex --sname hola # genera iex con nombre ej: hola@PSLT6090
# defmodule Hello do
#   def hello do
#     IO.puts "algo"
#   end
# end

# En otra consola:
# iex --sname chau
# pid = Node.spawn_link(:"hola@NOMBREQUESEGENNERO", fn ->
#   receive do
#     {:hi, client} -> send(client, :bye)
#   end
# end) #PID<10227.120.0>
#
# flush()
# send(pid, {:hi, self()})
# flush() # :bye :ok
