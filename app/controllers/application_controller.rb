class ApplicationController < ActionController::Base
  before_action :elf
  def elf
    @categorias = Category.all
  end

  protected
  def authenticate_editor?
  	redirect_to root_path, notice: "no tienes permiso para hacer esto" unless user_signed_in? && (current_user.is_editor? || current_user.is_admin?)
  end
  
  def authenticate_admin?
  	redirect_to root_path, notice: "no tienes permiso para hacer estos" unless user_signed_in? && current_user.is_admin?
  end
end
