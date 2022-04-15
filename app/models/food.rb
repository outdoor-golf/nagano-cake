class Food < ApplicationRecord
  has_one_attached:image
  # 投稿画像が表示されなかった時にサンプルを表示するメソッド（今回はnullを許可していない為いらない？）
  # def get_image(width,height)
  #   unless image.attached?
  #     file_path = Rails.root.join("app/assets/images/ファイル名")
  #     image.attach(io:File.open(file_path).filename:"default-image.jpg",content_type:"image/jpeg")
  #   end
  #   image.variant(resize_to_limit:[width,height]).processed
  # end
end
