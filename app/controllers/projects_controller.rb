class ProjectsController < ApplicationController

  before_action :find_project, only: [:update, :destroy, :edit]
  
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
      if @project.save
        flash[:notice] = "Project saved."
        redirect_to user_project_path(current_user, @project)
      else
        flash[:error] = "Could not save project, please try again."
        render :new 
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
    @project = Project.find(params[:id])
    @notes = @project.notes.select(&:persisted?)
    @note = @project.notes.build
  end

  def destroy
      if @project.delete
        redirect_to authenticated_root_path 
      else
        flash[:error] = "Could not delete project, please try again."
      end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end

  def find_project
    @project = current_user.projects.find(params[:id])
  end

end
