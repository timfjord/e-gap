Given(/^I send and accept JSON$/) do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When(/^I send (GET|POST|DELETE) request to "([^\"]*)"$/) do |method, path|
  send method.downcase, path
end

When(/^I send (POST|PUT) request to "([^\"]*)" with the following:$/) do |method, path, body|
  send method.downcase, path, body
end

Then(/^the response status should be "([^\"]*)"$/) do |status|
  expect(last_response.status).to eql status.to_i
end

Then(/^the response body should( not)? contain "([^\"]*)" object with fields:$/) do |negative, root, table|
  # wrap into Array to mahke sure we match GET and POST responses
  last_json = Array.wrap ActiveSupport::JSON.decode(last_response.body)
  
  result = table.hashes.any? do |fields|
    last_json.any? do |json|
      obj = json[root]
      keys_intersect = obj.keys & fields.keys
      values_intersect = obj.values & fields.values
      # compare arrays without order, A match B if A - B = B - A
      (keys_intersect - fields.keys == fields.keys - keys_intersect) &&
        (values_intersect - fields.values == fields.values - values_intersect)
    end
  end
  
  expect(result).to (negative ? be_false : be_true)
end

Then(/^the response body should contain "([^\"]*)" object with( not)? nil field "(.*?)"$/) do |root, negative, field|
  last_json = Array.wrap ActiveSupport::JSON.decode(last_response.body)
  expectation_method = negative ? :not_to : :to
  
  last_json.each do |json|
    expect(json[root][field]).send expectation_method, be_nil
  end
end

Then(/^the response body should contain$/) do |body|
  expect(last_response.body).to eql body
end