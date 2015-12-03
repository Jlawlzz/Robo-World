# require_relative "../test_helper"
#
# class UserDoesNotSeeRobotDeletedInDirectory < FeatureTest
#
#   def test_user_sees_robot_added
#     visit '/robots/new'
#     fill_in('robot[name]', with: "Robby")
#     click_button('submit')
#
#     visit '/robots'
#     click_button('delete')
#     #
#     visit '/robots'
#     refute page.has_content?("Robby")
#   end
# end
