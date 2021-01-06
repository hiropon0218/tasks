require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe 'card作成機能' do
    context 'card作成が成功するとき' do
      it 'titleが存在する時' do
        expect(@card).to be_valid
      end
    end

    context 'card作成が失敗するとき' do
    # 文字数制限に関してはviewファイルで設けているのでテストコードは記述しない
      it 'titleが存在しないとき' do
        @card.title = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("Titleは1文字以上で入力してください")
      end
    end
  end
end

