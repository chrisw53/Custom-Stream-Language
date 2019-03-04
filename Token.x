{
module Token where
}

%wrapper "posn"
$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
    $white+     ;
    "--".*      ;
    copy        { tok (\p s -> TokenCopy p) }
    f\$         { tok (\p s -> TokenFVarCall p) }
    \$          { tok (\p s -> TokenVarCall p) }
    initVar     { tok (\p s -> TokenInitVar p) }
    fVar        { tok (\p s -> TokenFVarInit p) }
    $digit+     { tok (\p s -> TokenInt p (read s)) }
    \=          { tok (\p s -> TokenEq p) }
    \+          { tok (\p s -> TokenPlus p) }
    \-          { tok (\p s -> TokenMinus p) }
    \*          { tok (\p s -> TokenTimes p) }
    \(          { tok (\p s -> TokenLParen p) }
    \)          { tok (\p s -> TokenRParen p) }
    \;          { tok (\p s -> TokenEndStmt p) }
    \{          { tok (\p s -> TokenLBracket p) }
    \}          { tok (\p s -> TokenRBracket p) }
    \/          { tok (\p s -> TokenDivide p) }
    \,          { tok (\p s -> TokenComma p) }
    if          { tok (\p s -> TokenIf p) }
    else        { tok (\p s -> TokenElse p) }
    updateVar   { tok (\p s -> TokenUpdateVar p) }
    ARGS        { tok (\p s -> TokenInputArgs p) }
    appendHead  { tok (\p s -> TokenAppendHead p) }
    return      { tok (\p s -> TokenReturn p) }
    function    { tok (\p s -> TokenFunction p) }
    forEach     { tok (\p s -> TokenForEach p) }
    $alpha [$alpha $digit \_ \’]*   { tok (\p s -> TokenString p s) }

{
tok f p s = f p s

data Token =
    TokenInitVar AlexPosn     |
    TokenCopy AlexPosn        |
    TokenInt AlexPosn Int     |
    TokenEq AlexPosn          |
    TokenPlus AlexPosn        |
    TokenMinus AlexPosn       |
    TokenTimes AlexPosn       |
    TokenLParen AlexPosn      |
    TokenRParen AlexPosn      |
    TokenIf AlexPosn          |
    TokenElse AlexPosn        |
    TokenFVarCall AlexPosn    |
    TokenFVarInit AlexPosn    |
    TokenVarCall AlexPosn     |
    TokenEndStmt AlexPosn     |
    TokenLBracket AlexPosn    |
    TokenRBracket AlexPosn    |
    TokenUpdateVar AlexPosn   |
    TokenInputArgs AlexPosn   |
    TokenDivide AlexPosn      |
    TokenAppendHead AlexPosn  |
    TokenReturn AlexPosn      |
    TokenFunction AlexPosn    |
    TokenComma AlexPosn       |
    TokenForEach AlexPosn     |
    TokenString AlexPosn String
    deriving (Eq,Show)

tokenPosn :: Token -> String
tokenPosn (TokenString (AlexPn a l c) s) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInitVar (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCopy (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTimes (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFVarCall (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFVarInit (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVarCall (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEndStmt (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenUpdateVar (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInputArgs (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDivide (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAppendHead (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenReturn (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunction (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenForEach (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
}
