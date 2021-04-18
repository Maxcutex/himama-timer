require 'rails_helper'

RSpec.describe TimeEntriesController, type: :controller do
    describe "before_action matchers" do
        it { should use_before_action(:authenticate_user!) }
        it { should use_before_action(:set_time_entry) }
    end

    describe "GET #index" do
        
        let(:user) { create(:user) }
    
        before do
          allow_any_instance_of(TimeEntriesController).to receive(:authenticate_user!).and_return(user)
          allow_any_instance_of(TimeEntriesController).to receive(:current_user).and_return(user)
        end
    
        describe "When entries exist within the account" do
          let!(:time_entries) { create(:time_entry,  user: user) }
    
          before do
            get :index
          end
    
          it "returns returns 200" do
            expect(response).to have_http_status(:success)
          end
    
        end
    
        
    end

    


end

  