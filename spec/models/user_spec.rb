require 'rails_helper'

describe User do
  describe '#create' do

    it "nickname, email, password, password_confirmationが存在すれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it " nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 15 characters)")
    end

    it "nicknameが15文字以内であれば登録できる" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "emailがない場合は登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できる" do
      user = build(:user, password: "aaaaaa", password_confirmation: "aaaaaa" )
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できない" do
      user = build(:user, password: "aaaa", password_confirmation: "aaaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "重複したemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

  end
end







#describe User do
#  describe '#create' do
#    it "nicknameがない場合は登録できない事" do
#      #テストしたいプロパティを持ったuserクラスのインスタンスを新規作成する
#      #今回はnicknameの値が空である状況を作りたいので、nicknameを""で空にして、他の値は適当に入れる
#      user = User.new(nickname: "", email: "kkk@gmial.com", password: "00000000", password_confirmation: "0000000")
#      #validメソッド（バリデーションにより保存できない状態であるかを確かめるもの）
#      user.valid?
#      #user.errors[:カラム名]でそのカラムが原因のエラー文が入った配列を取り出す事ができる
#      #includeは引数にとった値がexpectの引数である配列に含まれているかをチェックするマッチャー。
#        #今回はcan't be blankというエラーが出る事がわかってるんので、このエラーが出るはずだと引数を設定する事ができる
#      expect(user.errors[:nickname]).to include("can't be blank")
#    end
#  end
#
#  describe '#create' do
#    it "emailがない場合は登録できない事" do
#      user = User.new(nickname: "kkk", email: "", password: "000000000", password_confirmation: "000000000")
#      user.valid?
#      expect(user.errors[:email]).to include("can't be blank")
#    end
#  end
#end
