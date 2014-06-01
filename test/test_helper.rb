require 'minitest/test'
require 'minitest/assertions'
require 'jekyll'
require 'liquid.rb'
require_relative '../lib/jekyll-swfobject'

# Test assertion helper to check template result
# Based on Shopify's test helper
# @see: https://github.com/Shopify/liquid/blob/master/test/test_helper.rb
module MiniTest
  module Assertions
    def assert_template_result(expected, template, assigns = {}, message = nil)
      result = Liquid::Template.parse(template).render(assigns)
      assert_equal expected, result
    end
  end
end

# Simple helper to provide mock data
module MockData
  # default test data
  def getDefaultData
    data = {
        :content_id => Jekyll::SWFObject::SWFObjectTag.DEFAULTS[:content_id],
        :width => Jekyll::SWFObject::SWFObjectTag.DEFAULTS[:width],
        :height => Jekyll::SWFObject::SWFObjectTag.DEFAULTS[:height],
        :alternative_content => "Flash Player required.",
        :flashvars => 'var flashvars = {};',
        :params => 'var params = {};',
        :attributes => 'var attributes = {};',
        :swf_url => 'url/of/any.swf',
        :version => Jekyll::SWFObject::SWFObjectTag.DEFAULTS[:version],
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

