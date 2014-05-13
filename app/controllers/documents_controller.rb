class DocumentsController < ApplicationController


  def show
    render json: Document.all, each_serializer: DocumentSerializer
  end

  def create
    document = Document.new doc_params

    if document.save
      render json: document, status: 201
    else
      render json: {errors: document.errors.messages}, status: 422
    end
  end



  def index
    render json: Document.all, each_serializer: DocumentSerializer
  end

  private

  def doc_params
    params.require(:document).permit(:name, :author_id, :name, :content, :author_upload_comments, :file_file_name, :file_file_size, :file_content_type)
  end


end
