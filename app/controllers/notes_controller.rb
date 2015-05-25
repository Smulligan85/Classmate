class NotesController < ApplicationController

  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @project = Project.find(params[:project_id])
    @note = current_user.notes.build
  end

  def create
    @project = Project.find(params[:project_id])
    @note = @project.notes.build(note_params)
    @note.save ? flash[:notice] = "Note created." : flash[:error] = "Note could not be created, please try again."
    redirect_to [current_user, @project]
  end

  def show
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      @note.save
      flash[:notice] = "Note updated."
      redirect_to authenticated_root_path
    else
      flash[:error] = "Could not update note."
      render :edit
    end
  end

  def destroy
    @note.delete ? flash[:notice] = "Note deleted." : flash[:error] = "Note could not be deleted."
    redirect_to [current_user, @project]
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
