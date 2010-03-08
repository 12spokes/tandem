require 'spec_helper'

describe "/tandem_texts/show.html.erb" do
  include TandemTextsHelper
  before(:each) do
    assigns[:tandem_text] = @tandem_text = stub_model(TandemText,
      :content => "value for content"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
  end
end
