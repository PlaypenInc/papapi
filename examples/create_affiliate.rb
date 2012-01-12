require 'papapi'
require 'pp'

pap = Papapi::Connection.new(ENV['PAP_URL'], ENV['PAP_USER'], ENV['PAP_PASSWORD'])

affiliate = pap.create_affiliate(
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

pp affiliate.fields