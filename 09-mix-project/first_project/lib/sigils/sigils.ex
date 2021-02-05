defmodule Sigils do
  def example1 do
  end

  regex = ~r/foo|baz/
  # true
  IO.puts("foo" =~ regex)
  IO.puts("")
  # false
  "HELLO" =~ ~r/hello/

  def parse_url do
    url = "https://www.google.com"
    regex_url_1 = ~r<^https?://>
    regex_url_2 = ~r/^https?\/\//
    # true
    IO.puts(regex_url_1 === regex_url_2)
  end
end
