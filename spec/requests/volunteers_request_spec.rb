require 'rails_helper'

# ADD sharing examples about connect succesfully
# ask what if request failed??

RSpec.describe Api::V1::VolunteersController, type: :request do

    let(:volunteer) { Volunteer.create!( :image_url=>"first.jpg", :name=>"test1", :job_desc=>"description") }       

    # describe '#index' do
      
    # #    before(:example){get('http://localhost:3000/api/v1/volunteers')}

    # #    it 'responds succesfully' do
    # #      pending("volunteer route error")        
    # #       expect(response).to have_http_status(:ok)
    # #    end

    #    it 'renders all volunteers' do

    #    end

    #    it 'renders volunteers in ascending order'

    #    it 'renders at most 40 volunteers'

    # end

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
               # I change the key format from :key to "key" bc I want to use include to test them,
               # and "name" is not equal to :name here and I don't know how to make them consistent 
               # without changing the following key to "" format. pls let me know any good ways to keep them consistent 
                "image_url"=>"new.jpg", 
                "name"=>"new", 
                "job_desc"=>"new description"
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

end

private

   def json_parse(string)
     if string.class==String
       json = JSON.parse(string)
     end
       json
    end
