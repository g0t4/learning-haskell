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
	- [(a,b,c) | a <- [1..1000], b <- [1..1000], c <- [1..1000], a + b + c == 24, a*a + b*b == c*c]

### strings
- list of characters 
	- `"hello" == ['h', 'e', 'l', 'l', 'o']` evaluates true

## Chapter 3 - Types and Typeclasses

- Types are Capitalized
- `:t` returns type information
- `::` reads "has type of"
- functions have type declarations too, good idea for all but the simplest functions
	- functionName :: type
		- ie: length :: [a] -> Int
	- multi parameter, repeated ->
		- ie: multiply :: Int -> Int -> Int
- Int - integer, bounded, usually 32 bit
- Integer - integer, not bounded
- Float
- Double
- Bool
- Char
- Each variant of a tuple is a unique type based on length and each index's type, also () is an empty tuple of its own type
- :t head 
	- head :: [a] -> a
	- a is a type variable, a generic type parameter, polymorphic
- Typeclasses - like interfaces
	- :t (==)
		- (==) :: (Eq a) => a -> a -> Bool
		- Eq is an equality interface
			- == - equality
			- /= - inequality
	- :t (*)
		- (*) :: (Num a) => a -> a -> a
		- Num is a numeric interface
			- *, -, /, +
	- (Eq a) => and (Num a) => is a class constraint (like generic constraints in other languages)
	- Ord a - ordering
		- >, <, >= and <= etc
		- Ordering: GT, LT, EQ (seems like an enumeration, a set)
		- compare :: (Ord a) => a -> a -> Ordering
		- must have Eq interface first
	- Show
		- show :: (Show a) => a -> String (think print)
	- Read
		- read :: (Read a) => String -> a 
		- think parse and interpret type
		- careful, can be ambiguous, needs usage to infer type
	- Enum
		- sequentially ordered types, can be enumerated
		- Ordering
		- succ and pred work on these
		- Bounded
			- upper and lower bounded Enum
			- maxBound :: Enum a => a
			- minBound :: Enum a => a
			- polymorphic constant
	- Num
		- behave like numbers
		- Numbers appear to be polymorphic constants
			- 3 :: Num a => a
			- Because a number could be an Int, Integer, Float, or Double 
		- Num inherits from Show and Eq
		- Subsets
			- Integral
				- Int and Integer
			- Floating
				- Float and Double
		- fromIntegral :: (Num b, Integral a) => a -> b
			- essentially casts an Integral to Num
- type annotation
	- be explicit about type, in case it can't be inferred, like with read
	- read "5" :: Int - returns 5

## Chapter 4 - Syntax in Functions

### Pattern matching

"patterns are a way of making sure a value conforms to some form and deconstructing it"

Can implement a function several different ways depending on constraints on the inputs

see haskells\sum.hs

- _ if you want to ignore a parameter
- can match with cons operator x:xs to split a list on the head (x) and tail (xs).. also x:y:z:remainder for first three elements followed by remainder
- list comprehensions actually use pattern matching in the bind clause, skips things that don't match
- `as patterns` - break something up but keep reference to entire thing
	- all@(x:xs) - all are all items, x is head, xs is tail

### Guards

Another control flow in defining programs, like an if statement, for readability, note the `=` comes after the guard, like in a pattern

sample:

max' :: Num a => a -> a -> a
max' a b
	| a > b = a
	| otherwise = b

side note: functions can be declared infix with backticks
myCompare :: (Ord a) => a -> a -> Ordering  
a `myCompare` b = compare a b

### where bindings

- similar to let binding, but visible to whole function
- for reuse
- can be functions
- can use pattern matching in where clauses
- great for nested helper functions

### let bindings

- like a where binding, but can be placed anywhere
	- can be used in list comprehensions, omit the `in` portion as it is implicit, variables can be used in map and predicates
- "let bindings are expressions themselves", "where bindings are just syntactic constructs"
- syntax is `let bindings in expression`
	- only visible within the context of the expression after `in`
- if inline, separate bindings with semicolons `;`
- can pattern match ie: let (a,b,c) = (1,2,3) in a+b+c

ie: [let square x = x * x in (square 5, square 3, square 2)]

### case expressions

- case / of
- pattern matching is syntactic sugar for case expressions
	case expression of pattern -> result  
	                   pattern -> result  
	                   pattern -> result 
