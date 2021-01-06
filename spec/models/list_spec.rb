require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @list = FactoryBot.build(:list)
  end

  describe 'list作成機能' do
    context 'list作成が成功するとき' do
      it 'titleが存在する時' do
        expect(@list).to be_valid
      end
    end

    context 'list作成が失敗する時' do
      # 文字数制限に関してはviewファイルで設けているのでテストコードは記述しない
      it 'titleが存在しないとき' do
        @list.title = nil
        @list.valid?
        expect(@list.errors.full_messages).to include("Title translation missing: ja.activerecord.errors.models.list.attributes.title.too_short")
      end
    end
  end
end