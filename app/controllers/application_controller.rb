class ApplicationController < ActionController::Base
  # before_actionはこのコントローラーが動作する前に実行される。

  # authenticate = 信頼できることを証明する、本物であることを証明する except = 〜を除いては
  # deviseが用意しているメソッド。未ログイン認証の状態で[ ]以外のページにアクセスするとログイン画面へリダイレクトされる。
  before_action :authenticate_user!,except: [:top]

  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  protected
    # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
    # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    # Strong Parametersと同様の機能です。
    # privateは、自分のコントローラ内でしか参照できません。一方、protectedは呼び出された他のコントローラからも参照できます。

end
