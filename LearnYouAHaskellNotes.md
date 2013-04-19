## Chapter 2 Starting Out

- Negative numbers wrap in parenthesis
- `/=` inequality, `==` equality
- infix operators should just be seen as operators, ie: `+` and `*`
- `succ` return successive value
- function application doesn't use (), it uses spaces
- function application takes highest precedence
- functions with two parameters can be called as an infix with backticks, ie: 91 `div` 10  (now I guess my back ticks weren't a good idea :( in my notes)
- function definition ordering is irrelevant (I assume from lazy evaluation)

- if / else, else is required, all if statements are expressions since else is required and thus any if statement always returns something

### lists

- homogeneous only
- ie: `[1,2,3]` 
- `++` concatenation - but can be slow with long lists
- `:` cons operator - instantaneous add a single item to the beginning of a list
- `[]` empty list
- `[1,2,3]` is syntactic sugar for `1:2:3:[]`
- `!!` indexer, 0 offset, ie: `[1,2]!!0 == 1`
- lists can be compared, if all items are of the same type and individually comparable
	- compared in lexicographical order of elements, starting with head or 0 indexed item and moving through each item in the list
- functions
	- head - first item
	- tail - all items after head
	- last - last item
	- init - reverse of `tail`, returns all items but last
	- length - length of list
	- null - checks if emtpy, boolean result
	- reverse
	- take x - take x items (returns whole list if x > length)
	- drop x - removes first x items (returns empty if x > length)
	- maximum
	- minimum
	- sum
	- product - multiplies all items together
	- elem - check if element is in list, usually as infix: 4 `elem` [3,4,5] returns true
	- [x..y] - range in a list of all items from x to y
	- [initial,next..last] - range with a step, where next-initial is the step size
		- for reverse order do: [20,19..1] for 20 to 1
	- infinite lists - [1,2..]
	- cycle - infinite repetition of a list 
		- take 5 (cycle [1,2,3]) == [1,2,3,1,2]
	- repeat - infinite list of one item
		- take 3 (repeat 5) == [5,5,5] == replicate 3 5
		- replicate is short hand for take and repeat
- list comprehensions
	- syntactic sugar for manipulating lists
	- similar to set comprehensions in mathematics!
		- http://en.wikipedia.org/wiki/Set-builder_notation
		- map function, list and predicate
	- format: [map | bind, predicate(s)]
		- bind ie: x <- [1..10]
		- map ie: x * 10
		- predicate (optional) ie: x > 5
			- multiple with comma separation x > 5, x < 7 (only true for 6)
		- soooooo bind hrm, sounds monadish?!?
	- can draw from multiple lists
		- [ x * y | x <- [2,5,10], y <- [8,10,11]]
		- cross product?
	- strings are char lists so comprehensions work here too :)
- tuples
	- **fixed sized** list of potentially varying types
		- pair - two item tuple
		- to be the same type of tuple, each index in the tuple must hold the same type
	- `(1,2,3,'a')`
	- pair operations
		- fst - first item in tuple
		- snd - second item in tuple
	- zip operator produces tuples
	- all triangles with perimeter of 24 and with length of each side an integer less than 10  
	- [[a,b,c] | a <- [1..1000], b <- [1..1000], c <- [1..1000], a + b + c == 24, a*a + b*b == c*c]


### strings
- list of characters 
	- `"hello" == ['h', 'e', 'l', 'l', 'o']` evaluates true