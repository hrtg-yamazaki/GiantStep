## 新規登録のテスト ##

require "rails_helper"

RSpec.describe User, type: :model do
  
  describe "signup#keep" do
    
    context "sessionに保存できる" do

      it "全てのカラムが埋まっていれば保存できる" do
        user = build(:user)
        user.valid?(:keep)
        expect(user).to be_valid
      end

      it "emailが @ を含む英数字であれば保存できる" do
        user = build(:user, email: "test@test.com")
        user.valid?(:keep)
        expect(user).to be_valid
      end

      it "passwordが7文字以上ならば保存できる" do
        user = build(:user, password: "tech123")
        user.valid?(:keep)
        expect(user).to be_valid
      end

      it "passwordが128文字以下ならば保存できる" do
        user = build(:user, password: "12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345abcde12345678")
        user.valid?(:keep)
        expect(user).to be_valid
      end

    end

    context "sessionに保存できない" do

      it "emailが空では保存できない" do
        user = build(:user, email: "")
        user.valid?(:keep)
        expect(user.errors[:email]).to include("メールアドレス を入力してください")
      end

      it "emailが@を含まなければ保存できない" do
        user = build(:user, email: "testtest.com")
        user.valid?(:keep)
        expect(user.errors[:email]).to include("フォーマットが不適切です")
      end

      it "passwordが空では保存できない" do
        user = build(:user, password: "")
        user.valid?(:keep)
        expect(user.errors[:password]).to include("パスワード を入力してください")
      end

      it "passwordが6文字以下では保存できない" do
        user = build(:user, password: "pass12")
        user.valid?(:keep)
        expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを入力してください")
      end

      it "passwordが129文字以上では保存できない" do
        user = build(:user, password: "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678a")
        user.valid?(:keep)
        expect(user.errors[:password]).to include("128文字以下で入力してください")
      end

      it "passwordが数字のみでは登録できない" do
        user = build(:user, password: "1234567890")
        user.valid?(:keep)
        expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを入力してください")
      end

      it "passwordが英字のみでは登録できない" do
        user = build(:user, password: "abcdefghij")
        user.valid?(:keep)
        expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを入力してください")
      end
      
    end
  end

  describe "signup#user_create" do

    context "ユーザー登録できる" do

      it "全てのカラムが埋まっていれば登録できる" do
        user = build(:user)
        user.valid?(:user_create)
        expect(user).to be_valid
      end

      it "nicknameが20文字以下であれば登録できる" do
        user = build(:user, nickname: '12345678901234567890')
        user.valid?(:user_create)
        expect(user).to be_valid
      end

      it "privacyがon_privateでも登録できる" do
        user = build(:user, privacy: "on_private")
        user.valid?(:user_create)
        expect(user).to be_valid
      end

      it "iconが空でも登録できる" do
        user = build(:user, icon: nil)
        user.valid?(:user_create)
        expect(user).to be_valid
      end

      it "profileが空でも登録できる" do
        user = build(:user, profile: "")
        user.valid?(:user_create)
        expect(user).to be_valid
      end

      it "profileが1000文字以内なら登録できる" do
        user = build(:user, profile: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        user.valid?(:user_create)
        expect(user).to be_valid
      end

    end

    context "保存できない" do

      it "nicknameが空だと登録できない" do
        user = build(:user, nickname: "")
        user.valid?(:user_create)
        expect(user.errors[:nickname]).to include("ニックネーム を入力してください")
      end

      it "nicknameが21文字以上だと登録できない" do
        user = build(:user, nickname: '123456789012345678901')
        user.valid?(:user_create)
        expect(user.errors[:nickname]).to include("20文字以下で入力してください")
      end

      it "privacyが空では登録できない" do
        user = build(:user, privacy: "")
        user.valid?(:user_create)
        expect(user.errors[:privacy]).to include("公開設定が選択されていません")
      end

      it "profileが1001文字以上では登録できない" do
        user = build(:user, profile: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab")
        user.valid?(:user_create)
        expect(user.errors[:profile]).to include("1000文字以下で入力してください")
      end

      it "birthdayが空では登録できない" do
        user = build(:user, birthday: "")
        user.valid?(:user_create)
        expect(user.errors[:birthday]).to include("生年月日 を入力してください")
      end

    end

  end

end