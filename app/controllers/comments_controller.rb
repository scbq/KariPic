class CommentsController < ApplicationController
  before_action :authenticate_user!  # Asegura que el usuario esté autenticado
  before_action :set_photo  # Establece la foto para asociar el comentario

  # POST /photos/:photo_id/comments
  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @photo, notice: "Comentario agregado con éxito."
    else
      redirect_to @photo, alert: "No se pudo agregar el comentario."
    end
  end

  private

  # Método para encontrar la foto a la que se le va a agregar el comentario
  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  # Solo permite los parámetros necesarios
  def comment_params
    params.require(:comment).permit(:content)
  end
end
