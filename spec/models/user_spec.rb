require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できない事" do
      #テストしたいプロパティを持ったuserクラスのインスタンスを新規作成する
      #今回はnicknameの値が空である状況を作りたいので、nicknameを""で空にして、他の値は適当に入れる
      user = User.new(nickname: "", email: "kkk@gmial.com", password: "00000000", password_confirmation: "0000000")
      #validメソッド（バリデーションにより保存できない状態であるかを確かめるもの）
      user.valid?
      #user.errors[:カラム名]でそのカラムが原因のエラー文が入った配列を取り出す事ができる
      #includeは引数にとった値がexpectの引数である配列に含まれているかをチェックするマッチャー。
        #今回はcan't be blankというエラーが出る事がわかってるんので、このエラーが出るはずだと引数を設定する事ができる
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
