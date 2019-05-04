{
module Grammar where
import Token
}

%name parseProg
%tokentype { Token }
%error { parseError }
%token
    int		{ TokenInt _ $$ }
    var		{ TokenInitVar _ }
    fVar	{ TokenFVarInit _ }
    string	{ TokenString _ $$ }
    copy	{ TokenCopy _ }
    if		{ TokenIf _ }
    else	{ TokenElse _ }
    updateVar	{ TokenUpdateVar _ }
    function	{ TokenFunction _ }
    forEach	{ TokenForEach _ }
    return	{ TokenReturn _ }
    ','		{ TokenComma _ }
    'f$'        { TokenFVarCall _ }
    '$'		{ TokenVarCall _ }
    '=' 	{ TokenEq _ }
    '=='	{ TokenCompEq _ }
    '<'		{ TokenCompLt _ }
    '>'		{ TokenCompGt _ }
    '<='	{ TokenCompLtEq _ }
    '>='	{ TokenCompGtEq _ }
    '!='	{ TokenCompNotEq _ }
    '+' 	{ TokenPlus _ }
    '-' 	{ TokenMinus _ }
    '*' 	{ TokenTimes _ }
    '(' 	{ TokenLParen _ }
    ')' 	{ TokenRParen _ }
    ';'         { TokenEndStmt _ }
    '{'		{ TokenLBracket _ }
    '}'		{ TokenRBracket _ }
    '/'		{ TokenDivide _ }
    '&'		{ TokenAnd _ }

%left '+' '-'
%left '*' '/'
%left NEG
%%

Exps :: { [ Exp ] }
Exps : Exp ';' Exps                		{ $1 : $3 }
Exps : Exp ';'                      		{ [$1] }

VarList :: { [String] }
VarList : fVar string ',' VarList		{ $2 : $4 }
VarList : fVar string				{ [$2] }

VarOpsList :: { [VarOps] }
VarOpsList : VarOps '&' VarOpsList		{ $1: $3 }
VarOpsList : VarOps				{ [$1] }

Exp : var string '=' VarOps          		{ InitVar $2 $4 }
    | '(' Exp ')'                 		{ $2 }
    | if '(' Bools ')'
    	'{' Exps '}'	  			{ IfThen $3 $6 }
    | if '(' Bools ')'
    	'{' Exps '}' else '{' Exps '}'		{ IfElse $3 $6 $10 }
    | updateVar string '=' VarOps		{ UpdateVar $2 $4 }
    | forEach '{' FunctionDT '}'		{ ForEach $3 }

Bools: VarOps '==' VarOps			{ Equal $1 $3 }
     | VarOps '>' VarOps			{ GreaterThan $1 $3 }
     | VarOps '<' VarOps			{ LessThan $1 $3 }
     | VarOps '>=' VarOps			{ GtEq $1 $3 }
     | VarOps '<=' VarOps			{ LtEq $1 $3 }
     | VarOps '!=' VarOps			{ NotEqual $1 $3 }

FunctionDT : function
        	'(' VarList ')'
        	'{'
        	Exps return '(' VarOpsList ')'
        	'}'				{ Function $3 $6 $9 }
    	   | function
    		'(' VarList ')'
    		'{'
    		return '(' VarOpsList ')'
    		'}'				{ Function $3 [] $8}

VarOps : 'f$' string                 		{ FuncVar $2 }
       | '$' string                  		{ CallVar $2 }
       | int					{ Int $1 }
       | VarOps '+' VarOps			{ Plus $1 $3 }
       | VarOps '-' VarOps                 	{ Minus $1 $3 }
       | VarOps '*' VarOps                 	{ Times $1 $3 }
       | VarOps '/' VarOps			{ Divide $1 $3}
       | '-' VarOps %prec NEG           	{ Negate $2 }
{
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data VarOps = FuncVar String
	    | CallVar String
	    | Int Int
	    | Plus VarOps VarOps
	    | Minus VarOps VarOps
            | Times VarOps VarOps
            | Divide VarOps VarOps
            | Negate VarOps
	    deriving Show

data Bools = Equal VarOps VarOps
	   | GreaterThan VarOps VarOps
	   | LessThan VarOps VarOps
	   | GtEq VarOps VarOps
	   | LtEq VarOps VarOps
	   | NotEqual VarOps VarOps
	   deriving Show

data FunctionDT = Function [String] [Exp] [VarOps] deriving Show

data Exp = InitVar String VarOps
         | UpdateVar String VarOps
         | IfElse Bools [Exp] [Exp]
         | IfThen Bools [Exp]
         | ForEach FunctionDT
         deriving Show
}