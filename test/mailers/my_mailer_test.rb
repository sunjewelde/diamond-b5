require 'test_helper'

class MyMailerTest < ActionMailer::TestCase
  test "upload_confirmation" do
    mail = MyMailer.upload_confirmation
    assert_equal "Upload confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
