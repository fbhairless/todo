require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe("task path", {:type => :feature}) do
  it("take a task input from the user and store it in the todo list") do
    visit("/")
    fill_in('description', :with => "scrub the zebra")
    click_button('Add task')
    expect(page).to have_content("The task has been successfully submitted!")
    click_on("back")
    expect(page).to have_content("scrub the zebra")
  end
end
