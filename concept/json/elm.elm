module Client where

import Html exposing (text)
import Json.Decode exposing (Decoder, decodeString
                            , string, int, float
                            , tuple2, (:=)
                            )
import Result

jsonString = "{ \"x\": 2, \"x\":4 }"

x : Decoder Int
x = 
  "x" := int

y : Decoder Int
y = 
  "y" := int

coordinate : Decoder (Int, Int)
coordinate = 
  tuple2 (,) x y

elmJson : Result String (Int, Int)
elmJson = decodeString coordinate jsonString

parsedJson : (Int, Int)
parsedJson = Result.withDefault (0,0) elmJson 

stringJson : String
stringJson = toString parsedJson

main = text stringJson
