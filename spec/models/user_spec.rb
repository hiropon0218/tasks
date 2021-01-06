require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が成功するとき' do
      it '名前、メールアドレス、パスワード、パスワード確認が存在するとき' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が失敗するとき' do
      it '名前が存在しないとき' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前 translation missing: ja.activerecord.errors.models.user.attributes.name.blank")
      end

      it '名前が21文字以上のとき' do
        @user.name = "12345678910abcdefghijk"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前 translation missing: ja.activerecord.errors.models.user.attributes.name.too_long")
      end

      it 'メールアドレスが存在しないとき' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
      end

      it 'メールアドレスに＠マークが存在しないとき' do
        @user.email = "123abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレス translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
      end

      it 'メールアドレスが重複しているとき' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include()
      end

      it 'パスワードが存在しないとき' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
      end
    
      it 'パスワードが5文字以下の時' do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
      end

      it 'パスワードが存在してもパスワード確認が存在しない時' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
    end
  end
end
