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

        before(:each) { get "http://localhost:3000/api/v1/volunteers/#{volunteer1.id}"}

        it "responds succesfully" do
          expect(response).to have_http_status(200)
        end

        it " returns the information for the right volunteer" do
         #parse response to format json
          response_json = json_parse(response.body)
          expect(response_json['id']).to eq(volunteer1.id)
        end



    end

    describe '#create' do
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
