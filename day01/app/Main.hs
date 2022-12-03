{-# LANGUAGE OverloadedStrings #-}

module Main (main) where
import qualified Data.Text.IO as TIO
import Elfs (sumPerElf)
import Data.List (sortOn)

filePath :: FilePath
filePath = "/home/klequis/d/adventOfCode2022/day01/app/input.txt"

sortDesc :: [Int] -> [Int]
sortDesc = sortOn negate

main :: IO ()
main = do
  input <- TIO.readFile filePath
  let sumEachElf = sumPerElf input
  print ("Elf with most: " ++ show (maximum sumEachElf))
  print ("Top 3 Elves have: " ++ show (sum $ take 3 (sortDesc sumEachElf)))