class Api::V1::SecondariesController < ApplicationController
  def show
    secondary = Secondary.find(params[:id])

    render status: :ok, json: {
      title: secondary.title,
      description: secondary.description,
      created_at: secondary.created_at.strftime("%Y.%m.%d")
    }
  rescue StandardError => e
    logger.error e
    render_common_error
  end
end