- can be used pretty much anywhere

## Chapter 5 - Recursion

pattern matching is great for edge cases, along with guards for conditions

see elem.hs in haskells code samples

## Chapter 6 - High order functions

- High order functions - functions that take and return functions
	- multThree 3 5 9 == ((multThree 3) 5) 9
- Curried - All functions in haskell are **curried** and only take one parameter, multi param functions create a function that takes the first argument, and returns a function that takes the second argument and returns a function that takes the third argument and returns the final result.
- **Partially applied** - if not all params are passed
	- essentially returns a function that picks up where you left off params
	- use infix operator to omit/skip the first parameter and any intermediary parameter
- Func parameters - use () to indicate passing a function as an argument
- filter, map - alternatives to using a list comprehension syntax
- takeWhile - easy enough

### Lambdas

left off here

- syntax: \params -> body
- usually surround with () to separate from subsequent expressions
- can include pattern matching, but only one match
- **pattern matching** is often more concise than a lambda
	map (+3) [1,2,3]  OR  map (\x -> x + 3) [1,2,3]

### fold, scan

- foldl / foldr - like Aggregate in LINQ, takes initial accumulator value and a function that operates on the current item and the current accumulator value to return a new accumulator value
- foldl1 / foldr1 - fold but accumulator is initialized to the first or last item respectively
- scanl / scanr - like Aggregate but produces a stream of the current accumulator value instead of just the last value of the accumulator

### $

infix operator

($) :: (a -> b) -> a -> b  
f $ x = f x

- function application like a space but with the lowest precedence
- great way to avoid parenthesis

f $ g x y == f (g x y)

### Function composition

`.` operator - infix

(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x) 

- cleans up expressions (point free style), but if it's really long (many compositions), consider using let to name intermediaries to help with readability

## Chapter 7 - modules

- Prelude - base module included by default
- load syntax
	- import name
	- import name (list)
		- only load specified functions/types in list
	- import Data.List hiding (list)
		- exclude specified functions/types in list
- namespacing
	- import qualified Data.Map 
		- will have to use Data.Map.filter instead of just filter
	- import qualified Data.Map  as M
		- M.filter instead of Data.Map.filter
- standard libraries: http://www.haskell.org/ghc/docs/latest/html/libraries/
	- search via hoogle: http://www.haskell.org/hoogle/
- Data.List
	- intersperse, intercalate, transpose
	- foldl' and foldl1' - strict form of foldl, not lazy loaded, good for long lists to avoid stack overflows, otherwise the aggregate is a promise (thunk) to return a value
	- concat - like selectmany in c#
	- concatMap == combines map followed by a concat
	- and, or, any, all
	- iterate, splitAt, takeWhile, dropWhile
	- span - like takeWhile but returns both the takeWhile result and the remainder, break is a variation on this
	- sort
	- group - groups adjacent equal items
	- inits and tails 
	- isInfixOf, isPrefixOf, isSuffixOf - contains, startswith, endswith
	- elem and notElem
	- partition, predicate to split list into two lists
	- find - Maybe a - FirstOrDefault in LINQ
	- elemIndex - Maybe Int - index of elem
	- elemIndicies - list of indices of all matches of elem
	- findIndex - index of first match of predicate
	- lines - split a string on line breaks
	- unlines - combine a list of strings into one with line breaks
	- words/unwords - split/combine words
	- nub - unique elements in a string
	- delete - delete first occurance of element
	- \\ - infix operator - delete each item in the right list in the left list
	- union (removes duplicates), intersect
	- insert - inserts before the first location that is >= the inserted element
	- genericLength, genericTake, genericDrop, genericSplitAt, genericIndex and genericReplicate - Num versions of the Int classics
	- nubBy, deleteBy, unionBy, intersectBy and groupBy - take the equality operator instead of assuming ==
	- sortBy, insertBy, maximumBy and minimumBy - take the comparison predicate instead of using compare
	- on - composition on two inputs applied to the same function and then combining the two results with one final function
		on :: (b -> b -> c) -> (a -> b) -> a -> a -> c  
		f `on` g = \x y -> f (g x) (g y)
		- when using groupBy et al - usually use (==) `on` something
		- when using sortBy et all - usually use compare `on` something
