# frozen_string_literal: true

JS_DRIVER = :selenium_chrome_headless

Capybara.default_driver = :rack_test
Capybara.javascript_driver = JS_DRIVER
Capybara.default_max_wait_time = 2
Capybara.configure do |config|
  config.ignore_hidden_elements = true
end

RSpec.configure do |config|
  config.before do |example|
    Capybara.current_driver = JS_DRIVER if example.metadata[:js]
    Capybara.current_driver = :selenium if example.metadata[:selenium]
    Capybara.current_driver = :selenium_chrome if example.metadata[:selenium_chrome]
  end

  config.after do
    Capybara.use_default_driver
  end
end
