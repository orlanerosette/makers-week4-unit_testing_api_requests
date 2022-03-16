require 'cat_facts'

RSpec.describe CatFacts do
  it "provides a cat fact" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"A cat can jump up to five times its own height in a single bound.","length":65}')
    cat_fact = CatFacts.new(fake_requester)
    expect(cat_fact.provide).to eq "Cat fact: A cat can jump up to five times its own height in a single bound."
  end
end