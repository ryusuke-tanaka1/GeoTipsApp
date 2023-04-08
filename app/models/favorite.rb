class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tip
  # 同じユーザーIDに対して、tip_idの一意制約
  # scopeが無いと、同じtip_idのオブジェクトが作れなくなる。＝一人しかお気に入り登録できなくなる。
  validates_uniqueness_of :tip_id, scope: :user_id
end
