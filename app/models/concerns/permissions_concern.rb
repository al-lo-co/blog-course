module PermissionsConcern extend ActiveSupport::Concern

  def is_editor?
    self.permission == 0
  end

  def is_admin?
    self.permission == 1
  end
end