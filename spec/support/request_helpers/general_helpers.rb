module RequestHelpers
  module GeneralHelpers
    def edit_tandem_text_content(identifier, new_text, options = {})
      wysiwyg = (options[:wysiwyg] or false)

      page.execute_script("$('#tandem_toolbar_#{identifier}').show()") #simulate hover
      click_link "tandem_edit_link_#{identifier}"

      sleep 1 #wait for iframe to load
      iframe_name = page.evaluate_script("$('iframe.cboxIframe').attr('name');")
      iframe_name.should_not be_nil

      within_frame iframe_name do
        if wysiwyg
          page.should have_selector('.wym_box')
          page.execute_script("jQuery.wymeditors(0).html('<p>#{new_text}</p>');")
        else
          fill_in 'content_text_content', with: new_text
        end

        click_button 'Save Your Changes'
      end
    end
  end
end
