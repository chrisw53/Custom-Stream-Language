import Token
import Grammar
import Eval
import System.Environment
import Control.Exception
import System.IO
import Data.List.Split
import Data.Map (Map, (!))
import qualified Data.Map as Map

varMap = Map.empty
functionVarMap = Map.empty

main :: IO ()
main = catch main' noParse

main' = do
      (fileName : _ ) <- getArgs
      sourceText <- readFile fileName
      putStrLn ("Parsing : " ++ sourceText)
      let parsedProg = eval (parseCalc $ alexScanTokens sourceText) varMap functionVarMap argList
      putStrLn ("Parsed as " ++ show parsedProg)

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()