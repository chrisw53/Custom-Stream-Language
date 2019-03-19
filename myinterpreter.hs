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
      let streamsList = filter (\x -> x /= []) (map (\x -> map read $ words x  :: [Int]) (splitOn "\n" streams))
      sourceCode <- readFile fileName
      let instructions = parseProg $ alexScanTokens sourceCode
      prettyPrint $ get1stElem (loopOnInstructions instructions streamsList varMap fVarMap)

prettyPrint :: [[Int]] -> IO()
prettyPrint [] = putStr ""
prettyPrint (i:is) = do
                   putStrLn $ unwords (map show i)
                   prettyPrint is

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()