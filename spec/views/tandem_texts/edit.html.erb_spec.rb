require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tandem_texts/edit.html.erb" do
  include TandemTextsHelper

  before(:each) do
    assigns[:tandem_text] = @tandem_text = stub_model(TandemText,
      :new_record? => false,
      :content => "value for content"
    )
  end

  it "renders the edit tandem_text form" do
    render

    response.should have_tag("form[action=#{tandem_text_path(@tandem_text)}][method=post]") do
      with_tag('textarea#tandem_text_content[name=?]', "tandem_text[content]")
    end
  end
end
