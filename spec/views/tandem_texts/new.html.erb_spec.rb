require 'spec_helper'

describe "/tandem_texts/new.html.erb" do
  include TandemTextsHelper

  before(:each) do
    assigns[:tandem_text] = stub_model(TandemText,
      :new_record? => true,
      :content => "value for content"
    )
  end

  it "renders new tandem_text form" do
    render

    response.should have_tag("form[action=?][method=post]", tandem_texts_path) do
      with_tag("textarea#tandem_text_content[name=?]", "tandem_text[content]")
    end
  end
end
