# require_relative "../test_helper"
#
# class UserSeesUpdatedRobotChangedInDirectory < FeatureTest
#
#   def test_user_sees_robot_added
#     visit '/robots/new'
#     fill_in('robot[name]', with: "Robby")
#     fill_in('robot[department]', with: "Junk")
#     fill_in('robot[datehired]', with: "who cares")
#     fill_in('robot[birthdate]', with: "lol")
#     fill_in('robot[city]', with: "nowhere")
#     fill_in('robot[state]', with: "also nowhere")
#     click_button('submit')
#
#     visit '/robots/1/edit'
#     fill_in('robot[name]', with: "Bobby")
#     fill_in('robot[department]', with: "Funk")
#     click_button('submit')
#     #
#     assert page.has_content?("Funk")
#     assert page.has_content?("Bobby")
#   end
# end
