module Eval where

import Grammar
import Data.Map (Map, (!))
import qualified Data.Map as Map

eval :: [Exp] -> [Int] -> Map String Int -> Map String Int -> ([Int], Map String Int, Map String Int)
eval _ _ _ _ = ([1,2,3], Map.empty, Map.empty)