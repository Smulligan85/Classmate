class NotesController < ApplicationController

  before_action :find_note, only: [:show, :update, :edit, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @note = @project.notes.build
  end

  def create
    @project = Project.find(params[:project_id])
    @note = @project.notes.build(note_params)
    @note.project = @project
    @note.save ? flash[:notice] = "Note saved." : flash[:error] = "Note could not be saved, please try again."
    redirect_to [current_user, @project]
  end

  def update
    if @note.update_attributes(note_params)
      @note.save
      redirect_to authenticated_root_path
    else
      flash[:error] = "Could not save note."
      render :edit
    end
  end

  def edit
  end

  def destroy
    @note.delete ? flash[:notice] = "Note deleted." : flash[:error] = "Note could not be deleted."
    redirect_to user_project_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def find_note
    @project = Project.find(params[:project_id])
    @note = @project.notes.find(params[:id])
  end
end
