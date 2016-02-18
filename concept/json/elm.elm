module Client where

import Html exposing (text)
import Json.Decode exposing (Decoder, decodeString
                            , string, int, float
                            , object2, (:=)
                            )

jsonString = "{ \"x\": 2, \"y\":4 }"

type alias Point = { x : Int , y : Int }


x : Decoder Int
x = 
  "x" := int

y : Decoder Int
y = 
  "y" := int

coordinate : Decoder (Int, Int)
coordinate = 
  object2 (,) x y

elmJson : Result String (Int, Int)
elmJson = decodeString coordinate jsonString

parsedJson : (Int, Int)
parsedJson = Result.withDefault (0,0) elmJson

stringJson : String
stringJson = toString parsedJson

--

elmJsonSingle : Result String Int
elmJsonSingle = decodeString x jsonString

parsedJsonSingle : Int
parsedJsonSingle = Result.withDefault 0 elmJsonSingle

stringJsonSingle : String
stringJsonSingle = toString parsedJsonSingle

--

point : Decoder Point
point = 
  object2 Point x y

elmJsonPoint : Result String Point
elmJsonPoint = decodeString point jsonString

parsedJsonPoint : Point
parsedJsonPoint = Result.withDefault { x = 0, y = 0 } elmJsonPoint

stringJsonPoint : String
stringJsonPoint = toString parsedJsonPoint

main = text stringJsonPoint
