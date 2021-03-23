Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      # resourceと単数にすると、そのコントローラのidがリクエストに含まれなくなります。
      # 今回、いいねの詳細ページは作成しません。favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなっています。
    end
  resources :users, only: [:show, :edit, :update]

end
