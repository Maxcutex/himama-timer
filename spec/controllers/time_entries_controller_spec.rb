require 'rails_helper'

RSpec.describe TimeEntriesController, type: :controller do
    describe "before_action matchers" do
        it { should use_before_action(:authenticate_user!) }
        it { should use_before_action(:set_time_entry) }
    end

    let(:user) { create(:user) }

    before do
        allow_any_instance_of(TimeEntriesController).to receive(:authenticate_user!).and_return(user)
        allow_any_instance_of(TimeEntriesController).to receive(:current_user).and_return(user)
      end
    describe "GET #index" do
    
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

    describe "POST start_timer" do

        it "start timer for current user" do
          expect(user.time_entries).to eq []
          post :start_timer
          expect(user.time_entries).not_to eq []
        end

        context "when timer is currently running" do
            let!(:time_entry) { create(:time_entry,  user: user) }

            it "should not allow a new timer" do
              expect{ post :start_timer }.not_to change{TimeEntry.count}
            end
        end
    end

    describe "POST stop_timer" do
        let!(:time_entry) { create(:time_entry,  user: user) }
    
        it "stop_timer for current user" do
          expect(time_entry.finishes_at).to eq nil
          post :stop_timer
          expect(time_entry.reload.finishes_at).not_to eq nil
        end
    end
end

  