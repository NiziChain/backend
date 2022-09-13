class Api::V1::AuthorsController < ApplicationController
  include FormatDateHelper

  def show
    author = Author.find_by!(address: params[:address])

    contents = []
    originals = author.originals.map do |original|
      {
        isOriginal: true,
        contentId: original.content_id,
        title: original.title,
        description: original.description,
        createdAt: format_date(original.created_at)
      }
    end
    contents.concat(originals)

    secondaries = author.secondaries.all.map do |secondary|
      {
        isOriginal: false,
        contentId: secondary.content_id,
        title: secondary.title,
        description: secondary.description,
        createdAt: format_date(secondary.created_at)
      }
    end
    contents.concat(secondaries)

    render status: :ok, json: {
      name: author.name,
      contents: contents
    }
  rescue StandardError => e
    logger.error e
    render_common_error
  end
end
