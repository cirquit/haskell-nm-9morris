{-
Main file of the Haskell-NM-9Morris Project
-}
import NineMorris.Client
import NineMorris.Globals as Globals
import Paths_haskell_nm_9morris (version)
import Data.Version (showVersion)
import System.Environment -- <= für Command Line Arguments

printHelp :: IO()
printHelp = putStrLn "Usage: <gameid> (<path to config File>)"

main :: IO()
main = do
    putStrLn $ "Starting Client Version " ++ showVersion version
    params <- getArgs
    case params of
        (gameid:path:xs) -> return $ startClient gameid path
        (gameid:xs) -> return $ startClient gameid Globals.defaultConfig
        _ -> do return $ printHelp
    putStrLn "Stop Client"