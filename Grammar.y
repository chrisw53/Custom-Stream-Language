{
module Grammar where
import Token
}

%name parseCalc
%tokentype { Token }
%error { parseError }
%token
    int { TokenInt $$ }
    var { TokenVar $$ }
    '=' { TokenEq }
    '+' { TokenPlus }
    '-' { TokenMinus }
    '*' { TokenTimes }
    '(' { TokenLParen }
    ')' { TokenRParen }

%left '+' '-'
%left '*' '/'
%left NEG
%%
Exp : Exp '+' Exp            { Plus $1 $3 }
    | Exp '-' Exp            { Minus $1 $3 }
    | Exp '*' Exp            { Times $1 $3 }
    | '(' Exp ')'            { $2 }
    | '-' Exp %prec NEG      { Negate $2 }
    | int                    { Int $1 }
    | var                    { Var $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
data Exp = Plus Exp Exp
         | Minus Exp Exp
         | Times Exp Exp
         | Negate Exp
         | Int Int
         | Var String
         deriving Show
}