require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
  let!(:article_1) { create(:article) }
  let!(:article_2) { create(:article) }

  describe 'GET #index' do
    before do
      get :index
    end

    it { expect(assigns(:articles)).to eq([article_1, article_2]) }
  end

  describe "POST #create" do
    context "Unauthorized" do
      it "You can not create a new article" do
        post :create
        expect(response.status).to eq(401)
      end
    end

    context "Authorized" do
      subject { post :create, :params => { :article => { :title => "TitleRspec", :text => "TextRspec" } } }

      it "You have created a new article successful" do
        expect(response.status).to eq(200)
      end

      subject { post :create, :params => { :article => { :title => "Tit", :text => "TextRspec2" } } }

      it "Data is invalid" do
        expect(subject).to render_template('new');
      end
    end
  end
end
