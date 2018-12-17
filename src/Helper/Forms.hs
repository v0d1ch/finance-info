{-# LANGUAGE RankNTypes #-}

module Helper.Forms where

import           Data.Text (Text)
import           Text.Shakespeare.I18N
import           Universum
import           Yesod.Form

named :: Text -> FieldSettings master -> FieldSettings master
named t f =
    f
    { fsName = Just t
    , fsId = Just t
    }

labelled
  :: forall master.
     SomeMessage master -> FieldSettings master -> FieldSettings master
labelled t f = f {fsLabel = t}

placeholder :: Text -> FieldSettings master -> FieldSettings master
placeholder t f = f { fsAttrs = ("placeholder", t) : fsAttrs f }

placeheld :: Text -> FieldSettings master
placeheld label = placeholder label ""
