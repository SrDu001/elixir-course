String.to_charlist "hola mundo" # 'hola mundo'
:binary.bin_to_list "adios" # 'adios'
:erlang.+(2, 3) # 5
2 |> :erlang.+(3) # 5
:io.format("pi es aproximado a: ~10.3f~n", [:math.pi]) # pi es aproximado a:      3.142 :ok
:io_lib.format("pi es aproximado a: ~10.3f~n", [:math.pi]) # 'pi es aproximado a:      3.142\n'
to_string :io_lib.format("pi es aproximado a: ~10.3f~n", [:math.pi]) # "pi es aproximado a:      3.142\n"
Base.encode16(:crypto.hash(:sha256, "curso elixir")) # "A112C33BD910C2785036DDC5E45CAD8442EB362C01BBE005A0593141C45BD112"
:crypto.hash(:sha256, "curso elixir") # <<161, 18, 195, 59, 217, 16, 194, 120, 80, 54, 221, 197, 228, 92, 173, 132, 66,  235, 54, 44, 1, 187, 224, 5, 160, 89, 49, 65, 196, 91, 209, 18>>
:crypto.hash(:sha256, "curso elixir") |> Base.encode16 # "A112C33BD910C2785036DDC5E45CAD8442EB362C01BBE005A0593141C45BD112"
table = :ets.new :my_table, []  #Reference<0.2798544857.3370254339.115882>
:ets.insert(table, {"Colombia", "COP"}) #true
:ets.insert(table, {"PERU", "PEN"}) # true
:ets.i(table)
# <1   > {<<"PERU">>,<<"PEN">>}
# <2   > {<<"Colombia">>,<<"COP">>}
# EOT  (q)uit (p)Digits (k)ill /Regexp -->q
# :ok
:ets.lookup(table, "Colombia") # [{"Colombia", "COP"}]
:ets.delete(table)  #true
:ets.lookup(table, "Colombia") #throws argument error
:math.pi  #3.141592653589793
:math.pi() #3.141592653589793
&:math.pi/0 #&:math.pi/0
:math.pow(2, 3) #8.0
:rand.uniform() #0.2458115410458761
:rand.seed(:exs1024, {47,545,890})
#{%{
#   jump: #Function<13.10897371/1 in :rand.mk_alg/1>,
#   max: 18446744073709551615,
#   next: #Function<12.10897371/1 in :rand.mk_alg/1>,
#   type: :exs1024
# },
# {[11459981300416043001, 10839693417436097381, 4510633679073751878,
#   2926229852099820512, 10331495020522950119, 18208990086451454936,
#   2789677723559950830, 13929398633717925763, 17175936808292613419,
#   16935221695196970564, 17501650339431854763, 6071448046042915873,
#   3610314203473479231, 12745154328551770161, 14778945609234077907,
#   1164360897446980114], []}}
:rand.uniform() #0.3365869329687696
:rand.uniform(7) #5
:rand.uniform(6) + :rand.uniform(6) #8
:rand.uniform(6) + :rand.uniform(6) #5


h :zip.foldl # shows foldl help
:zip.foldl(fn _, _, _, acc -> acc + 1 end, 0, :binary.bin_to_list("app.zip")) # {:ok, 6}
h :binary.bin_to_list # shows bin_to_list help
parrafo = "Este es un texto largo,
Esta es la segunda linea del parra Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled
it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
compressed = :zlib.compress parrafo # returns bit stream
byte_size parrafo # 635
byte_size compressed # 371
:zlib.uncompress compressed # returns uncompressed bit stream

# Graphs

digraph = :digraph.new
# {:digraph, #Reference<0.2187947176.189399042.254741>,
#  #Reference<0.2187947176.189399042.254742>,
#  #Reference<0.2187947176.189399042.254743>, true}
coords = [{0.0, 0.0},{1.0, 0.0},{1.0, 1.0}] # [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
[v0, v1, v2] = (for x <- coords, do: :digraph.add_vertex(digraph, x)) # [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
h :digraph.add_vertex # shows digraph.add_vertex help
:digraph.add_edge(digraph, v1, v0) # [:"$e" | 0]
digraph |> :digraph.add_edge(v0, v2) # [:"$e" | 1]
:digraph.get_short_path(digraph, v2, v0) # false
:digraph.get_short_path(digraph, v1, v2) # [{1.0, 0.0}, {0.0, 0.0}, {1.0, 1.0}]
:digraph.get_short_path(digraph, v2, v1) # false
:digraph.get_short_path(digraph, v0, v2) # [{0.0, 0.0}, {1.0, 1.0}]
