class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)
    @note.save ? flash[:notice] = "Note saved." : flash[:error] = "Note could not be saved, please try again."
    redirect_to authendicated_root_path
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      @note.save
      redirect_to authendicated_root_path
    else
      flash[:error] = "Could not save note."
      render :edit
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.delete
      flash[:notice] = "Note deleted."
    else
      flash[:error] = "Note could not be deleted."
    end
      redirect_to authendicated_root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
