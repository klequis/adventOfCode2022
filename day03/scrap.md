[String] -> [(String,String,String)]

```haskell

groupInput :: [String] -> [(String,String,String)]
groupInput a:b:c:xs = (a,b,c) : groupInput xs


input.txt
```
DMwrszrfMzSSCpLpfCCn
RMvhZhQqlvhMvRtbvbcPclPlncddppLTdppd
tVMQhFtjjWmsFJsmsW
trRtvNhfJhSzzSTFVhQQZQhHGphP
CnLMBWLwDMgMcwwdngdHGPVTQGpTHZdGPGpd
```

I'm reading in a file like the one above. A valid file has a number of lines that is a multiple of 3. Therefore the above file is invalid.

I though the easiest test for a valid file would be

```haskell
main :: IO ()
main = do
  input <- readFile input.txt
  let inputLines = lines input
  let numLines = length inputLines
  if numLines `mod` 3 /= 0 then "invalid file"
                           else "process the data"
```


