class Contact < ApplicationRecord

  validates :contact, :body, :email, presence: true
  validates_format_of :contact, with: /((\+)?\b(8|38)?(0[\d]{2}))([\d-]{5,8})([\d]{2})/
  validates :body, length: {maximum: 1000}
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

end
