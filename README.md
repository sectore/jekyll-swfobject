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

    {% swfobject  swf_url, id:myFlash, content_id:flashcontent, width:500, height:600  %}{% endswfobject %}

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

`height` - Width of the embedded SWF (default: 100%)

`width` - Height of the embedded SWF (default: 100%)

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


## Author

Jens Krause // [http://websector.de](http://websector.de)

## License

Code is licensed under [MIT](http://opensource.org/licenses/MIT)