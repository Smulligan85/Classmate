class ProjectsController < ApplicationController




  before_action :find_project, only: [:update, :destroy, :edit]
  
  def index
    @user = current_user
    @projects = @user.projects
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)
      if @project.save
        flash[:notice] = "Project saved."
        redirect_to user_project_path
      else
        flash[:error] = "Could not save project, please try again."
        redirect_to user_projects
      end
  end

  def update
      if @project.update_attributes(project_params)
        @project.save
        redirect_to user_project_path
      else
        flash[:error] = "Could not update project title, please try again."
      end
  end

  def edit
  end

  def show
  end

  def destroy
      if @project.delete
        redirect_to user_projects
      else
        flash[:error] = "Could not delete project, please try again."
      end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end

  def find_project
    @project = current_user.projects.find(param[:id]])
  end

end
