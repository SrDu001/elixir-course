defprotocol UserRepo do
  def createOne(db_handler, keywords)
  def findOne(db_handler, id)
end

defmodule UserRepoImpl do
  def start_link(db_handler) do
    GenServer.start_link(__MODULE__, {db_handler})
  end

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create_one, keywords}, _, db_handler) do
    DbHandler.create_user(db_handler, %{name: keywords[:name]})
  end

  @impl true
  def handle_call({:find_one, id}, _, db_handler) do
    DbHandler.find_user(db_handler, id)
  end
end

def UserRepo, for: UserRepoImpl do
  def createOne(repo, keywords) do
    GenServer.call(repo, {:create_one, keywords})
  end

  def findOne(repo, id) do
    GenServer.call(repo, {:dind_one, id})
  end
end
