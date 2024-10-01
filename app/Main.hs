module Main where

import Raylib.Core
  ( beginDrawing,
    clearBackground,
    closeWindow,
    endDrawing,
    initWindow,
    setTargetFPS,
    windowShouldClose,
    --beginBlendMode,
  )
import Raylib.Core.Text (drawText)
--import Raylib.Util (whileWindowOpen0, Closeable (close))
import Raylib.Util.Colors (lightGray, rayWhite)
import Control.Monad (unless)

drawStuff :: IO Bool
drawStuff = do
  beginDrawing
  clearBackground rayWhite
  drawText "Basic raylib window" 30 40 18 lightGray
  endDrawing
  windowShouldClose

gameLoop ::  IO()
gameLoop = do
  shouldShutDown <- drawStuff
  unless shouldShutDown $ gameLoop
  -- above is equivalent to:
  --if x then
  --  return ()
  --else
  --  gameLoop
  
testMyBool :: Bool -> String
testMyBool True = "What truth?"
testMyBool False = "That you are a Boolean, Neo"

main :: IO ()
main = do
  y <- initWindow 600 450 "raylib [core] example - basic window"
  setTargetFPS 60
  testWindowClose <- windowShouldClose 
  putStr $ testMyBool testWindowClose
  gameLoop
  closeWindow $ Just y