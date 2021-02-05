defmodule CustomError do
  defexception [:message, country: "Peru"]
end

defmodule DefaultError do
  defexception message: "My default Error"
end

# iex(1)> raise DefaultError, message: "Another Message"
