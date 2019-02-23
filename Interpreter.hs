import Token
import Grammar
import System.Environment
import Control.Exception
import System.IO


main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceFile <- readFile fileName
           let sourceLines = (lines sourceFile)
           interpretLines sourceLines

interpretLines :: [String] -> IO ()
interpretLines = mapM_ (putStrLn . (parseCalc (alexScanTokens sourceText)))

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()