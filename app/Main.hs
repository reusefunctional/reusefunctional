{-# LANGUAGE OverloadedStrings #-}

module Main(main) where
import Language.Parsing
import Language.FunParser
import Language.Types
import Language.Environment
import Data.Maybe
import Data.List
import Interpreter
import DepGraph
import Elements
import Search
import Language.Infer
import Language.Types
import Language.Syntax
import qualified Data.Set as Set
import qualified Data.Map as Map

import Control.Exception
import Formatting
import Formatting.Clock
import System.Clock


time :: IO t -> IO t
time a = do
    start <- getTime Monotonic
    v <- a
    end   <- getTime Monotonic
    fprint (timeSpecs % "\n") start end
    return v

main = do
    putStrLn "Starting...\n"
    time $ dialog funParser obey (init_env, init_tenv, empty_env)
    