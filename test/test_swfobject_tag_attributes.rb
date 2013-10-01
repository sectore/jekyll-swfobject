require 'shoulda'
require_relative './test_helper'

class TestSWFObjectTagAttributes < Test::Unit::TestCase

  include MockData
  include Liquid

  def setup
    @test_data = getDefaultData().clone
  end

  # tests of attributes defined in template
  # ---------------------------------------------

  context 'template with attributes' do
    should 'uses default values' do
      expected = expected_output_by_test_data()
      template = "{% swfobject #{@test_data[:swf_url]} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom swf url' do
      swf_url = 'another/path/to.swf'
      expected = expected_output_by_test_data({:swf_url => swf_url})
      template = "{% swfobject #{swf_url} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom content_id' do
      content_id = 'halli-galli-id'
      expected = expected_output_by_test_data({:content_id => content_id})
      template = "{% swfobject #{@test_data[:swf_url]} content_id:#{content_id} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom width' do
      width = '23px'
      expected = expected_output_by_test_data({:width => width})
      template = "{% swfobject #{@test_data[:swf_url]} width:#{width} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom height' do
      height = '44px'
      expected = expected_output_by_test_data({:height => height})
      template = "{% swfobject #{@test_data[:swf_url]} height:#{height} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render an alternative content' do
      alternative_content = '<p>any other alternative content</p>'
      expected = expected_output_by_test_data({:alternative_content => alternative_content})
      template = "{% swfobject #{@test_data[:swf_url]} %}#{alternative_content}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom flash version' do
      version = '11.4'
      expected = expected_output_by_test_data({:version => version})
      template = "{% swfobject #{@test_data[:swf_url]} version:#{version}%}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom flashvar' do
      varA = 'varA'
      valueA = 'valueA'
      flashVars = "var flashvars = {#{varA}:'#{valueA}'};"
      expected = expected_output_by_test_data({:flashvars => flashVars})
      template = "{% swfobject #{@test_data[:swf_url]} flashvars:#{varA}=#{valueA}%}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render few custom flashvars' do
      varA = 'varA'
      valueA = 'valueA'
      varB = 'varB'
      valueB = 'valueB'
      flashVars = "var flashvars = {#{varA}:'#{valueA}',#{varB}:'#{valueB}'};"
      expected = expected_output_by_test_data({:flashvars => flashVars})
      template = "{% swfobject #{@test_data[:swf_url]} flashvars:#{varA}=#{valueA}&#{varB}=#{valueB}%}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute id' do
      attribute = 'id'
      value = 'any-id'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      expected = expected_output_by_test_data({:attributes => attributes})
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute align' do
      attribute = 'align'
      value = 'l'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      expected = expected_output_by_test_data({:attributes => attributes})
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute name' do
      attribute = 'name'
      value = 'any-name'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      expected = expected_output_by_test_data({:attributes => attributes})
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute styleclass' do
      attribute = 'styleclass'
      value = 'any-class'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      expected = expected_output_by_test_data({:attributes => attributes})
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render few custom attributes' do
      attribute_id = 'id'
      value_id = 'any-id'
      attribute_align = 'align'
      value_align = 'center'
      attributes = "var attributes = {#{attribute_id}:'#{value_id}',#{attribute_align}:'#{value_align}'};"
      expected = expected_output_by_test_data({:attributes => attributes})
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute_id}:#{value_id} #{attribute_align}:#{value_align} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param play' do
      param = 'play'
      value = 'true'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param loop' do
      param = 'loop'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param menu' do
      param = 'menu'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param quality' do
      param = 'quality'
      value = 'best'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param scale' do
      param = 'scale'
      value = 'exactfit'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param salign' do
      param = 'salign'
      value = 'tr'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param wmode' do
      param = 'wmode'
      value = 'window'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param bgcolor' do
      param = 'bgcolor'
      value = '#FFF'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param base' do
      param = 'base'
      value = 'http://any-base-url.com'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param swliveconnect' do
      param = 'swliveconnect'
      value = 'true'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param devicefont' do
      param = 'devicefont'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param allowscriptaccess' do
      param = 'allowscriptaccess'
      value = 'sameDomain'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param seamlesstabbing' do
      param = 'seamlesstabbing'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param allowfullscreen' do
      param = 'allowfullscreen'
      value = 'true'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param allownetworking' do
      param = 'allownetworking'
      value = 'none'
      rendered_params = "var params = {#{param}:'#{value}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render few custom params' do
      attributeA = 'allowfullscreen'
      valueA = 'true'
      attributeB = 'allownetworking'
      valueB = 'false'
      rendered_params = "var params = {#{attributeA}:'#{valueA}',#{attributeB}:'#{valueB}'};"
      expected = expected_output_by_test_data({:params => rendered_params})
      template = "{% swfobject #{@test_data[:swf_url]} #{attributeA}:#{valueA} #{attributeB}:#{valueB} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

  end

  # tests of attributes defined _config.yml
  # ---------------------------------------------

  context 'template with attributes defined in Jekylls configuration (_config.yml)' do
    should 'uses default values' do
      expected = expected_output_by_test_data()
      template = "{% swfobject #{@test_data[:swf_url]} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom swf url' do
      swf_url = 'another/path/to.swf'
      @custom_config = {
        :swf_url => swf_url
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{swf_url} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom content_id' do
      content_id = 'halli-galli-id'
      @custom_config = {
        :content_id => content_id
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} content_id:#{content_id} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom width' do
      width = '23px'
      @custom_config = {
        :width => width
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} width:#{width} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom height' do
      height = '44px'
      @custom_config = {
        :height => height
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} height:#{height} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render an alternative content' do
      alternative_content = '<p>An alternative content defined in _config.yml</p>'
      @custom_config = {
        :alternative_content => alternative_content
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom flash version' do
      version = '11.1'
      @custom_config = {
        :version => version
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} version:#{version}%}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render a custom flashvar' do
      varA = 'varA'
      valueA = 'valueA'
      flashvars = "var flashvars = {#{varA}:'#{valueA}'};"
      @custom_config = {
        :flashvars => flashvars
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} flashvars:#{varA}=#{valueA}%}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render few custom flashvars' do
      varA = 'varA'
      valueA = 'valueA'
      varB = 'varB'
      valueB = 'valueB'
      flashvars = "var flashvars = {#{varA}:'#{valueA}',#{varB}:'#{valueB}'};"
      @custom_config = {
        :flashvars => flashvars
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} flashvars:#{varA}=#{valueA}&#{varB}=#{valueB}%}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute id' do
      attribute = 'id'
      value = 'any-id'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      @custom_config = {
        :attributes => attributes
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute align' do
      attribute = 'align'
      value = 'l'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      @custom_config = {
        :attributes => attributes
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute name' do
      attribute = 'name'
      value = 'any-name'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      @custom_config = {
        :attributes => attributes
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render attribute styleclass' do
      attribute = 'styleclass'
      value = 'any-class'
      attributes = "var attributes = {#{attribute}:'#{value}'};"
      @custom_config = {
        :attributes => attributes
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render few custom attributes' do
      attribute_id = 'id'
      value_id = 'any-id'
      attribute_align = 'align'
      value_align = 'center'
      attributes = "var attributes = {#{attribute_id}:'#{value_id}',#{attribute_align}:'#{value_align}'};"
      @custom_config = {
        :attributes => attributes
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute_id}:#{value_id} #{attribute_align}:#{value_align} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param play' do
      param = 'play'
      value = 'true'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param loop' do
      param = 'loop'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param menu' do
      param = 'menu'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param quality' do
      param = 'quality'
      value = 'best'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
          :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param scale' do
      param = 'scale'
      value = 'exactfit'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param salign' do
      param = 'salign'
      value = 'tr'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param wmode' do
      param = 'wmode'
      value = 'window'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param bgcolor' do
      param = 'bgcolor'
      value = '#FFF'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param base' do
      param = 'base'
      value = 'http://any-base-url.com'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param swliveconnect' do
      param = 'swliveconnect'
      value = 'true'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
        :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'render param devicefont' do
      param = 'devicefont'
      value = 'false'
      rendered_params = "var params = {#{param}:'#{value}'};"
      @custom_config = {
          :params => rendered_params
      }
      Jekyll.stubs(:configuration).returns({'swfobject' => @custom_config})
      expected = expected_output_by_test_data(@custom_config)
      template = "{% swfobject #{@test_data[:swf_url]} #{param}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      assert_template_result expected, template
    end

    should 'NOT render a value, which are not supported' do
      attribute = 'halligalli'
      value = 'true'
      template = "{% swfobject #{@test_data[:swf_url]} #{attribute}:#{value} %}#{@test_data[:alternative_content]}{% endswfobject %}"
      rendered = Template.parse(template).render({})
      assert(!rendered.include?(attribute))
    end

  end

end