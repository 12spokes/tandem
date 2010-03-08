require 'spec_helper'

describe "/tandem_texts/index.html.erb" do
  include TandemTextsHelper

  before(:each) do
    assigns[:tandem_texts] = [
      stub_model(TandemText,
        :content => "value for content"
      ),
      stub_model(TandemText,
        :content => "value for content"
      )
    ]
  end

  it "renders a list of tandem_texts" do
    render
    response.should have_tag("tr>td", "value for content".to_s, 2)
  end
end
