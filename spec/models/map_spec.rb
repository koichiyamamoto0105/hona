require 'rails_helper'

RSpec.describe 'Mapモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    let!(:map) { build(:map, user_id: user.id) }

    context 'spotnameカラム' do
      it '空欄でないこと' do
        map.spotname = ''
        expect(map.valid?).to eq false;
      end
    end
    context 'latitudeカラム' do
      it '空欄でないこと' do
        map.latitude = ''
        expect(map.valid?).to eq false;
      end
    end
    context 'longitudeカラム' do
      it '空欄でないこと' do
        map.longitude = ''
        expect(map.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Map.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
