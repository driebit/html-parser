module Html.Parser.Util exposing (toVirtualDom)

{-| Utility functions that may help you digging into the contents.


# Virtual DOM

@docs toVirtualDom

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Parser exposing (Node(..))
import Set
import VirtualDom
import Json.Encode


{-| Converts nodes to virtual dom nodes.
-}
toVirtualDom : List Node -> List (Html msg)
toVirtualDom nodes =
    List.map toVirtualDomEach nodes


toVirtualDomEach : Node -> Html msg
toVirtualDomEach node =
    case node of
        Element name attrs children ->
            Html.node name (List.map toAttribute attrs) (toVirtualDom children)

        Text s ->
            text s

        Comment _ ->
            text ""


properties =
    Set.fromList [ "muted" ]


toAttribute : ( String, String ) -> Attribute msg
toAttribute ( name, value ) =
    if Set.member name properties then
        property name (Json.Encode.string value)

    else
        attribute name value
