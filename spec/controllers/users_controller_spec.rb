require 'rails_helper'
describe UsersController, type: :controller do

  let(:user) { User.create!(email: "newbie@new.bie", password: "123456", confirmed_at: DateTime.now) }
  let(:anotheruser) { User.create!(email: "anothernewbie@new.bie", password: "123456", confirmed_at: DateTime.now) }


  describe 'GET #show' do

    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it "loads correct user detail" do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end

      it "cannot access another users page and gets redirected to root_path" do
        get :show, params: { id: anotheruser.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to root_url
        # follow_redirect!
        # expect(response).to have_http_status(401)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end
