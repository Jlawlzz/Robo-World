# require_relative "../test_helper"
#
# class UserSeesRobotAddedAfterCreation < FeatureTest
#
#   def test_user_sees_robot_added
#     visit '/robots/new'
#     fill_in('robot[name]', with: "Robby")
#     fill_in('robot[department]', with: "Junk")
#     click_button('submit')
#     assert page.has_content?("Junk")
#     assert page.has_content?("Robby")
#   end
# end
