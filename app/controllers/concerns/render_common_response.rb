module RenderCommonResponse
  extend ActiveSupport::Concern

  def render_success
    render status: :ok, json: {
      code: 200,
      message: :success
    }
  end

  def render_common_error(error_message_list = ["予期せぬエラーが発生しました"])
    render status: :internal_server_error, json: {
      code: 500,
      message: "予期せぬエラーが発生しました",
      detailMessage: error_message_list
    }
  end

  def render_validation_error(error_message_list)
    render status: :bad_request, json: {
      code: 400,
      message: "パラメータが不正です",
      detailMessage: error_message_list
    }
  end

  def render_authorization_error(error_message_list)
    render status: :unauthorized, json: {
      code: 422,
      message: "認証に失敗しました",
      detailMessage: error_message_list
    }
  end

  def render_notfound_error()
    render status: :not_found, json: {
      code: 404,
      message: "#{error_message_list.first.model}が見つかりません",
      detailMessage: "#{error_message_list.first.model}が見つかりません"
    }
  end
end
