class Api::V1::SecondariesController < ApplicationController
  include FormatDateHelper

  def show
    secondary = Secondary.find_by!(content_id: params[:contentId])

    render status: :ok, json: {
      contentId: secondary.content_id,
      title: secondary.title,
      description: secondary.description,
      createdAt: format_date(secondary.created_at)
    }
  rescue StandardError => e
    logger.error e
    render_common_error
  end

  def create
    parent = Original.find_by(title: secondary_create_params[:parentTitle])

    return render_validation_error("親作品が見つかりません") unless parent

    author = Author.find_by!(address: secondary_create_params[:authorAddress])

    secondary = Secondary.new(
      author_id: author.id,
      original_id: parent.id,
      content_id: secondary_create_params[:contentId],
      title: secondary_create_params[:title],
      description: secondary_create_params[:description],
    )

    return render_validation_error(secondary.errors.full_messages) unless secondary.save

    render_success
  rescue StandardError => e
    logger.error e
    render_common_error
  end

  private

  def secondary_create_params
    params.permit(
      :authorAddress,
      :parentTitle,
      :contentId,
      :title,
      :description
    )
  end
end
