module MutedVideo exposing (main)

import Browser
import Html
import Html.Attributes as Html
import Html.Parser
import Html.Parser.Util

main =
  Browser.sandbox {init = {}, update = \m -> m, view = view}

view {} =
  "<video style=\"max-width: 100%\" src=\"../assets/sample-30s.mp4\" muted controls autoplay></video>"
  |> Html.Parser.run
  |> Result.map Html.Parser.Util.toVirtualDom
  |> Result.withDefault [ Html.text "Html could not be parsed" ]
  |> Html.main_ [ Html.style "max-width" "100vw" ]