- Data.Char
	- a ton of character checks
	- GeneralCategory - type enumeration of character categories
	- toUpper, toLower, toTitle (capitalize each word)
	- digitToInt, intToDigit
	- ord - char to int code
	- chr - int code to char 
- Data.Map
	- dictionaries
	- qualify the namespace as it conflicts with Data.List and Prelude
		- import qualified Data.Map as Map 
	- fromList - takes a list of tuples and creates a map
	- requires keys are Ord (so it can build a tree)
	- empty - empty map
	- insert - creates new map with kvp added
	- immutable - functional world!
	- null - empty check
	- size
	- singleton - create map with one kvp
	- lookup - looks up value of a key, or nothing
	- member - checks for a key (true/false)
	- map/filter
	- toList
	- keys and elems
- Data.Set (sets)
	- union, difference etc

### Custom modules

module Name (function export list) where
	... implementation

## Chapter 8 - Custom Types and Typeclasses

### Types

- custom data types
- syntax: data type constructor = value constructors
- ie: data Bool = False | True
	- two value constructors: False and True
- ie: data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)  
	- two value constructors: Circle and Rectangle
	- 3 anonymous arguments
	- deriving (Show) makes it show-able automatically
- **record syntax** for declaring types with named fields (getters)
	- data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     , height :: Float  
                     , phoneNumber :: String  
                     , flavor :: String  
                     } deriving (Show)
### Type parameters

- type constructors produce new types, whereas value constructors produce new values
- Like generic (parameterized) types in c#
- data Maybe a = Nothing | Just a
- Dictionaries, Lists, Sets fall in here

### Derived instances

- typeclasses are like interfaces in OOP languages
- types are instances of typeclasses if they support the behavior of the typeclass
- Eq, Ord, Enum, Bounded, Show and Read can all be automatically applied with default conventions with just using derving suffix to the appropriate value constructor
	- Eq is on all fields defined, if they all implement Eq
	- Show is on all fields, if they all implement Show
	- Read is reverse of Show
	- Ord 
		- different value constructors, the first defined constructor(s) will be considered first in Ord

### Type synonyms

- alias types
- ie: type String = [Char]
	- type PhoneBook = [(String,String)] 
- can help with readability, shows intent of type usage in a scenario
- can be parameterized
	- type AssocList k v = [(k,v)] 
- aside - concrete type: no generic parameters
- can be formed from partial application of type parameters

### Recursive data structures

- Types that are composed of themselves
- ie: data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)  

- aside: infix
	- functions with special characters only are automatically infix
	- can make constructors infix (they are just functions to produce types)
	- syntax: infixr/infixl Int symbol
		- right or left associative respectively
		- Int is how tightly it binds (precedence)
		- ie: 
			infixr 5  ++ 
			(++) :: [a] -> [a] -> [a]  
			[]     ++ ys = ys  
			(x:xs) ++ ys = x : (xs ++ ys)  

## Typeclasses 102

- use `class` to define a typeclass
- ie:
	class Eq a where  
	    (==) :: a -> a -> Bool  
	    (/=) :: a -> a -> Bool  
	    x == y = not (x /= y)  
	    x /= y = not (x == y) 
- use `instance` to define an implementation of the methods of the typeclass on a type
- implement typeclass interface:

	data TrafficLight = Red | Yellow | Green 

	instance Eq TrafficLight where  
    	Red == Red = True  
    	Green == Green = True  
    	Yellow == Yellow = True  
    	_ == _ = False  

- because Eq defines == in terms of /= and vice versa, we only need to implement one to get the other!
- sub classing type classes using typeclass constraints, num is a subclass of Eq:
	
	class (Eq a) => Num a where

- implementing typeclasses on generic types
	
	instance (Eq m) => Eq (Maybe m) where  
    	Just x == Just y = x == y  
    	Nothing == Nothing = True  
    	_ == _ = False  
- :info YourTypeClass (see type classes)

- you can implement an interface on any type/typeclass at any point, that's pretty cool! this might be like an **extension interface** (playing on the idea of extension methods in c#)

### Functor

- generic interface around mapping
	class Functor f where  
	    fmap :: (a -> b) -> f a -> f b  
- ie:
	instance Functor [] where  
    	fmap = map  

### typefoo

- types have kinds, * is a concrete type
- generic types are curried like functions, can be partially applied

## Chapter 9 - IO

