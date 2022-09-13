class Api::V1::OriginalsController < ApplicationController
  include FormatDateHelper

  def show
    original = Original.find(params[:id])

    render status: :ok, json: {
      title: original.title,
      description: original.description,
      created_at: format_date(original.created_at)
    }
  rescue StandardError => e
    logger.error e
    render_common_error
  end

  def create
    author = Author.find_by!(address: original_create_params[:authorAddress])

    original = Original.new(
      author_id: author.id,
      content_id: original_create_params[:contentId],
      title: original_create_params[:title],
      description: original_create_params[:description],
    )

    return render_validation_error(original.errors.full_messages) unless original.save

    render_success
  rescue StandardError => e
    logger.error e
    render_common_error
  end

  private

  def original_create_params
    params.permit(
      :authorAddress,
      :contentId,
      :title,
      :description
    )
  end
end
