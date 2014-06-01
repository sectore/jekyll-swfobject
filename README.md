# Jekyll Plugin: SWFObject Tag

SWFObject Tag is a [Liquid](http://www.liquidmarkup.org/) plugin for [Jekyll](http://jekyllrb.com/) to embed Flash files (*.swf) using [SWFObject](http://code.google.com/p/swfobject/)

## Installation

1) Add this line to your application's Gemfile:

    gem 'jekyll-swfobject'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jekyll-swfobject

2) Add in a plugin file within your Jekyll project's _plugins directory:

    # _plugins/my-plugin.rb
    require 'jekyll-swfobject'

3) Link SWFObject in your layout template or page within `<head>` or before `{% swfobject %}` :

    `<script src="//ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>`


## Usage

### Tag
    {% swfobject swf_url %}Flash Player required.{% endswfobject %}
Note: Because SWFObject Tag is a `Liquid::Block`, you have to close any `{% swfobject %}` with `{% endswfobject %}` in your templates.
Also an alternative content within the tags is needed.

#### Alternative HTML content (required)

    {% swfobject swf_url %}
    <p>Latest <a href='http://www.adobe.com/go/getflashplayer'>Flash Player Plugin</a> is required.</p>
    {% endswfobject %}


#### Optional parameters

All optional parameters are defined using `key:value` pairs.

    {% swfobject swf_url id:myFlash content_id:flashcontent width:500 height:600  %}{% endswfobject %}

Note: Don't use whitespaces between `:` to avoid issues rendering templates.

For all optional parameters check section [Parameters](#parameters) below.



#### Optional parameters defined in `_config.yml`

    swfobject:
      height: 350
      width: 200
      express_install_url: expressInstall.swf

You can define any optional paramter in `_config.yml`. For an overiew of all optional parameters check section [Parameters](#parameters) below.


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

## Test

The plugin is well tested using [Test::Unit](http://www.ruby-doc.org/core/classes/Test/Unit.html) with [Shoulda](https://github.com/thoughtbot/shoulda) and [Mocha](http://gofreerange.com/mocha/). To start tests just run

    rake test



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 "sectore" Jens Krause // [WEBSECTOR.DE](http://websector.de)

SWFObject Tag is free software and it may be redistributed under the terms specified in the MIT-LICENSE file.