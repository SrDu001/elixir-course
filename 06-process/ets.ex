table = :ets.new(:my_bucket, [:set, :protected]) #Reference<0.2906956179.1089339395.75160>
:ets.insert(table, {"a", 1}) # true
:ets.insert(table, {"a", 2}) # true
:ets.lookup(table, "a") # [{"a", 2}]
:ets.insert(table, {"a", 1}) # true
:ets.lookup(table, "a") # [{"a", 1}]

##############

table = :ets.new(:my_bucket, [:bag, :protected]) #Reference<0.2906956179.1089339395.75162>
:ets.insert(table, {"a", 1}) # true
:ets.insert(table, {"a", 2}) # true
:ets.lookup(table, "a") # [{"a", 1}, {"a", 2}]
:ets.insert(table, {"a", 1}) # true
:ets.lookup(table, "a") # [{"a", 1}, {"a", 2}]

##############

table1 = :ets.new(:my_bucket, [:bag, :protected]) #Reference<0.2906956179.1089339395.75221>
:ets.insert(table1, {:hello, 1}) # true
:ets.insert(table1, {:hello, 2}) # true
:ets.lookup(table1, :hello) # [{:hello, 1}, {:hello, 2}]
spawn_link fn -> :ets.lookup(table1, :hello) end #PID<0.115.0>
parent = self() # PID<0.102.0>
spawn_link fn -> send parent, :ets.lookup(table1, :hello) end # PID<0.118.0>
receive do
  x -> x
end # [hello: 1, hello: 2]
spawn_link fn -> send parent, :ets.insert(table1, {:hello, 3}) end # throws ArgumentError, cant insert, table1 is protected

##############

table1 = :ets.new(:my_bucket, [:bag, :private]) #Reference<0.2906956179.1089339395.75372>
parent = self() #PID<0.124.0>
spawn_link fn -> send parent, :ets.lookup(table1, "a") end # throws ArgumentError, cant lookup, table1 is private
