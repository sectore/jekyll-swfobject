require 'test/unit'
require 'test/unit/assertions'
require 'jekyll'
require_relative '../_plugins/swfobject_tag'

# Test assertion helper to check template result
# It is grabed from Shopify's test helper
# @see: https://github.com/Shopify/liquid/blob/master/test/test_helper.rb
module Test
  module Unit
    module Assertions
      include Liquid

      def assert_template_result(expected, template, assigns = {}, message = nil)
        assert_equal expected, Template.parse(template).render(assigns)
      end
    end
  end
end

# Simple helper to provide mock data
module MockData
  # default test data
  def getDefaultData
    data = {
      :content_id => Jekyll::SWFObjectTag.DEFAULTS[:content_id],
      :width => Jekyll::SWFObjectTag.DEFAULTS[:width],
      :height => Jekyll::SWFObjectTag.DEFAULTS[:height],
      :alternative_content => Jekyll::SWFObjectTag.DEFAULTS[:alternative_content],
      :flashvars => 'var flashvars = {};',
      :params => 'var params = {};',
      :attributes => 'var attributes = {};',
      :swf_url => 'url/of/any.swf',
      :version => Jekyll::SWFObjectTag.DEFAULTS[:version],
      :express_install_url => 'null',
      :callback_function => 'null'
    }
  end

  # Helper method to create expected output
  def expected_output_by_test_data(data_to_merge=nil)
    # use "raw" test data or merge data into it
    data = (data_to_merge.nil?) ? @test_data : @test_data.merge!(data_to_merge)

    output =
        <<-EOS.gsub /^\s+/, '' # remove whitespaces from heredocs
      <div id="#{data[:content_id]}-wrapper" style="width: #{data[:width]}; height: #{data[:height]}">
        <div id="#{data[:content_id]}" style="width: 100%; height:100%">#{data[:alternative_content]}</div>
      </div>
      <script type="text/javascript">
        //  <![CDATA[
        #{data[:flashvars]}
    #{data[:params]}
    #{data[:attributes]}
        swfobject.embedSWF(
          '#{data[:swf_url]}',
          '#{data[:content_id]}',
          '100%',
          '100%',
          '#{data[:version]}',
          #{data[:express_install_url]},
          flashvars,
          params,
          attributes,
          #{data[:callback_function]}
        );
        // ]]>
      </script>
    EOS
  end
end

