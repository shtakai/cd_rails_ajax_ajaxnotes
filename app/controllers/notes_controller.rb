class NotesController < ApplicationController
  def index
    @notes = Note.all
    @note = Note.new
  end

  def get_notes
    @result = Note.all
    render json: @result.to_json
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to '/notes/index'
    else
      render text: 'failed creation note'
    end
  end

  def update
    @note = Note.find_by_id(params[:id])
    @note.update(description: params[:description])
    redirect_to '/notes/index'
  end

  def destroy
    @note = Note.find_by_id(params[:id])
    @note.destroy
    redirect_to '/notes/index'
  end

  private

  def note_params
    params.require(:note).permit(:title, :description)
  end

end
