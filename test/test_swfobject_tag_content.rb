require 'test/unit'
require 'shoulda'
require_relative './test_helper'

class TestSWFObjectTagContent < Test::Unit::TestCase

  include MockData
  include Liquid

  def setup
    @test_data = getDefaultData().clone
  end

  # tests of attributes defined in template
  # ---------------------------------------------

  context 'content of template' do
    should 'raises an error if its content is empty' do
      template = "{% swfobject #{@test_data[:swf_url]} %}{% endswfobject %}"
      assert_raises(ScriptError) do
        p = Template.parse(template).render()
      end

    end

  end

end