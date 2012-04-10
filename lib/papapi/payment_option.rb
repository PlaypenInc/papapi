module Papapi
  class PaymentOption < Hashie::Trash
    property :Id
    property :payoutoptionid
    property :pp_email
    property :pp_country

    property :pax_email
    property :pax_country

    property :payableto
    property :check_address
    property :check_city
    property :check_state
    property :check_zip

    property :beneficiary_bank_account_first_name
    property :beneficiary_bank_account_last_name
    property :beneficiary_phone_number
    property :beneficiary_address_street_1
    property :beneficiary_address_street_2
    property :beneficiary_address_city
    property :beneficiary_address_state
    property :beneficiary_address_postal_code
    property :beneficiary_address_country
    property :beneficiary_bank_account_number
    property :beneficiary_bank_account_IBAN
    property :beneficiary_information
    property :beneficiary_bank_account_RTN_SWIFT
    property :beneficiary_bank_account_IRC
    property :beneficiary_bank_name
    property :beneficiary_bank_address_street_1
    property :beneficiary_bank_address_street_2
    property :beneficiary_bank_address_city
    property :beneficiary_bank_address_state
    property :beneficiary_bank_address_postal_code
    property :beneficiary_bank_address_country
    property :beneficiary_bank_information
    property :intermediary_bank_account_number
    property :intermediary_bank_IBAN
    property :intermediary_bank_information
    property :intermediary_bank_account_RTN_SWIFT
    property :intermediary_bank_account_IRC
    property :intermediary_bank_name
    property :intermediary_bank_address_street_1
    property :intermediary_bank_address_street_2
    property :intermediary_bank_address_city
    property :intermediary_bank_address_country
    property :intermediary_bank_address_postal_code
    property :intermediary_bank_address_state

    def save!
      FormRequest.new(
        :class_name  => "Pap_Merchants_User_AffiliateForm",
        :method_name => "savePayouts",
        :arguments   => to_hash
      ).response
    end

    def self.save!(params)
      m = new params
      m.save!
      return m
    end
  end
end
