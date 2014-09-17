RSpec::Matchers.define :have_error do |text, options|
  match do |page|
    field = options[:on]
    selector = ".//div[contains(@class,'error') and ./label[contains(text(),'#{field}')]]/*[contains(text(),\"#{text}\")]"
    page.should have_xpath(selector)
  end
end
