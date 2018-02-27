require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "Mailer" do
    mail = ReservationMailer.Mailer
    assert_equal "Mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
