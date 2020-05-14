require 'rails_helper'

RSpec.describe Api::V1::VolunteersController, type: :request do

    let(:volunteer) { Volunteer.create!( :image_url=>"volunteer.jpg", :name=>"test1", :job_desc=>"description") }       

    describe '#index' do
       let!(:volunteer1) { Volunteer.create!( :image_url=>"first.jpg", :name=>"test1", :job_desc=>"description") }       
       let!(:volunteer2) { Volunteer.create!( :image_url=>"second.jpg", :name=>"test2", :job_desc=>"description") }       

       it 'responds succesfully' do
        # I don't want to repeat this allow_any_instance thing, but I got error when taking it out of the example:
        # => error: The use of doubles or partial doubles from rspec-mocks outside of the per-test lifecycle is not supported.
            allow_any_instance_of(Api::V1::VolunteersController).to receive(:fetchVolunteerJson) do
                [volunteer1,volunteer2]
            end 
            get('/api/v1/volunteers')          
            expect(response).to have_http_status(:ok)
       end

        it 'renders all volunteers' do
            allow_any_instance_of(Api::V1::VolunteersController).to receive(:fetchVolunteerJson) do
                [volunteer1,volunteer2]
            end 
           get('/api/v1/volunteers')
           expect(Volunteer.all).to eq([volunteer1,volunteer2])
        end
    end

    describe '#show' do
        before(:each){ get "/api/v1/volunteers/#{volunteer.id}"}
        let(:response_json){json}

        it "responds succesfully" do
          expect(response).to have_http_status(200)
        end

        it "returns the information for the right volunteer" do
         #parse response to format json
          expect(response_json['id']).to eq(volunteer.id)
        end

    end

    describe '#create' do

        let(:params){
            {:volunteer =>  {
               # I change the key format from :key to "key" bc I want to use include to test them,
               # and "name" is not equal to :name here and I don't know how to make them consistent 
               # without changing the following key to "" format. pls let me know any good ways to keep them consistent 
                "image_url"=>"new.jpg", 
                "name"=>"new", 
                "job_desc"=>"new description"
              }
            }
        }

        let(:create_volunteer){post "/api/v1/volunteers", :params => params}

        before(:each){ create_volunteer }    
 
       it "responds successfully" do
          expect(response).to have_http_status(200)
       end

       it "returns the newly created volunteer object" do
          expect(json).to include(params[:volunteer])
       end

       it "creates one more volunteer" do
        # I wanted to use the commented out way at first however, for some reason, 
        # rspec detects that count never changed, I guess it is bc the observation on :count
        # starts after before(:each) block happen?

        #  =>  expect{create_volunteer}.to change(Volunteer, :count).by(1)
          expect(Volunteer.count).to eq(1)
       end

    end


    describe '#update' do
       let(:params){
            {:volunteer =>  {
                "image_url"=>"new.jpg", 
                "name"=>"test1", 
                "job_desc"=>"description"
            }
            }
        }

        it 'updates a certain volunteer' do
            patch "/api/v1/volunteers/#{volunteer.id}", :params => params
            volunteer.reload
            expect(volunteer.image_url).to eq("new.jpg")
        end



        it 'returns a no_content header' do
            patch "/api/v1/volunteers/#{volunteer.id}", :params => params
            expect(response).to have_http_status "204"
        end

    end

    describe '#destroy' do

        it 'delete a volunteer' do
            get "/api/v1/volunteers/#{volunteer.id}"
            expect(Volunteer.count).to be(1)

            delete "/api/v1/volunteers/#{volunteer.id}"
            expect(Volunteer.count).to be(0)
        end

        it 'returns a no_content header' do
            delete "/api/v1/volunteers/#{volunteer.id}"
            expect(response).to have_http_status "204"
        end

    end

end

