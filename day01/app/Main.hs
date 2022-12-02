{-# LANGUAGE OverloadedStrings #-}

module Main (main) where
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Data.Text.Read (decimal)

filePath :: FilePath
filePath = "/home/klequis/d/aventOfCode2022/day01/app/input.txt"

splitOn2NewLine :: T.Text -> [T.Text]
splitOn2NewLine = T.splitOn "\n\n"

toTextLines :: T.Text -> [T.Text]
toTextLines = T.lines

textToInt :: Integral a => [T.Text] -> [Either String (a, T.Text)]
textToInt = map decimal

sumElf :: [Either String (Int, T.Text)] -> Int
sumElf (Right (n,_):xs) = n + sumElf xs
sumElf _ = 0

maxElf :: T.Text -> Int
maxElf input = maximum $ map ( sumElf . textToInt . toTextLines) (splitOn2NewLine input)

main :: IO ()
main = do
  input <- TIO.readFile filePath
  print (maxElf input)
