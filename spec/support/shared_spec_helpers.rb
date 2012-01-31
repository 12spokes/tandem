module Tandem
  module SharedSpecHelpers
    def stub_all_view_helpers
      view.stub(:image_content_url) {''}
      view.stub(:image_content_tag) {''}
      view.stub(:tandem_image_tag) {''}
      Tandem::Content.subclasses.each do |klass|
        view.stub("tandem_#{klass.simple_type}_tag".to_sym) {''}
      end
      view.stub(:tandem_content_tag) {''}
      view.stub(:tandem_navigation_tag) {''}
      view.stub(:valid_layouts) {''}
    end
  end

  module SharedSpecExamples
    shared_examples_for 'tandem/pages/view' do |link_labels|
      link_labels ||= []
      {
          link_labels[0] || "Edit Page" => :update,
          link_labels[1] || "Destroy Page" => :destroy,
          link_labels[2] || "Page Listing" => :index,
          link_labels[3] || "New Page" => :create
       }.each do |link, action_val|

        it "renders '#{link}' link only with authorization" do
          controller.stub(:can?) { |action, target| !(action == action_val && (target == Page || target.kind_of?(Page))) }
          render
          assert_select "a", :text => link.to_s, :count => 0
        end
      end
    end
  end
end
