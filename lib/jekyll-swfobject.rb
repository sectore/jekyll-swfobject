# SWFObject Tag
# is a Jekyll plugin to embed Flash files (*.swf) using SWFObject http://code.google.com/p/swfobject/
#
# Example:
#
#   {% swfobject swf_url %}{% endswfobject %}
# or
#   {% swfobject  swf_url id:swfID content_id:flashcontent width:500px height:600px  %}{% endswfobject %}
# or
#   {% swfobject swf_url %}
#   <p>Alternative HTML content, e.g. Latest <a href='http://www.adobe.com/go/getflashplayer'>Flash Player Plugin</a> is required.</p>
#   {% endswfobject %}
#
# Full documentation:
# https://github.com/sectore/jekyll-swfobject/blob/master/README.md
#
# Author: Jens Krause http://websector.de
# Source: https://github.com/sectore/jekyll-swfobject
# License: MIT

module Jekyll
  module SWFObject
    class SWFObjectTag < Liquid::Block

      #
      # constants
      #
      @@ATTRIBUTES = %w(
        id align name styleclass
      )

      @@PARAMETERS = %w(
        play loop menu quality scale salign wmode bgcolor base
        swliveconnect devicefont allowscriptaccess seamlesstabbing allowfullscreen allownetworking
      )

      @@DEFAULTS = {
          :content_id => 'flashcontent',
          :width => '100%',
          :height => '100%',
          :version => '10.0',
          :flashvars => ''
      }

      def self.DEFAULTS
        return @@DEFAULTS
      end

      def initialize(tag_name, markup, tokens)
        super

        @config = {}
        # set defaults
        override_config(@@DEFAULTS)

        # override configuration with values defined within _config.yml
        if Jekyll.configuration({}).has_key?('swfobject')
          config = Jekyll.configuration({})['swfobject']
          override_config(config)
        end

        params = markup.split

        # first argument (required) is url of swf
        @swf_url = params.shift.strip

        if params.size > 0
          # override configuration with parameters defined within {% swfobject pathToSWF %}
          config = {} # reset local config
          params.each do |param|
            param = param.gsub /\s+/, '' # remove whitespaces
            key, value = param.split(':',2) # split first occurrence of ':' only
            config[key.to_sym] = value
          end
          override_config(config)
        end

      end

      def override_config(config)
        config.each{ |key,value| @config[key] = value }
      end

      def render(context)
        content = super

        # raise an error if the swfobject block has no content
        if content.strip.size <= 0
          raise ScriptError.new("swfobject tag can not be empty")
        end

        <<-HTML.gsub /^\s+/, '' # remove whitespaces from heredocs
        <div id="#{@config[:content_id]}-wrapper" style="width: #{@config[:width]}; height: #{@config[:height]}">
          <div id="#{@config[:content_id]}" style="width: 100%; height:100%">#{content}</div>
        </div>
        <script type="text/javascript">
          //  <![CDATA[
          #{render_flashvars()}
        #{render_params()}
        #{render_attributes()}
          swfobject.embedSWF(
            '#{@swf_url}',
            '#{@config[:content_id]}',
            '100%',
            '100%',
            '#{@config[:version]}',
            #{render_express_install_url()},
            flashvars,
            params,
            attributes,
            #{render_callback_function()}
          );
          // ]]>
        </script>
        HTML
      end

      def render_params
        result = 'var params = {'
        @config.each do |key, value|
          if @@PARAMETERS.include?(key.to_s)
            result += "#{key}:'#{value}',"
          end
        end
        result = remove_last_comma(result)
        result += '};'
      end

      def render_attributes
        result = 'var attributes = {'
        @config.each do |key, value|
          if @@ATTRIBUTES.include?(key.to_s)
            result += "#{key}:'#{value}',"
          end
        end
        result = remove_last_comma(result)
        result += '};'
      end

      def render_flashvars
        result = 'var flashvars = {'

        if !@config[:flashvars].nil?
          vars = @config[:flashvars].split('&')
          vars.each do |var|
            key_value = var.split('=',2) # split first occurrence of '=' only
            key = key_value.first
            value = key_value.last
            result += "#{key}:'#{value}',"
          end
          result = remove_last_comma(result)
        end
        result += '};'
      end

      def render_express_install_url
        @config[:express_install_url] ? "'#{@config[:express_install_url]}'" : 'null'
      end

      def render_callback_function
        @config[:callback_function] ? "#{@config[:callback_function]}" : 'null'
      end

      def remove_last_comma(content)
        content.gsub(/,?$/, '')
      end

    end
  end
end

Liquid::Template.register_tag('swfobject', Jekyll::SWFObject::SWFObjectTag)