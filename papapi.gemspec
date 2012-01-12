# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "papapi/version"

Gem::Specification.new do |s|
  s.name        = "papapi"
  s.version     = Papapi::VERSION
  s.authors     = ["Gavin Dunne"]
  s.email       = ["gavin@playpen.com"]
  s.homepage    = "http://playpen.com"
  s.summary     = %q{Ruby API for Post Affiliate Pro}
  s.description = %q{Ruby API for Post Affiliate Pro}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
