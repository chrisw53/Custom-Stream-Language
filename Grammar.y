{
module Grammar where
import Token
}

%name parseCalc
%tokentype { Token }
%error { parseError }
%token
    int		{ TokenInt $$ }
    var		{ TokenVar }
    string	{ TokenString $$ }
    '=' 	{ TokenEq }
    '+' 	{ TokenPlus }
    '-' 	{ TokenMinus }
    '*' 	{ TokenTimes }
    '(' 	{ TokenLParen }
    ')' 	{ TokenRParen }

%left '+' '-'
%left '*' '/'
%left NEG
%%
Exps :: { [ Exp ] }
Exps : Exps Exp              { $2 : $1 }
Exps : Exp                   { [$1] }

Exp : Exp '+' Exp            { Plus $1 $3 }
    | var string '=' int     { InitVar $2 $4 }
    | var string	     { Var $2 }
    | Exp '-' Exp            { Minus $1 $3 }
    | Exp '*' Exp            { Times $1 $3 }
    | '(' Exp ')'            { $2 }
    | '-' Exp %prec NEG      { Negate $2 }
    | int                    { Int $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
data Exp = Plus Exp Exp
         | Minus Exp Exp
         | Times Exp Exp
         | Negate Exp
         | Int Int
         | InitVar String Int
         | Var String
         deriving Show
}