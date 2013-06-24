Given(/^I send and accept JSON$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When(/^I send (GET|DELETE) request to "([^\"]*)"$/) do |method, path|
  send method.downcase, path
end

When(/^I send (POST|PUT) request to "([^\"]*)" with the following:$/) do |method, path, body|
  send method.downcase, path, body
end

Then(/^the response status should be "([^\"]*)"$/) do |status|
  expect(last_response.status).to eql status.to_i
end

Then(/^the response body should contain "([^\"]*)" object with fields:$/) do |root, table|
  last_json = ActiveSupport::JSON.decode last_response.body
  last_json = last_json.first if last_json.is_a? Array
  fields = table.hashes.first
  
  obj = last_json[root]
  expect(obj).to be_kind_of Hash
  
  fields.each do |key, value|
    expect(obj).to have_key(key)
    expect(obj[key]).to eql value
  end
end