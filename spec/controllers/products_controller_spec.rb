require 'rails_helper'

describe ProductsController, type: :controller do

  # let! creates product immediately so that changes in product numbers can be tracked later
  let!(:product) {Product.create(name: "Product X")}
  # admin user needed for most actions
  let(:admin_user) { FactoryBot.create(:admin) }

  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the show template' do
      get :show, params: {id: product.id}
      expect(response).to be_ok
      expect(response).to render_template('show')
    end

    it "routes /products/1 to products#show" do
      expect(get: "/products/1").to route_to(
      controller: "products",
      action: "show",
      id: "1"
      )
    end

  end

  context '#new' do
    before do
      sign_in admin_user
    end

    # GET
    it 'renders the new product template' do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end

    # POST
    it "routes /products to products#create" do
      expect(post: "/products").to route_to(
        controller: "products",
        action: "create"
      )
    end

    # POST
    it 'creates a new valid product' do
      expect{
        post :create, params: {product: FactoryBot.attributes_for(:product)}
      }.to change(Product, :count).by(1)
    end

    # POST
    it 'does not create a new invalid product' do
      expect{
        post :create, params: {product: "name: nil"}
      }.to raise_error(NoMethodError)
    end

  end # context new

  context '#edit' do
    before do
      sign_in admin_user
    end
    # GET
    it 'renders the edit product template' do
      get :edit, params: {id: product.id}
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  context '#updates' do
    before do
      sign_in admin_user
    end

    it 'updates a product' do
      patch :update, params: {id: product.id, product: {price: 9999}}
      product.reload
      expect(product.price).to eq 9999
    end

    it 'does not update an invalid product' do
      # puts product.name
      patch :update, params: {id: product.id, product: {name: nil}}
      product.reload
      expect(product.name).to_not eq nil
      # puts product.name
    end

  end # update

  context '#delete' do
    before do
      sign_in admin_user
    end

    it 'deletes a product' do
      # puts Product.all.size
      expect{
        delete :destroy, params: {id: product.id}
      }.to change(Product, :count).by(-1)
      # puts Product.all.size
    end

    it "redirects to the products index" do
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to products_path
    end

  end # delete

end
