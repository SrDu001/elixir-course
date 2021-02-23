defmodule Person do
  defstruct [:name, :phone, :lastname, :id]

  defimpl Mongo.Encoder do
    def encode(%{phone: phone, name: name, lastname: lastname, id: id}) do
      %{phone: phone, name: name, lastname: lastname}
    end
  end
end
