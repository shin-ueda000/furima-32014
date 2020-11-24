require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての値が、正しく入力されている時" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスは、@を含む必要があること" do
        @user.email = "test.example"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password = "a000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a0000"
        @user.password_confirmation = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password please include both letters and numbers in.")
      end
      it "passwordが英字のみの場合登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password please include both letters and numbers in.")
      end
      it "passwordが数字のみの場合登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password please include both letters and numbers in.")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "a000000"
        @user.password_confirmation = "a100000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字、全角（漢字・ひらがな・カタカナ）での入力が空だと登録出来ない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "名前、全角（漢字・ひらがな・カタカナ）での入力が空だと登録出来ない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Input in full-width (kanji, hiragana, katakana) is required")
      end
      it "名前、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input in full-width (kanji, hiragana, katakana) is required")
      end
      it "名字のフリガナは、全角（カタカナ）での入力が空だと登録出来ない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
        it "名前のフリガナは、全角（カタカナ）での入力が空だと登録出来ない" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
      it "名字のフリガナは、全角（カタカナ）での入力が必須である" do
        @user.family_name_katakana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana Frigana must be entered in full-width (katakana)")
      end
      it "名前のフリガナは、全角（カタカナ）での入力が必須である" do
        @user.first_name_katakana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana Frigana must be entered in full-width (katakana)")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
