class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    bakedgoods_price = BakedGood.order(price: :desc)
    bakedgoods_price.to_json
  end

  get '/baked_goods/most_expensive' do
    bakedgoods_most_price = BakedGood.order(price: :desc).first
    bakedgoods_most_price.to_json
  end

end
