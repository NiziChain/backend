class Api::V1::ContentsController < ApplicationController
  def index
    contents = []
    originals = Original.all.map do |original|
      {
        isOriginal: true,
        title: original.title,
        description: original.description,
        created_at: original.created_at.strftime("%Y.%m.%d")
      }
    end
    contents.concat(originals)

    secondaries = Secondary.all.map do |secondary|
      {
        isOriginal: false,
        title: secondary.title,
        description: secondary.description,
        created_at: secondary.created_at.strftime("%Y.%m.%d")
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
