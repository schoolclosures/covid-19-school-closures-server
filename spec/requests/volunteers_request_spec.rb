require 'rails_helper'

RSpec.describe Api::V1::VolunteersController, type: :request do
    let(:volunteer1) { Volunteer.create!( :image_url=>"first.jpg", :name=>"test1", :job_desc=>"description") }
    let(:volunteer2) { Volunteer.create!( :image_url=>"second.jpg", :name=>"test2", :job_desc=>"description") }

    describe '#index' do
      
    #    before(:example){get('http://localhost:3000/api/v1/volunteers')}

    #    it 'responds succesfully' do
    #      pending("volunteer route error")        
    #       expect(response).to have_http_status(:ok)
    #    end

       it 'renders all volunteers' do

       end

       it 'renders volunteers in ascending order'

       it 'renders at most 40 volunteers'

    end

    describe '#show' do

        before(:each){ get "http://localhost:3000/api/v1/volunteers/#{volunteer1.id}"}
        let(:response_json){json_parse(response.body)}

        it "responds succesfully" do
          expect(response).to have_http_status(200)
        end

        it "returns the information for the right volunteer" do
         #parse response to format json
          expect(response_json['id']).to eq(volunteer1.id)
        end

    end

    describe '#create' do

        let(:params){
            {:volunteer =>  {
                "image_url"=>"new.jpg", 
                "name"=>"new", 
                "job_desc"=>"newdescription"
              }
            }
        }

        let(:create_volunteer){post "http://localhost:3000/api/v1/volunteers", :params => params}

        before(:each){ create_volunteer }    
        let(:response_json){json_parse(response.body)}
 

       it "responds successfully" do
          expect(response).to have_http_status(200)
       end

       it "returns the newly created volunteer object" do
          expect(response_json).to include(params[:volunteer])
       end


       it "creates one more volunteer" do
          expect(Volunteer.count).to eq(1)
       end

    end


    describe '#update' do
    end

    describe '#destroy' do

    end

end

private

   def json_parse(string)
     if string.class==String
       json = JSON.parse(string)
     end
       json
    end
