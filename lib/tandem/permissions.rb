module Tandem
  module Permissions
    def can_edit_tandem_content?
      true
    end
    
    protected
      def check_tandem_access
        can_edit_tandem_content? || deny_tandem_access
      end
      
      def deny_tandem_access
        flash[:error] = "You don't have access to this page."
        redirect_to root_path
      end
  end
end