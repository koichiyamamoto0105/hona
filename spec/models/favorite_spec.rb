require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'N:1のモデルとの関係' do
      it 'Userモデルとの関係' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end

      it 'Mapモデルとの関係' do
        expect(Favorite.reflect_on_association(:map).macro).to eq :belongs_to
      end
    end
  end
end