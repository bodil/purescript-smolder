module Text.Smolder.Renderer.String
  ( render
  , renderNode
  ) where

import Prelude

import Data.List (List(..))
import Data.Foldable (fold, foldMap)

import Data.Map as Map
import Text.Smolder.Markup as Markup

import Text.Smolder.Renderer.Util (Node(..), renderMarkup)

-- | Render a node as a HTML string.
-- |
-- | TODO: attr values and text content must be properly escaped.
renderNode :: Node -> String
renderNode (Element n a c) = "<" ++ n ++ showAttrs a ++ showTail c
  where 
  showTail :: List Node -> String 
  showTail Nil = "/>"
  showTail c = ">" ++ fold (map renderNode c) ++ "</" ++ n ++ ">"
  
  showAttrs :: Map.Map String String -> String
  showAttrs a = fold $ map pair (Map.keys a)
    where
    pair :: String -> String
    pair k = " " ++ k ++ foldMap (\v -> "=\"" ++ v ++ "\"") (Map.lookup k a)
renderNode (Text s) = s

-- | Render markup as a HTML string.
render :: forall a. Markup.MarkupM a -> String
render = fold <<< map renderNode <<< renderMarkup
