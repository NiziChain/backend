class Api::V1::OriginalsController < ApplicationController
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
end
