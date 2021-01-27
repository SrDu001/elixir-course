list  = [a: 1, b: 2]

IO.pits list[:c]  # Returns nil
#

# x = []
# If x = [a: a], then:
# {a:, a} = {:a, 1}
# a = 1

[a: a] = [a: 1, b: 2] # Throws a MatchError
# [{:a, a}] = [{:a, 1}, {:b, 2}] # Different Lenght

# [b: b, a: a] = [a: 1, b: 2] # Throws a MatchError

# Note:
# Enum(list, index) returns the value in a index
