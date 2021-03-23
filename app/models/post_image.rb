class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true #presence = 存在
  validates :image, presence: true


  # ここには、favorited_by?メソッドを作成します。
  # このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。
  # 存在していればtrue、存在していなければfalseを返すようにしています。
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
