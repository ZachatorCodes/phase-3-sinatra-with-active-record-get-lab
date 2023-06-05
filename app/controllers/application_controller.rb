class ApplicationController < Sinatra::Base
  
  set default_content_type: "application/json"

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    ordered_goods = BakedGood.by_price
    ordered_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive_good = BakedGood.most_expensive
    most_expensive_good.to_json
  end

end
