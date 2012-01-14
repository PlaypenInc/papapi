module Papapi
  class Affiliate < Hashie::Dash
    property :username
    property :password
    property :firstname
    property :lastname
    property :url
    property :company
    property :street
    property :city
    property :state
    property :country
    property :zip
    property :phone
    property :refid
    property :parentuserid

    def save!
      PostRequest.new(
        :connection  => Papapi.connection,
        :class_name  => 'Pap_Signup_AffiliateForm',
        :method_name => 'add',
        :arguments   => {
          'username'       => username,
          'rpassword'      => password,
          'firstname'      => firstname,
          'lastname'       => lastname,
          'parentuserid'   => parentuserid,
          'data1'          => url,
          'data2'          => company,
          'data3'          => street,
          'data4'          => city,
          'data5'          => state,
          'data6'          => country,
          'data7'          => zip,
          'data8'          => phone,
          'refid'          => refid,
          'agreeWithTerms' => 'Y'
        }
      ).response
    end

    class << self
      def create! (params)
        new(params).save!
      end
    end
  end
end