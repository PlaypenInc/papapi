module Papapi
  class Affiliate < Model
    set_pap_class 'Pap_Signup_Affiliate'

    property :username
    property :firstname
    property :lastname
    property :parentuserid
    property :refid
    property :userid
    property :payoutoptionid
    property :rpassword,  :from => :password
    property :data1,      :from => :url
    property :data2,      :from => :company
    property :data3,      :from => :street
    property :data4,      :from => :city
    property :data5,      :from => :state
    property :data6,      :from => :country
    property :data7,      :from => :zip
    property :data8,      :from => :phone

    def add_to_commission_group (campaing_id, commission_group_id, opt = {})
      raise 'Affiliate has no userid, make sure it is set first' if userid.nil?
      
      # Default options
      opt[:status] ||= 'A'
      opt[:note]   ||= ''
      
      FormRequest.new(
        :connection  => Papapi.connection,
        :class_name  => 'Pap_Features_Common_AffiliateGroupForm',
        :method_name => 'add',
        :arguments   => {
          'Id'                => '',
          'userid'            => userid,
          'rstatus'           => opt[:status],
          'note'              => opt[:note],
          'commissiongroupid' => commission_group_id,
          'campaignid'        => campaing_id
        }
      ).response
    end

    def total_unpaid_transactions
      raise 'Affiliate has no userid, make sure it is set first' if userid.nil?

      response = Papapi::GridRequest.new(
        :class_name => 'Pap_Merchants_Transaction_TransactionsGrid',
        :method_name=> 'getRows',
        :arguments  => {
          :filters => [
            ['payoutstatue', 'E', 'U'],
            ['userid', 'E', userid]
          ]
        }
      ).response
      
      response.map{|r| r['totalcost'].to_i}.inject{|sum,x| sum + x }
    end

  end
end