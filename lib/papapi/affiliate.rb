module Papapi
  class Affiliate < Hashie::Trash
    property :username
    property :firstname
    property :lastname
    property :parentuserid
    property :refid
    property :userid
    property :rpassword,  :from => :password
    property :data1,      :from => :url
    property :data2,      :from => :company
    property :data3,      :from => :street
    property :data4,      :from => :city
    property :data5,      :from => :state
    property :data6,      :from => :country
    property :data7,      :from => :zip
    property :data8,      :from => :phone

    def save!
      update_properties(
        PostRequest.new(
          :connection  => Papapi.connection,
          :class_name  => 'Pap_Signup_AffiliateForm',
          :method_name => 'add',
          :arguments   => to_hash
        ).response.fields
      )
      true
    end

    # update properties ignoring those that don't exist
    def update_properties (new_props)
      new_props.each do |key,value|
        send("#{key}=", value) if respond_to?("#{key}=")
      end
    end

    def add_to_commission_group (campaing_id, commission_group_id, opt = {})
      raise 'Affiliate has no userid, make sure it is set first' if userid.nil?
      
      # Default options
      opt[:status] ||= 'A'
      opt[:note]   ||= ''
      
      PostRequest.new(
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

    class << self
      def create! (params)
        a = new(params)
        a.save!
        a
      end
    end
  end
end