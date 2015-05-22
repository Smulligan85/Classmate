class NotesController < ApplicationController

  before_action :find_note, only: [:show, :update, :edit, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @note = @project.notes.new
  end

  def create
    @project = Project.find(params[:project_id])
    @note = current_user.notes.build(note_params)
    @note.project = @project
    if @note.save
      respond_to do |format|
        format.js
      end
    end
  end

  def show
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
    redirect_to authenticated_root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
