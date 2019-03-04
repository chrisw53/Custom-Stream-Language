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
fVarMap = Map.empty

main :: IO ()
main = catch main' noParse

main' = do
      (fileName : _) <- getArgs
      streams <- getContents
      let streamsList = map (\x -> map read $ words x  :: [Int]) (splitOn "\n" streams)
      sourceCode <- readFile fileName
      let instructions = parseProg $ alexScanTokens sourceCode
      runProg instructions streamsList varMap fVarMap

-- Case where the input stream is empty
runProg _ [] _ _ = putStr ""
-- Case where the program is empty
runProg [] inputArgs _ _ = prettyPrint inputArgs
-- Otherwise run the program on each element of the streams
runProg ins (x:xs) vars fvars = do
      prettyPrint output
      runProg ins xs newVarMap newfVarMap
      where result = eval ins x vars fvars
            output = get1stElem result
            newVarMap = get2ndElem result
            newfVarMap = get3rdElem result

get1stElem (x, _, _) = x
get2ndElem (_, x, _) = x
get3rdElem (_, _, x) = x

prettyPrint intList = print $ unwords (map show intList)

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()