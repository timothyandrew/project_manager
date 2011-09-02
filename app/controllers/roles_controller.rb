class RolesController < ApplicationController
  
  respond_to :html
  
  def new
    @role = project.roles.new
    
    respond_with [project, @role]
  end
  
  def create
    @role = project.roles.new(params[:role])
    new_was_successful = @role.save
    
    respond_with [project, @role] do |format|
      format.html {
       if new_was_successful
         redirect_to(project_path(project), :notice => "The role was created")
       else
         render 'new'
       end
      }
    end
  end
  
  private
  def project
    @project ||= Project.find(params[:project_id])
  end
end