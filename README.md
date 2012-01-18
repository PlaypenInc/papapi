Post Affiliate Pro API Ruby Client
==================================

Configuration
-------------

    Papapi.configure do |config|
      config.uri  = 'http://example.com/scripts/server.php'
      config.user = 'merchant@example.com'
      config.pass = 'password'
    end

Affiliates
----------

    # Create a new affiliate
    affiliate = Papapi::Affiliate.create!(
      :username  => 'user@example.com',
      :password  => 'password',
      :firstname => 'Tom',
      :lastname  => 'Foolery',
      :url       => 'http://playpen.com/models/tom-foolery',
      :company   => 'Foolery INC',
      :street    => '875 Rodeo Drive',
      :city      => 'Beverly Hills',
      :state     => 'CA',
      :country   => 'US',
      :zip       => '90210',
      :phone     => '3234789181',
      :refid     => 'tom-foolery'
    )
    
    puts affiliate.userid  # userid is set after creation
    
    
    # add affiliate to a commission group    
    affiliate.add_to_commission_group(
      campaign_id,
      commission_group_id,
      :note => 'added by ...'
    )