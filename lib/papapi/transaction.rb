module Papapi
  class Transaction < Model
    set_pap_class 'Pap_Merchants_Transaction_Transactions'

    property :userid
    property :campaignid
    property :commtypeid
    property :totalcost
    property :dateapproved
    property :dateinserted
    property :orderid
    property :productid
    property :data1
    property :data2
    property :data3
    property :data4
    property :merchantnote
    property :systemnote
    property :rstatus,      :from => :status, :default => 'P'   # (A)pproved (P)ending
    property :rtype,        :from => :type,   :default => 'S'   # (S)ale
    property :multiTier,    :default => 'Y'   # Yes
  end
end