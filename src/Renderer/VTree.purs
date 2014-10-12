module Text.Smolder.Renderer.VTree
  ( render
  , render'
  , VNode(..)
  ) where

import Data.Function
import qualified Data.Map as Map
import Data.Maybe
import Data.Tuple
import Text.Smolder.Markup
import Text.Smolder.Renderer.Util (Node(..), renderMarkup)

import Text.Smolder.HTML
import Debug.Trace

foreign import data VNode :: *
foreign import data VAttrs :: *

foreign import showVNodeP "var showVNodeP = JSON.stringify;" :: VNode -> String

instance showVNode :: Show VNode where
  show = showVNodeP

foreign import vnodeP """
  var vn = require('vtree/vnode');
  function vnodeP(a,b,c) {
    return new vn(a,b,c);
  }
""" :: Fn3 String VAttrs [VNode] VNode
vnode :: String -> VAttrs -> [VNode] -> VNode
vnode = runFn3 vnodeP

foreign import vtext """
  var vt = require('vtree/vtext');
  function vtext(a) {
    return new vt(a);
  }
""" :: String -> VNode

foreign import convertAttrsP """
  function convertAttrsP(toList, attrs) {
    var out = {};
    toList(attrs).forEach(function(t) {
      out[t.value0] = t.value1;
    });
    return out;
  }
""" :: Fn2 (forall k v. Map.Map k v -> [Tuple k v])
       (Map.Map String String) VAttrs

convertAttrs :: Map.Map String String -> VAttrs
convertAttrs = (runFn2 convertAttrsP) Map.toList

render' :: Markup -> [VNode]
render' m = renderNode <$> renderMarkup m
  where renderNode (Element n a c) = vnode n (convertAttrs a) (renderNode <$> c)
        renderNode (Text t) = vtext t

-- The Markup type can express any number of sibling nodes.
-- Usually, you only care about the first one. This function
-- will throw a runtime error if you pass it a Markup value
-- expressing anything but a single node, returning the
-- single rendered node otherwise.
render :: Markup -> VNode
render m = case render' m of (x:[]) -> x
