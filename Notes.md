## Intro

http://www.haskell.org/haskellwiki/Introduction

### Imperative v Functional
- Imperative - follows a sequence, functional - evaluates an expression
- Functional - focus is on what is to be computed, now how it should be computed (think of spreadsheet relationships)
- **Assignment isn't useful**, you don't know when it will happen, instead data flows through relationships
- SQL - functional expression that can be evaluated in many ways
	- Linq2Sql is similar with expression trees
- Often easier to understand functional since it's only what and not ALSO how!
	- quicksort: `qsort (p:xs) = qsort [x | x<-xs, x<p] ++ [p] ++ qsort [x | x<-xs, x>=p]`
		- take a list, take the first element p and the remaining list xs, three lists with p in the middle. the two outer lists are computed by applying a list comprehension quicksort(xs.where(x<p)) and quicksort(xs.where(x>=p))
		- this sacrifices efficiency for conciseness and is ELEGANT!
		- one thing of note is you can use functional concepts in imperative languages, the linq version of the quicksort above is not much different, just perhaps not as much syntactic sugar but pretty darn close (see test files I added in this commit)
			
## Language

- Parenthesis 
	- grouping like in mathematics in expressions
	- or in function pattern matching for varying implementations
- Function application - take function `f` and variable `x`, the application is `f x`
- `++` - list concatenation operator
- Function declaration
	- first line is signature
		- `name :: argument\return constraints`
	- next lines are one or more patterns for handling that signature
	- 

## Free book

http://book.realworldhaskell.org/read