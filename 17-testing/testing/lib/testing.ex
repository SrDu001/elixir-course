# defmodule User do
#   defstruct [:id, :name]
# end
#
# defprotocol DbHandler do
#   def create_user(handler, user)
# end
#
# defmodule Postgres do
#   defimpl DbHandler do
#     def create_user(_handler, %{name: name}) do
#       %User{
#         id: 5,
#         name: name
#       }
#     end
#   end
# end
#
# defmodule UserRepo do
#   def createOne(db_handler, keywords) do
#     DbHandler.create_user(db_handler, %{name: keywords[:name]})
#   end
# end
#
