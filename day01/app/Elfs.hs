{-# LANGUAGE OverloadedStrings #-}

module Elfs (sumPerElf) where
import qualified Data.Text as T
import Data.Text.Read (decimal)

splitOn2NewLine :: T.Text -> [T.Text]
splitOn2NewLine = T.splitOn "\n\n"

toTextLines :: T.Text -> [T.Text]
toTextLines = T.lines

textToInt :: Integral a => [T.Text] -> [Either String (a, T.Text)]
textToInt = map decimal

sumElf :: [Either String (Int, T.Text)] -> Int
sumElf (Right (n,_):xs) = n + sumElf xs
sumElf _ = 0

sumPerElf :: T.Text -> [Int]
sumPerElf input = map ( sumElf . textToInt . toTextLines) (splitOn2NewLine input)