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

### Non Strict

Only evaluates as much as is needed to compute the desired result (lazy evaluation)

### Higher order functions

Functions as first class citizens (passed, returned, stored etc)

### Memory management

### Performance

Functional languages trade performance for expressiveness, so when performance is a concern, it's better to use an imperative language where you can explicitly express those performance concerns.  BUT like memory management, when it is irrelevant, then take advantage of expressiveness instead which is probably always going to be relevant. OR IMO use a library that is perform-ant and hide that away (what versus how).

### Type inference

Huge to have statically typed languages where you don't have to explicitly label types all the time, which I like cuz the variable name should express the significant component of the type and carries throughout a program and isn't left behind in a declaration.

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

## Free books

http://book.realworldhaskell.org/read
http://learnyouahaskell.com/chapters

## Suggested learning

- http://stackoverflow.com/questions/1012573/getting-started-with-haskell
	- Great answer with a guide by skill level
	- Noob	
		- http://learnyouahaskell.com/chapters
			- Read first 6 chapters
		- 99 problems in haskell
			- http://haskell.org/haskellwiki/H-99%3a_Ninety-Nine_Haskell_Problems
		- chapters 7 & 8 of learn you a haskell
		- Euler problems
			- http://projecteuler.net/index.php?section=problems
	- Beginner
		- http://book.realworldhaskell.org/
			- monads will come up in about chapter 14
				- http://www.haskell.org/haskellwiki/Tutorials#Using_monads
				- http://www.haskell.org/haskellwiki/All_About_Monads
			- beginners can stop and focus on monads instead of finishing the book, which happens at the intermediate stage (suggested)
		- then try 20 intermediate haskell exercises
			- http://blog.tmorris.net/20-intermediate-haskell-exercises/
	- Intermediate
		- when you have a handle on monads
		- understand monad transformers
		- finish real world haskell book (can skip chapters after you understand monads)
		- make sure you know these modules
			- parsec - parsing programs and text, superior to regex!
			- quickcheck - fuzzy testing
			- hunit - unit testing
			- gtk2hs - gui
			- happstack - web dev fwk
		- Monad concept
			- http://www.haskell.org/haskellwiki/Typeclassopedia
			- terms: Applicative, Foldable, Traversable, Monoid, Arrows, Arrays, ST Monad, FRP (reactive)
		- Try out these language features
			- Multiparameter type classes/functional dependencies
			- Type families
			- Existentially quantified types
			- Phantom types
			- GADTS
		- Tools to understand
			- ghc - all of the compiler's features
			- cabal - package system
			- darcs - distributed vcs written in haskell
			- haddock - auto documentation
		- Do a project in haskell like a website
	- Expert
		- academics lol
	- Getting Help
		- #haskell irc channel
		- mailing lists - http://haskell.org/haskellwiki/Mailing_lists
		- haskell.org