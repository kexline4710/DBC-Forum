require 'spec_helper'

describe SessionsController, "#index" do

    context "renders the index template" do
      before do
        get :index  
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
    end


end
