module PermissionsConcern extend ActiveSupport::Concern
  
  def is_normal_user?
    self.permission == 0
  end

  def is_editor?
    self.permission == 1
  end

  def is_admin?
    self.permission == 2
  end
end