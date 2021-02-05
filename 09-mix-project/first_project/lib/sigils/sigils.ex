defmodule Sigils do
  def example1 do
    regex = ~r/foo|baz/
    IO.puts "foo" =~ regex # true
    IO.puts "bar" =~ regex # false

    "HELLO" =~ ~r/hello/ # false
    "HELLO" =~ ~r/hello/ # true
  end

  def example2 do
    IO.puts ~r/hello/ # ~r/hello/
    IO.puts ~r|hello| # ~r/hello/
    IO.puts ~r<hello> # ~r/hello/
    IO.puts ~r"hello" # ~r/hello/
    IO.puts ~r'hello' # ~r/hello/
    IO.puts ~r(hello) # ~r/hello/
    IO.puts ~r{hello} # ~r/hello/
  end

  def parse_url do
    url = "https://www.google.com"
    regex_url_1 = ~r<^https?://>
    regex_url_2 = ~r/^https?\/\//
    IO.puts(regex_url_1 === regex_url_2) # true
    IO.puts url =~ regex_url_1
  end

  def string_sigils do
    IO.puts "Hello"
    IO.puts ~s(Hello)
    IO.puts ~s"Hello"

    name = "Duban"
    IO.puts ~s(Hello #{name}) # Hello Duban
    IO.puts ~S(Hello #{name}) # Hello #{name})
  end

  def charlist_sigils  do
    IO.puts 'hello'
    IO.puts ~c(hello)
  end

  def calendar_sigils do
    date1 = ~D[2021-02-05]
    date2 = %Date{year: 2021, month: 2, day: 4}
    IO.puts date1 == date2 # true

    t1 = ~T[14:31:53.0]
    t2 = ~T[14:31:53]
    t2 = %Time{hour: 14, minute: 31, second: 53}
    IO.puts t1 === t2 # true
    IO.puts t1 === t3 # true

    ndt = ~N[2021-02-05 14:31:53.0]
    IO.inspect Map.keys(ndt) # [:__struct__, :calendar, :day, :hour, :microsecond, :minute, :month, :second, :year]
    IO.inspect Map.values(ndt) # [NaiveDateTime, Calendar.ISO, 5, 14, {0, 1}, 31, 2, 53, 2021]

    dt = ~U[2021-02-05 14:31:53Z]
    %DateTime{minute: m, time_zone: tz, utc_offset: uo, std_offset: so} = dt
    IO.puts(m) # 31
    IO.puts(tz) # Etc/UTC
  end
end
