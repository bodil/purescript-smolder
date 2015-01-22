module Text.Smolder.Renderer.String
  ( render
  , renderNode
  , PPOptions(..)
  , prettyPrint
  ) where

import qualified Data.Map as Map
import qualified Text.Smolder.Markup as Markup

import Data.Array ((..))
import Data.Maybe
import Data.String
import Text.Smolder.Renderer.Util

-- TODO: attr values and text content must be properly escaped.
renderNode :: String -> Number -> String -> Node -> String
renderNode glue lvl is (Element n a c) = indent lvl is $ "<" ++ n ++ showAttrs a ++ showTail c
  where showTail [] = "/>"
        showTail c = ">" ++ glue ++ joinWith glue (renderNode glue (lvl+1) is <$> c) ++ glue ++ closeTag
        closeTag = indent lvl is $ "</" ++ n ++ ">"
        showAttrs a = joinWith "" $ pair <$> (Map.keys a)
          where pair k = " " ++ k ++ case Map.lookup k a of
                  Just v -> "=\"" ++ v ++ "\""
                  Nothing -> ""
renderNode _ lvl is (Text s) = indent lvl is s

render :: forall a. Markup.MarkupM a -> String
render = prettyPrint' "" noPP

instance showNode :: Show Node where
  show = renderNode "" 0 ""

instance showMarkup :: Show (Markup.MarkupM Unit) where
  show = render

newtype PPOptions = PPOptions {
      indentStr :: String
    }

indentStr (PPOptions o) = o.indentStr

noPP :: PPOptions
noPP = PPOptions { indentStr: "" }

prettyPrint :: forall a. PPOptions -> Markup.MarkupM a -> String
prettyPrint = prettyPrint' "\n"

prettyPrint' :: forall a. String -> PPOptions -> Markup.MarkupM a -> String
prettyPrint' glue opts m =
  joinWith glue $ renderNode glue 0 (indentStr opts) <$> renderMarkup m


indent :: Number -> String -> String -> String
indent 0 _ s = s
indent n glue s = prefix ++ s
  where
    prefix = joinWith "" (const glue <$> (1..n))
