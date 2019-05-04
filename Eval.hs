module Eval where

import Grammar
import Data.Maybe
import Data.Map (Map, (!))
import qualified Data.Map as Map

get1stElem (x, _, _) = x
get2ndElem (_, x, _) = x
get3rdElem (_, _, x) = x

appendToTail elem [] = [elem]
appendToTail elem (x:xs) = x : appendToTail elem xs

loopOnInstructions :: [Exp] -> [[Int]] -> Map String Int -> Map String Int -> ([[Int]], Map String Int, Map String Int)
loopOnInstructions _ [[]] varMap fVarMap = ([], varMap, fVarMap)
loopOnInstructions [] inputStream varMap fVarMap = (inputStream, varMap, fVarMap)
loopOnInstructions (i:is) inputStream varMap fVarMap = loopOnInstructions is output newVarMap newFVarMap
    where result = eval i inputStream varMap fVarMap
          output = get1stElem result
          newVarMap = get2ndElem result
          newFVarMap = get3rdElem result

eval :: Exp -> [[Int]] -> Map String Int -> Map String Int -> ([[Int]], Map String Int, Map String Int)
eval (InitVar name val) inputStream varMap fVarMap = (inputStream, newVarMap, fVarMap)
    where reducedVal = head $ get1stElem (handleVarOps val varMap fVarMap)
          newVarMap = Map.insert name reducedVal varMap
eval (UpdateVar name val) inputStream varMap fVarMap = (inputStream, newVarMap, fVarMap)
    where reducedVal = head $ get1stElem (handleVarOps val varMap fVarMap)
          newVarMap = Map.insert name reducedVal varMap
eval (IfThen cond exps) inputStream varMap fVarMap
    | handleBools cond varMap fVarMap = (inputStream, funcOpsHandler exps varMap fVarMap, fVarMap)
    | otherwise = (inputStream, varMap, fVarMap)
eval (IfElse cond thenExps elseExps) inputStream varMap fVarMap
    | handleBools cond varMap fVarMap = (inputStream, funcOpsHandler thenExps varMap fVarMap, fVarMap)
    | otherwise = (inputStream, funcOpsHandler elseExps varMap fVarMap, fVarMap)
eval (ForEach func) inputStream varMap fVarMap = loopOnInputs func inputStream varMap fVarMap []

funcOpsHandler :: [Exp] -> Map String Int -> Map String Int -> Map String Int
funcOpsHandler [] varMap fVarMap = varMap
funcOpsHandler (i:is) varMap fVarMap = funcOpsHandler is (get2ndElem (eval i [] varMap fVarMap)) fVarMap

loopOnInputs :: FunctionDT -> [[Int]] -> Map String Int -> Map String Int -> [[Int]] -> ([[Int]], Map String Int, Map String Int)
loopOnInputs _ [] varMap fVarMap output = (reverse output, varMap, fVarMap)
loopOnInputs (Function fVarList exps fOutVarOps) (i:is) varMap fVarMap output =
    loopOnInputs (Function fVarList exps fOutVarOps) is newVarMap newfVarMap (fOut : output)
    where newfVarMap = fVarInit (zip fVarList i) fVarMap
          newVarMap = funcOpsHandler exps varMap newfVarMap
          fOut = get1stElem (handleVarOpsList fOutVarOps [] newVarMap newfVarMap)

handleVarOpsList :: [VarOps] -> [Int] -> Map String Int -> Map String Int -> ([Int], Map String Int, Map String Int)
handleVarOpsList (v:vs) output varMap fVarMap = handleVarOpsList vs newOutput varMap fVarMap
    where newOutput = appendToTail ((get1stElem (handleVarOps v varMap fVarMap)) !! 0) output
handleVarOpsList [] output varMap fVarMap = (output, varMap, fVarMap)

fVarInit :: [(String, Int)] -> Map String Int -> Map String Int
fVarInit [] fVarMap = fVarMap
fVarInit (x:xs) fVarMap = fVarInit xs (Map.insert (fst x) (snd x) fVarMap)

handleVarOps :: VarOps -> Map String Int -> Map String Int -> ([Int], Map String Int, Map String Int)
handleVarOps (Int a) varMap fVarMap = ([a], varMap, fVarMap)
handleVarOps (Negate a) varMap fVarMap = ([-reducedA], varMap, fVarMap)
    where reducedA = head $ get1stElem (handleVarOps a varMap fVarMap)
handleVarOps (Plus a b) varMap fVarMap = ([reducedA + reducedB], varMap, fVarMap)
    where reducedA = head $ get1stElem (handleVarOps a varMap fVarMap)
          reducedB = head $ get1stElem (handleVarOps b varMap fVarMap)
handleVarOps (Minus a b) varMap fVarMap = ([reducedA - reducedB], varMap, fVarMap)
    where reducedA = head $ get1stElem (handleVarOps a varMap fVarMap)
          reducedB = head $ get1stElem (handleVarOps b varMap fVarMap)
handleVarOps (Times a b) varMap fVarMap = ([reducedA * reducedB], varMap, fVarMap)
    where reducedA = head $ get1stElem (handleVarOps a varMap fVarMap)
          reducedB = head $ get1stElem (handleVarOps b varMap fVarMap)
handleVarOps (Divide a b) varMap fVarMap = ([reducedA `div` reducedB], varMap, fVarMap)
    where reducedA = head $ get1stElem (handleVarOps a varMap fVarMap)
          reducedB = head $ get1stElem (handleVarOps b varMap fVarMap)
handleVarOps (CallVar a) varMap fVarMap = ([getVar a varMap], varMap, fVarMap)
handleVarOps (FuncVar a) varMap fVarMap = ([getVar a fVarMap], varMap, fVarMap)

getVar :: String -> Map String Int -> Int
getVar name map = fromMaybe (-100000) lookupResult
    where lookupResult = Map.lookup name map

handleBools :: Bools -> Map String Int -> Map String Int -> Bool
handleBools (Equal c1 c2) varMap fVarMap = reducedC1 == reducedC2
    where reducedC1 = head $ get1stElem (handleVarOps c1 varMap fVarMap)
          reducedC2 = head $ get1stElem (handleVarOps c2 varMap fVarMap)
handleBools (GreaterThan c1 c2) varMap fVarMap = reducedC1 > reducedC2
    where reducedC1 = head $ get1stElem (handleVarOps c1 varMap fVarMap)
          reducedC2 = head $ get1stElem (handleVarOps c2 varMap fVarMap)
handleBools (LessThan c1 c2) varMap fVarMap = reducedC1 < reducedC2
    where reducedC1 = head $ get1stElem (handleVarOps c1 varMap fVarMap)
          reducedC2 = head $ get1stElem (handleVarOps c2 varMap fVarMap)
handleBools (GtEq c1 c2) varMap fVarMap = reducedC1 >= reducedC2
    where reducedC1 = head $ get1stElem (handleVarOps c1 varMap fVarMap)
          reducedC2 = head $ get1stElem (handleVarOps c2 varMap fVarMap)
handleBools (LtEq c1 c2) varMap fVarMap = reducedC1 <= reducedC2
    where reducedC1 = head $ get1stElem (handleVarOps c1 varMap fVarMap)
          reducedC2 = head $ get1stElem (handleVarOps c2 varMap fVarMap)
handleBools (NotEqual c1 c2) varMap fVarMap = reducedC1 /= reducedC2
    where reducedC1 = head $ get1stElem (handleVarOps c1 varMap fVarMap)
          reducedC2 = head $ get1stElem (handleVarOps c2 varMap fVarMap)
