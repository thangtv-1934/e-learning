class User < ApplicationRecord
  OMNIAUTH_PROVIDERS = %W(#{Settings.omniauth.facebook}
  #{Settings.omniauth.google_oauth2}).freeze

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: OMNIAUTH_PROVIDERS.map(&:to_sym)

  has_many :courses, dependent: :destroy
  has_many :learnings, dependent: :destroy
  has_many :results, dependent: :destroy

  has_one_attached :avatar

  class << self
    def new_with_session params, session
      super.tap do |user|
        OMNIAUTH_PROVIDERS.each do |provider|
          if data = session["devise.#{provider}_data"] &&
              session["devise.#{provider}_data"]["extra"]["raw_info"]
            next unless user.email.blank?
            user.email = data["email"]
            user.
            break
          end
        end
      end
    end

    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[Settings.user.min_password_length, Settings.user.max_password_length]
        user.name = auth.info.name
      end
    end
  end
end
