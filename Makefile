all: myinterpreter

Token.hs : Token.x
		alex Token.x

Grammar.hs : Grammar.y
		happy Grammar.y

myinterpreter : Token.hs Grammar.hs
		ghc --make -O2 myinterpreter

clean:
		rm -f myinterpreter Eval Grammar.hs Token.hs *.o *.hi