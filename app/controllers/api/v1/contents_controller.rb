class Api::V1::ContentsController < ApplicationController
  include FormatDateHelper

  def index
    contents = []
    originals = Original.order(id: "DESC").map do |original|
      {
        isOriginal: true,
        contentId: original.content_id,
        title: original.title,
        description: original.description,
        createdAt: format_date(original.created_at)
      }
    end
    contents.concat(originals)

    secondaries = Secondary.order(id: "DESC").map do |secondary|
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
      contents: contents
    }
  rescue StandardError => e
    logger.error e
    render_common_error
  end
end
