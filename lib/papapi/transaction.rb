module Papapi
  class Transaction < Model
    set_pap_class 'Pap_Merchants_Transaction_Transactions'

    property :userid
    property :campaignid
    property :commtypeid
    property :totalcost
    property :dateapproved
    property :dateinserted
    property :rstatus,      :from => :status, :default => 'A'   # Approved
    property :rtype,        :from => :type,   :default => 'S'   # Sale
    property :multiTier,    :default => 'Y'   # Yes
  end
end