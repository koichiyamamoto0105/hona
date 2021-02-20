require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    let(:test_map) { build(:map, user_id: user.id) }
    let(:comment) { build(:comment, user_id: user.id, map_id: test_map.id) }

    context 'titleカラム' do
      let(:test_comment) { comment }

      it '空欄の場合はエラーが出る' do
        test_comment.title = ''
        test_comment.valid?
      end

      it '50文字以下であること' do
        test_comment.comment = Faker::Lorem.characters(number: 51)
        test_comment.valid?
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'N:1のモデルとの関係' do
      it 'Userモデルとの関係' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it 'Mapモデルとの関係' do
        expect(Comment.reflect_on_association(:map).macro).to eq :belongs_to
      end
    end
  end
end

# RSpec.describe Comment, "モデルに関するテスト", type: :model do
#   describe '実際に保存してみる' do
#     it "有効な投稿内容の場合は保存されるか" do
#       expect(FactoryBot.build(:comment)).to be_valid
#     end
# 	  end
	 # context "空白のバリデーションチェック" do
	 #   it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	 #     book = Book.new(title: '', body:'hoge')
	 #     expect(book).to be_invalid
	 #     expect(book.errors[:title]).to include("can't be blank")
	 #   end
	 #   it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	 #     book = Book.new(title: 'hoge', body:'')
	 #     expect(book).to be_invalid
	 #     expect(book.errors[:body]).to include("can't be blank")
	 #   end
	 # end
# 	end