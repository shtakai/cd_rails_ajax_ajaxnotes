class NotesController < ApplicationController
  def index
    @notes = Note.all
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to '/notes/index'
    else
      render text: 'failed creation note'
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :description)
  end

end
