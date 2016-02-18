module Client where

import Html exposing (text)

port value : Signal Int


main = 
  value
  |> Signal.map toString
  |> Signal.map text
