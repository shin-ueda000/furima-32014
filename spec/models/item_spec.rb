require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる時' do
      it "全ての値が、正しく入力されている時" do
        expect(@item).to be_valid
      end
    end

    context '商品出品が出来ない時' do
      it "画像が空だと登録出来ない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録出来ない" do
        @item.title = nil
        @item.valid?    
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品名の説明がが空だと登録出来ない" do
        @item.description_of_item = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end
      it "カテゴリーの情報がid[1]では登録出来ない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報ほうがid[1]では登録出来ない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it "配送料負担についての情報ほうがid[1]では登録出来ない" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it "発売元の地域についての情報ほうがid[1]では登録出来ない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "価格についての情報が空だと登録出来ない" do
        @item.selling_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank", "Selling price is not a number")
      end
      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 10000000")
      end
      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than 299")
      end
      it "販売価格は半角数字のみ保存可能であること" do
        @item.selling_price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
    end 
  end
end
