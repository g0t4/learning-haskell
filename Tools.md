## Haskell Platform

http://www.haskell.org/platform/

- ghc - compiler to native code
	- ghc --make code.hs
	- ./code
- ghci - interactive haskell
	- `:quit` to quit
	- `:l myfunctions` to load/reload a haskell script from myfunctions.hs
	- :m + Data.List
		- load a module
	- :info YourTypeClass
		- see type classes
- runghc - run a haskell script without compiling

## Cabal - package manager

Hackage == npmjs.org

http://www.haskell.org/cabal/users-guide/
http://hackage.haskell.org/packages/hackage.html

install hackage package list:
`cabal update`

example:
`cabal install hunit`

## Testing

http://jasani.org/2007/12/05/unit-testing-with-hunit-in-haskell/
hunit - http://hunit.sourceforge.net/HUnit-1.0/Guide.html

so far to run tests I've determined to do it this way and I'm sure there's a better way coming:
`ghci testfile.hs`
if successfully loaded then run:
`runTestTT testName`








