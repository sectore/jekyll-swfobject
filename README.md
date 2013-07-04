# Jekyll Plugin: SWFObject Tag

SWFObject Tag is a [Liquid](http://www.liquidmarkup.org/) plugin for [Jekyll](http://jekyllrb.com/) to embed Flash files (*.swf) using [SWFObject](http://code.google.com/p/swfobject/)

## Installation

1. Copy `_plugins/swfobject_tag.rb` into `<your-jekyll-project>/_plugins` folder.

2. Link SWFObject in your layout template or page within `<head>` or before `{% swfobject %}` :

    `<script src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>`


## Example

### Tag
    {% swfobject swf_url %}{% endswfobject %}
Note: Because SWFObject Tag is a `Liquid::Block`, you have to close any `{% swfobject %}` with `{% endswfobject %}` in your templates.

#### Optional parameters

All optional parameters are defined using `key:value` pairs.

    {% swfobject swf_url id:myFlash content_id:flashcontent width:500 height:600  %}{% endswfobject %}

Note: Don't use whitespaces between `:` to avoid issues rendering templates.

For all optional parameters check section [Parameters](#parameters) below.


#### Alternative HTML content

    {% swfobject swf_url %}
    <p>Latest <a href='http://www.adobe.com/go/getflashplayer'>Flash Player Plugin</a> is required.</p>
    {% endswfobject %}

#### Optional parameters defined in `_config.yml`


    swfobject:
      height: 350
      width: 200
      express_install_url: expressInstall.swf
      alternative_content: <p>Please install latest <a href='http://www.adobe.com/go/getflashplayer'>Flash Player Plugin</a>.</p>

For all optional parameters check section [Parameters](#parameters) below.


## Parameters

### Required parameter

`swf_url` - Path to SWF, which has to be embedded

### Optional parameters

All optional parameters can be defined within `{% swfobject %}` and / or using `_config.yml`.
Parameters defined in `_config.yml` will be overridden by tag parameters.

`content_id` - Id of the div container, which will be replaced by SWFObject to embed SWF

`height` - Height (`px`, `%`, `em` or `rem`) of the embedded SWF and of the surrounded `<div>` (default: 100%)

`width` - Width (`px`, `%`, `em` or `rem`) of the embedded SWF and of the surrounded `<div>`  (default: 100%).

Note: For a better support of fluid and responsive layouts using `em`, `rem` etc. the plugin creates an extra `div`,
which wrappes the generated `<object>` tag. This wrapper `div` will be sized using values of `height` and `width`.
The wrapper can be addressed by using the `content_id` + `-wrapper`, e.g. `flashcontent-wrapper`.

`version` - Version of the Flash Player Plugin (default: 10.0)

`flashvars` - String of flashvars using `key=value` pairs combinend with `&`, e.g. `name1=hello&name2=world`

`express_install_url` - URL of the expressInstall.swf

`callback_function` - Callback function to check success or failure of creating a Flash plug-in `<object>`


#### Optional Attributes of the `<object>` element

`id`

`align`

`name`

`styleclass`

For detailed information check SWF Object documentation: http://code.google.com/p/swfobject/wiki/documentation

#### Optional Flash specific parameters

`play`

`loop`

`menu`

`quality`

`scale`

`salign`

`wmode`

`bgcolor`

`base`

`swliveconnect`

`devicefont`

`allowscriptaccess`

`seamlesstabbing`

`allowfullscreen`

`allownetworking`

For detailed information check SWF Object documentation: http://code.google.com/p/swfobject/wiki/documentation

## Live example

SWFObject Tag is used by the Jekyll generated website [WEBSECTOR.DE](http://websector.de). You will find the [source](https://github.com/sectore/websector.de) of WEBSECTOR.DE [here](https://github.com/sectore/websector.de) at GitHub.


## License

Copyright (c) 2013 "sectore" Jens Krause // [WEBSECTOR.DE](http://websector.de)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.