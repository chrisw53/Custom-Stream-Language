{
module Token where
}

%wrapper "basic"
$digit = 0-9
$alpha = [a-zA-Z]

tokens :-
    $white+     ;
    "--".*      ;
    copy        { \s -> TokenCopy }
    var         { \s -> TokenVar }
    $digit+     { \s -> TokenInt (read s) }
    \=          { \s -> TokenEq }
    \+          { \s -> TokenPlus }
    \-          { \s -> TokenMinus }
    \*          { \s -> TokenTimes }
    \(          { \s -> TokenLParen }
    \)          { \s -> TokenRParen }
    $alpha [$alpha $digit \_ \’]*   { \s -> TokenString s }

{
-- Each action has type :: String -> Token
-- The token type:
data Token =
  TokenVar         |
  TokenCopy        |
  TokenInt Int     |
  TokenEq          |
  TokenPlus        |
  TokenMinus       |
  TokenTimes       |
  TokenLParen      |
  TokenRParen      |
  TokenIf          |
  TokenElse        |
  TokenString String
  deriving (Eq,Show)

}
