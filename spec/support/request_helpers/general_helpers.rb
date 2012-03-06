module RequestHelpers
  module GeneralHelpers
    def edit_tandem_text_content(identifier, new_text)
      page.execute_script("$('#tandem_toolbar_#{identifier}').show()") #simulate hover
      click_link "tandem_edit_link_#{identifier}"

      sleep 1 #wait for iframe to load
      iframe_name = page.evaluate_script("$('iframe.cboxIframe').attr('name');")

      within_frame iframe_name do
        page.execute_script("jQuery.wymeditors(0).html('<p>#{new_text}</p>');")
        click_button 'Save Your Changes'
      end
    end
  end
end
