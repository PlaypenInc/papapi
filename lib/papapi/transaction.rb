module Papapi
  class Transaction < Hashie::Trash
    property :userid
    property :campaignid
    property :commtypeid
    property :totalcost
    property :dateapproved
    property :dateinserted
    property :rstatus,      :from => :status, :default => 'A'   # Approved
    property :rtype,        :from => :type,   :default => 'S'   # Sale
    property :multiTier,    :default => 'Y'   # Yes

    def save!
      !!request.response
    end

    def response
      request.response
    end

    def request
      PostRequest.new(
        :connection  => Papapi.connection,
        :class_name  => 'Pap_Merchants_Transaction_TransactionsForm',
        :method_name => 'add',        
        :arguments   => to_hash
      )
    end

    class << self
      def create! (params)
        c = new params
        c.save!
        c
      end
    end
  end
end