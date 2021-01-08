class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :lists, dependent: :destroy
  # コールバックでユーザー新規登録後に「読了」「読みかけ」カードを生成
  after_create :create_list

  validates :name,   presence: true, length: { maximum: 20 }

  private
  def create_list
    lists.create(title: "読了")
    lists.create(title: "読書中")
    lists.create(title: "積み本")
  end

end
