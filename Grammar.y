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
    inputArgs	{ TokenInputArgs _ }
    appendHead	{ TokenAppendHead _ }
    function	{ TokenFunction _ }
    forEach	{ TokenForEach _ }
    return	{ TokenReturn _ }
    ','		{ TokenComma _ }
    'f$'        { TokenFVarCall _ }
    '$'		{ TokenVarCall _ }
    '=' 	{ TokenEq _ }
    '+' 	{ TokenPlus _ }
    '-' 	{ TokenMinus _ }
    '*' 	{ TokenTimes _ }
    '(' 	{ TokenLParen _ }
    ')' 	{ TokenRParen _ }
    ';'         { TokenEndStmt _ }
    '{'		{ TokenLBracket _ }
    '}'		{ TokenRBracket _ }
    '/'		{ TokenDivide _ }

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

Exp : var string '=' VarOps          		{ InitVar $2 $4 }
    | '(' Exp ')'                 		{ $2 }
    | if Exp '{' Exp '}'	  		{ IfThen $2 $4 }
    | if Exp '{' Exp '}' else '{' Exp '}'	{ IfElse $2 $4 $8 }
    | updateVar string '=' VarOps		{ UpdateVar $2 $4 }
    | appendHead
    	'(' VarOps ')'
    	'(' inputArgs ')'			{ AppendHead $3 }
    | forEach
    	'(' inputArgs ')'
    	'{' FunctionDT '}'			{ ForEach $6 }


FunctionDT : function
        	'(' VarList ')'
        	'{'
        	Exps return '(' VarOps ')'
        	'}'				{ Function $3 $6 $9 }
    	   | function
    		'(' VarList ')'
    		'{' return '(' VarOps ')' '}'	{ Function $3 [] $8}


VarOps : 'f$' string                 		{ FuncVar $2 }
       | '$' string                  		{ CallVar $2 }
       | int					{ Int $1 }
       | inputArgs				{ InputArgs }
       | VarOps '+' VarOps			{ Plus $1 $3 }
       | VarOps '-' VarOps                 	{ Minus $1 $3 }
       | VarOps '*' VarOps                 	{ Times $1 $3 }
       | VarOps '/' VarOps			{ Divide $1 $3}
       | '-' VarOps %prec NEG           	{ Negate $2 }
       | copy '(' VarOps ')'			{ Copy $3 }
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
            | Copy VarOps
            | InputArgs
	    deriving Show

data FunctionDT = Function [String] [Exp] VarOps deriving Show

data Exp = InitVar String VarOps
         | UpdateVar String VarOps
         | IfElse Exp Exp Exp
         | IfThen Exp Exp
         | AppendHead VarOps
         | ForEach FunctionDT
         deriving Show
}