{-# LANGUAGE OverloadedStrings #-}

{-
  Find the item type that appears in both compartments of each rucksack.
  What is the sum of the priorities of those item types?
-}

module Main (main) where
import Data.List (intersect, elemIndex)

safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (a:_) = Just a

filePath :: FilePath
filePath = "/home/klequis/d/adventOfCode2022/day03/app/input.txt"

add1ToMaybeInt :: Num a => Maybe a -> Maybe a
add1ToMaybeInt Nothing = Nothing
add1ToMaybeInt (Just x) = Just (x + 1)

getPriority :: Maybe Char -> Maybe Int
getPriority Nothing = Nothing
getPriority (Just x) = add1ToMaybeInt idx
  where idx = elemIndex x "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

getCommonItem :: String -> Maybe Char
getCommonItem str = safeHead (c1 `intersect` c2)
  where (c1,c2) = splitAt (length str `div` 2) str

commonItems :: [String] -> [Maybe Int]
commonItems rusksacks = aa
  where aa = map (getPriority . getCommonItem) rusksacks

sumMaybe :: Num a => [Maybe a] -> Maybe a
sumMaybe = fmap sum . sequence

groupInput :: [String] -> [[String]]
groupInput (a:b:c:xs) = [a,b,c] : groupInput xs
groupInput _ = []

intersection :: (Foldable t, Eq a) => t [a] -> Maybe a
intersection xs = safeHead uniqueLtr
  where uniqueLtr = foldr1 intersect xs

sumOfBadges :: [String] -> Maybe Int
sumOfBadges xs = sumMaybe $ map (getPriority . intersection) (groupInput xs)

main :: IO ()
main = do
  input <- readFile filePath
  let inputLines = lines input
  let aa = commonItems inputLines
  print ("original sum" ++ show (sumMaybe aa))
  if length inputLines `mod` 3 /= 0 then print "invalid file"
                           else print ("sum of badges: " ++ show (sumOfBadges inputLines))
  print "done"

