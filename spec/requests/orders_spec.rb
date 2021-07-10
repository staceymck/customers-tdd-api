require 'rails_helper'

RSpec.describe "Orders", type: :request do
  #initialize test data
  let!(:orders) { create_list(:order, 5) }
  let!(:order_id) { orders.first.id }
  let!(:customer_id) { orders.first.customer_id }

  describe "GET /orders" do
    before { get '/api/v1/orders' }

    it "returns orders" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /orders" do
    #valid payload
    let(:valid_order) {{
      item_name: Faker::String.random(length: 4),
      customer_id: customer_id
    }}

    context 'when request is valid' do
      before { post '/api/v1/orders', params: {order: valid_order}}
      it 'creates a new order' do
        expect(json["item_name"]).to eq(valid_order[:item_name])
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post '/api/v1/orders', params: {order: {item_name: "", customer_id: nil}}}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a validation failure message' do
        expect(json).to include("item_name" => ["can't be blank"])
      end
    end
  end

  describe 'DELETE /orders/:id' do
    before { delete "/api/v1/orders/#{order_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

  end
end
