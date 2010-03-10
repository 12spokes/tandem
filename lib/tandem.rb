require 'tandem/permissions'

ActionController::Base.send :include, Tandem::Permissions
ActionController::Base.send :helper_method, :can_edit_tandem_content?
ActionController::Base.send :helper, TandemContentsHelper