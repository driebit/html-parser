# html-parser [![Build Status](https://travis-ci.org/hecrj/html-parser.svg?branch=master)](https://travis-ci.org/hecrj/html-parser)

Parse HTML 5 in Elm 0.19!

```elm
import Html.Parser

Html.Parser.run "<div><p>Hello, world!</p></div>"
-- => Ok [ Element "div" [] [ Element "p" [] [ Text "Hello, world!" ] ] ]
```
_This fork of https://github.com/hecrj/html-parser renders the media `muted` attribute as a property, instead of
as an attribute, because it seems that in some situations it doesn't get picked up otherwise._

## Limitations
  * `<script>` tags are not fully supported.
  * SVG is not supported.

Feel free to contribute!


## Contributing / Feedback

Feel free to fork and open issues or pull requests. You can also contact me (@hecrj)
on the [Elm Slack][elm-slack]. I am always happy to talk!


## Credits
  * [`jinjor/elm-html-parser`][jinjor] for most of the tests.

[elm-slack]: https://elmlang.herokuapp.com
[jinjor]: https://github.com/jinjor/elm-html-parser
