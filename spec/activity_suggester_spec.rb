require 'activity_suggester'

RSpec.describe ActivitySuggester do
  it "suggests an activity" do
    fake_requester = double :requester
    expect(fake_requester).to receive(:get).with(URI("https://www.boredapi.com/api/activity")).and_return('{"activity":"Pick up litter around your favorite park","type":"charity","participants":1,"price":0,"link":"","key":"4894697","accessibility":0.05}')
    activity_suggester = ActivitySuggester.new(fake_requester)
    expect(activity_suggester.suggest).to eq "Why not: Pick up litter around your favorite park"
  end
end