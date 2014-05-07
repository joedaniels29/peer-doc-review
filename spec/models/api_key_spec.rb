# require 'spec_helper'
#
# describe ApiKey do
#   it "generates access token" do
#     joe = users(:joe)
#     api_key = ApiKey.create(scope: 'session', user_id: joe.id)
#     expect(api_key).to be_new_record
#     expect(api_key.access_token).to match /\S{32}/
#   end
#
#   it "sets the expired_at properly for 'session' scope" do
#     allow(Time).to receive(:now).and_return(Time.at(0))
#       joe = users(:joe)
#       api_key = ApiKey.create(scope: 'session', user_id: joe.id)
#       expect(api_key).expired_at  4.hours.from_now
#
#   end
#
#   it "sets the expired_at properly for 'api' scope" do
#     Time.stub :now, Time.at(0) do
#       joe = users(:joe)
#       api_key = ApiKey.create(scope: 'api', user_id: joe.id)
#
#       expect(api_key).expired_at 30.days.from_now
#     end
#   end
# end
