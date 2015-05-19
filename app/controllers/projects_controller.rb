class ProjectsController < ApplicationController
  
  def index
    @user = current_user
    @projects = @user.projects
  end

  def create
    @project = current_user.projects.build(project_params)
      if @project.save
        flash[:notice] = "Project saved."
        redirect_to user_project_path
      else
        flash[:error] = "Could not save project, please try again."
        redirect_to user_projects
      end
  end

  def update
    @project = find_project
      if @topic.update_attributes(project_params)
        @topic.save
        redirect_to user_project_path
      else
        flash[:error] = "Could not update project title, please try again."
      end
  end

  def show
    @project = find_project
  end

  def destroy
    @project = find_project
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
    @project = Project.find(params[:id])
  end

end
