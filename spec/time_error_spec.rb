require 'time_error'


RSpec.describe TimeError do
  it "returns the difference in seconds between server time and local computer time" do
    fake_requester = double :requester
    expect(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"GMT","client_ip":"2a00:23c8:9613:3300:5d8b:f8a7:efd6:8c2b","datetime":"2022-03-16T11:42:32.229803+00:00","day_of_week":3,"day_of_year":75,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1647430952,"utc_datetime":"2022-03-16T11:42:32.229803+00:00","utc_offset":"+00:00","week_number":11}')
    fake_time = Time.new(2022, 03, 16, 11, 42, 32)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(fake_time)).to eq 0.229803
  end
end