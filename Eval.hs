module Eval where

import Grammar

eval :: [Exp] -> Map -> Map -> [[Int]] -> [[Int]]
