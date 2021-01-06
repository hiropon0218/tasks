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
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end

      it '名前が21文字以上のとき' do
        @user.name = "12345678910abcdefghijk"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前は20文字以内で入力してください")
      end

      it 'メールアドレスが存在しないとき' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it 'メールアドレスに＠マークが存在しないとき' do
        @user.email = "123abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
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
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
    
      it 'パスワードが5文字以下の時' do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'パスワードが存在してもパスワード確認が存在しない時' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
    end
  end
end
