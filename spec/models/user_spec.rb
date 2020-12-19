require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が成功する時' do
      it "ニックネーム、eメールアドレス、パスワード、パスワード（確認）、姓名、フリガナの姓名、生年月日が存在する" do
        expect(@user).to be_valid
      end

      it "パスワードが6文字以上かつ半角の英字と数字両方を含むとき" do
        @user.password = "a0000000"
        expect(@user).to be_valid
      end
      it "姓が全角の漢字orひらがなorカタカナであるとき" do
        @user.last_name_kanji = "一にサン"
        expect(@user).to be_valid
        #テストのために以下を記載してます
        pp @user.password
        pp @user.last_name_kanji
        #テストのために以上を記載しています
      end
      it "名が全角の漢字orひらがなorカタカナであるとき" do
        @user.first_name_kanji = "四ごロク"
        expect(@user).to be_valid
        #テストのために以下を記載してます
        pp @user.password
      end
      it "姓のふりがなが全角のカタカナであるとき" do
        @user.last_name_katakana = "イチニサン"
        expect(@user).to be_valid
        #テストのために以下を記載してます
        pp @user.password
      end
      it "名のふりがなが全角のカタカナであるとき" do
        @user.first_name_katakana = "ヨンゴロク"
        expect(@user).to be_valid
        #テストのために以下を記載してます
        pp @user.password
      end
      
    end


    
    
    context '新規登録が失敗する時' do
      it "ニックネームが空のとき" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "eメールアドレスが空のとき" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "eメールアドレスに＠マークが存在しないとき" do
        @user.email = "bbbabbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "eメールアドレスが重複して存在するとき(eメールアドレスが一意性でないとき)" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "パスワードが空のとき" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが5文字以下のとき" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードが英字と数字の両方を含まないとき" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumeric characters.")
      end
      it "パスワードが存在してもパスワード（確認）が存在しないとき" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "苗字が空のとき" do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it "名前が空のとき" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it "名字（カナ）が空のとき" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "名前（カナ）が空のとき" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "生年月日が空のとき" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end 
  end
end