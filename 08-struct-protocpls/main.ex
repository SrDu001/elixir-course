# alias Geometry.Rectangle
# alias Geometry.Circle
# alias Geometry.Shape
alias Geometry.{Rectangle, Circle, Shape}

print = fn shape ->
  IO.puts("")
  IO.puts("area(#{inspect shape}) = #{Shape.area(shape)}")
  IO.puts("perimeter(#{inspect shape}) = #{Shape.perimeter(shape)}")
end

rect = %Rectangle{b: 3, h: 4}
print.(rect)
# IO.puts Shape.area(rect)
# IO.puts Shape.perimeter(rect)

# TODO: uncomment next line to throws an ArgumentError
# rect = %Rectangle{}

rect = %Rectangle{b: 4}
print.(rect)
# IO.puts Shape.area(rect)
# IO.puts Shape.perimeter(rect)

circle = %Circle{}
print.(circle)
# IO.puts Shape.area(circle)
# IO.puts Shape.perimeter(circle)

any = "hola"
print.(any)
# IO.puts Shape.area(any)
# IO.puts Shape.perimeter(any)

###################################
IO.puts rect.__struct__
# %{}.__struct__ # throws an error

IO.inspect Map.keys(rect) # [:__struct__, :b, :h]
IO.inspect Map.values(rect) # [Geometry.Rectangle, 1, 1]

new_rect = %{rect | b: 1}
IO.inspect new_rect
new_rect = %{rect | b: 3, h: 5}
IO.inspect new_rect
