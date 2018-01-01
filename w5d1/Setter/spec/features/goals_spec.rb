require 'spec_helper'
require 'rails_helper'

feature "CRUD process for goals" do
  before :each do
    FactoryBot.create(:jeff)
    FactoryBot.create(:jay)
  end
  scenario "has a new goal page" do
    sign_in_as_jeff
    visit(new_goal_url)
    expect(page).to have_content('Create Goal')
  end

  feature "creates a new goal" do
    scenario "with invalid params" do
      sign_in_as_jeff
      visit(new_goal_url)
      click_button("Create Goal")
      expect(page).to have_content("Body can't be blank")
    end

    scenario "with valid params" do
      sign_in_as_jeff
      visit(new_goal_url)
      fill_in("Goal", with: 'Pass assessment 4')
      click_button("Create Goal")
      expect(page).to have_content("Pass assessment 4")
    end
  end

  feature "private goals are private" do
    scenario "when viewed by goal owner" do
      sign_in_as_jeff
      visit(new_goal_url)
      fill_in("Goal", with: 'Pass assessment 4')
      choose("Private")
      click_button("Create Goal")

      expect(page).to have_content("Pass assessment 4")
      expect(page).to have_content("This goal is private")

    end

    scenario "when viewed by another user" do
      jeff = FactoryBot.create(:user)
      goal = FactoryBot.create(:goal, { user_id: jeff.id, private: true })

      sign_in("Jay")
      visit(goal_url(goal.id))
      expect(page).to have_content("You do not have permission to view this")
    end
  end
end
