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
         redirect_to(projects_path(), :notice => "The role was created.")
       else
         render 'new'
       end
      }
    end
  end
  
  def edit
    @role = project.roles.find(params[:id])
    respond_with [project, @role]
  end
  
  def update
    @role = project.roles.find(params[:id])
    update_was_successful = @role.update_attributes(params[:role])
    
    respond_with [project, @role] do |format|
      format.html {
       if update_was_successful
         redirect_to(projects_path(), :notice => "The role was saved.")
       else
         render 'edit'
       end
      }
    end
  end
  
  def destroy
    role = project.roles.find(params[:id])
    if role.destroy
      flash[:notice] = "The role was destroyed."
    else
      flash[:alert] = "The role could not be destroyed."
    end
    
    redirect_to(project_path(project))
  end
  
  private
  def project
    @project ||= Project.find(params[:project_id])
  end
end