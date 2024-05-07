{-# LANGUAGE LambdaCase #-}
module Main (main) where

import Control.Monad ( forever )
import System.Environment ( getArgs )
import qualified Data.ByteString.Char8 as BS

import Evdev

-- Creates a new device from the RawFilePath "/dev/input/event21", which on my system is an Xbox controller, prints information about the device and then prints any events created by it forever

main :: IO ()
main = do
  dev <- newDevice (BS.pack "/dev/input/event21")

  devName <- deviceName dev
  devProps <- deviceProperties dev
  devEventTypes <- deviceEventTypes dev
  devFd <- deviceFd dev
  devPhys <- devicePhys dev
  devUniq <- deviceUniq dev
  devProduct <- deviceProduct dev
  devVendor <- deviceVendor dev
  devBustype <- deviceBustype dev
  devVersion <- deviceVersion dev

  print devName
  print devProps
  print devEventTypes
  print devFd
  print devPhys
  print devUniq
  print devProduct
  print devVendor
  print devBustype
  print devVersion

  forever $ do
    devNextEvent <- nextEventMay dev
    print devNextEvent