"If we want to deal with impure data, we have to do it in an impure environment. So the taint of impurity spreads around much like the undead scourge and it's in our best interest to keep the I/O parts of our code as small as possible." - I've been preaching this a lot, lines up with my strategy for async calls in nodejs too, keep it in integration layers, sync within a domain.

"I/O actions will only be performed when they are given a name of main or when they're inside a bigger I/O action that we composed with a do block."

"use <- when you want to bind results of I/O actions to names"

if blocks in do block must both be IO actions

"the return in Haskell is really nothing like the return in most other languages"

"use let bindings in do blocks to bind to names"

- do - chain I/O actions
	- let bindings don't require `in`, use them for calling pure functions to assign the result to a variable
- void I/O actions don't rqeuire <- binding syntax, nothing to bind
- I/O actions are composable like regular functions
- return - not like return in imperative languages
	- boxes a value into an I/O action result

- I/O actions print/read
	- putStr/putChar - print string or character
	- getChar - get a character at a time, but it only accepts after return, then will be called once per character if in a recursive loop
	- when - conditionally perform an I/O action or do nothing
		- eliminates need for else return ()
	- sequence - execute a sequence of I/O actions, if binding the result it will bind it to an array of return values
	- mapM / mapM_ - applies a map to a list and sequence to the result (a common pattern)
	- forever - repeat an I/O action forever
	- forM - mapM with arguments reversed so map function comes last (readability as it can wrap lines)

key point: I/O actions are values, when placed in the context of main the I/O action value will be executed

### files

- getContents - lazy I/O action to get contents of something (terminates on EOF)
- interact - get a line from some input, transform it and output the transform
- openFile - opens a file handle
	openFile :: FilePath -> IOMode -> IO Handle 
	handle <- openFile "girlfriend.txt" ReadMode 
- hGetContents - lazy - gets contents of a handles, like getContents
- hClose - close the handle
- withFile - opens/closes the file for you

    withFile "girlfriend.txt" ReadMode (\handle -> do  
        contents <- hGetContents handle     
        putStr contents)

- also hGetLine, hPutStr, hPutStrLn, hGetChar
- simplified use
- readFile :: FilePath -> IO String
- writeFile :: FilePath -> String -> IO ()
- appendFile :: FilePath -> String -> IO ()
- hSetBuffering - control buffering in lazy loaded handle resources
- openTempFile - open a temporary (random named) file

checkout System.Directory and System.IO

### command line arguments

System.Environment
- getArgs :: IO [String] - get the arguments
- getProgName :: IO String - get the program's name

### randomness

System.Random
- random :: (RandomGen g, Random a) => g -> (a, g)
- RandomGen - typeclass for a source of random numbers (ie: StdGen)
- Random - typeclass for a set of random numbers (ie: Num, Bool, Int)
- StdGen - typeclass that implements Random
	- mkStdGen :: Int -> StdGen
- usage: random (mkStdGen 100) :: (Int, StdGen) - makes a random Int
- random (mkStdGen 949488) :: (Float, StdGen) - makes a random Float
- randoms - take a generator and produce an infinite stream of random numbers
	- take 5 $ randoms (mkStdGen 11) :: [Int]
- randomR - random number in a range
- randomRs - stream of random numbers in a range
- getStdGen - returns IO StdGen, so you can get the system to introduce a random number for you - random side effects :), obviously has to be in the context of an I/O action (main) to execute it
- newStdGen - create a new generator, otherwise getStdGen returns the same each time

### Bytestrings

- lazy lists are inefficient at times, bytestrings address performance
- Data.ByteString 4- strict bytestrings, instantly evaluated, each item is 8 bytes only on first usage, not as used
- Data.ByteString.Lazy - lazy bytestrings, but still only 8 bytes per item - unlike a list where each item is a promise, in lazy bytestrings, each chunk is a promise (usually 64k at a time)
- pack/unpack - list of bytes to bytestring, or vice versa
- cons - lazy add a byte
- cons' - strict add a byte
- empty - empty byte string
- a bunch of methods like list

### Exceptions

