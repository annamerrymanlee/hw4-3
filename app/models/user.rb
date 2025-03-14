class User < ApplicationRecord
  # Secure password functionality (automatically handles password hashing and authentication)
  has_secure_password

  # Validations for presence and uniqueness
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }  # Enforcing case insensitivity for email uniqueness
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  # Password validation: Minimum length and confirmation
  validates :password, length: { minimum: 6, message: "must be at least 6 characters long" }, allow_nil: true
  validates :password_confirmation, presence: true, if: :password_changed?

  # Optional: Custom password strength validation
  validate :password_must_be_secure, if: :password_changed?

  private

  # Custom validation to ensure the password meets common security criteria (uppercase, lowercase, and digits)
  def password_must_be_secure
    return if password.nil? || password.match?(/^(?=.*[A-Z])(?=.*\d)(?=.*[a-z]).{6,}$/)

    errors.add(:password, "must contain at least one uppercase letter, one lowercase letter, and one digit")
  end
end