- Really intended for impure sections of code only, can't be handled in pure functions as you don't know when things will be evaluated and in what order.
- Can be thrown anywhere
- Getting the feeling it's preferred to use status codes in pure functions, but the reality is most errors are in I/O so that's already an impure concept so this shouldn't be a huge concern in pure areas, though things like validation are nice to encapsulate so we'll see.
- :) userError :: String -> IO Error
- catch - a catch function, takes try action and handler action, clever to call it infix: toTry `catch` handler
	- catch :: IO a -> (IO Error -> IO a) -> IO a
	- handler :: IO Error -> IO a
- built in error checks like: isAlreadyExistsError for files
- to rethrow, just return the original IO Error

## Chapter 11

- "We don't have to think about types belonging to a big hierarchy of types. Instead, we think about what the types can act like and then connect them with the appropriate typeclasses."

### Functors revisited
- IO implements Functor so you can fmap to translate the result
- fmap with functions is more or less an alias to composition with `.`
	- fmap (*3) (+1) == (*3) . (+1)
	- ((->) r) has a Functor implementation in Control.Monad.Instances
- can partially apply a Functor (fmap) to create reusable maps that can be applied to various Functors, ie: `fmap (replicate 3)` would create a repeater that triplicates the value inside any functor.
- Functor laws
	- 1. "if we map the id function over a functor, the functor that we get back should be the same as the original functor"
		- `id == (\x -> x)`
		- 1. restated: fmap id = id
	- 2. "composing two functions and then mapping the resulting function over a functor should be the same as first mapping one function over the functor and then mapping the other one"
		- fmap (f.g) == (fmap f) . (fmap g)
		- or fmap (f . g) F = fmap f (fmap g F)
	- Justification: "If a type obeys the functor laws, we know that calling fmap on a value of that type will only map the function over it, nothing more."

### Applicative functors

A beefed up functor!
We can do: `fmap 2 $ fmap (*) [1,2,2]` to create a list of partially applied functors and then to provide 2 as the secondary input to (*) to complete to computation but we can't do `fmap 2 $ fmap (*) Just 3` to get `Just 6` but with Applicative we can!

class (Functor f) => Applicative f where  
    pure :: a -> f a  
    (<*>) :: f (a -> b) -> f a -> f b  

- <*> is left associative
- pure f <*> x equals fmap f x
- Control.Applicative exports <$> which is an infix fmap operator

(<$>) :: (Functor f) => (a -> b) -> f a -> f b  
f <$> x = fmap f x  

"To use a normal function on applicative functors, just sprinkle some <$> and <*> about and the function will operate on applicatives and return an applicative."

- list Applicative implementation

instance Applicative [] where  
    pure x = [x]  
    fs <*> xs = [f x | f <- fs, x <- xs]  

note: left operator is a list of functions so this results in a join if multiple operators supplied, ie:

if I wanted to multiply all items in a list by 3 and divide by 3 I could:

[(*3),(/3)] <*> [1,2]

also, "Using the applicative style on lists is often a good replacement for list comprehensions." all 3 of these are the same:

pure (*3) <*> [1,2,3] 
[(*3)] <*> [1,2,3] 
[(x*3) | x <- [1,2,3]]

- Applicative and IO

instance Applicative IO where  
    pure = return  
    a <*> b = do  
        f <- a  
        x <- b  
        return (f x) 

so now we can do:

pure ("Hello "++) <*> getLine

<*> is piping the result of getLine through "Hello "++

- Appicative functions

instance Applicative ((->) r) where  
    pure x = (\_ -> x)  
    f <*> g = \x -> f x (g x)  

- ZipList 

apply a separate function per item in a list
getZipList to show them
getZipList $ ZipList [(+1),(+2),(+3)] <*> ZipList [100,100,100]

- liftA2 (short hand)

liftA2 :: (Applicative f) => (a -> b -> c) -> f a -> f b -> f c  
liftA2 f a b = f <$> a <*> b  

- Applicative laws

pure f <*> x = fmap f x
pure id <*> v = v
pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
pure f <*> pure x = pure (f x)
u <*> pure y = pure ($ y) <*> u

### newtype

- take one type and wrap it as a new type
- newtype ZipList a = ZipList { getZipList :: [a] }  
- only one ctor and one field

- data v type v newtype
	"If you just want your type signatures to look cleaner and be more descriptive, you probably want **type** synonyms. If you want to take an existing type and wrap it in a new type in order to make it an instance of a type class, chances are you're looking for a **newtype**. And if you want to make something completely new, odds are good that you're looking for the **data** keyword."
