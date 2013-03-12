# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Host.create([{:dns_name => "kc-isfs-acesx02.esx.umkc.edu", :cpu_count => 16,
               :mem_size => 262098.48046875}])
Host.create([{:dns_name => "kc-isfs-acesx03.esx.umkc.edu", :cpu_count => 16,
               :mem_size => 262098.48046875}])
Host.create([{:dns_name => "kc-isfs-acesx04.esx.umkc.edu", :cpu_count => 16,
               :mem_size => 262098.48046875}])
Host.create([{:dns_name => "kc-isfs-acesx06.esx.umkc.edu", :cpu_count => 32,
               :mem_size => 262130.765625}])
Host.create([{:dns_name => "kc-isfs-acesx05.esx.umkc.edu", :cpu_count => 16,
               :mem_size => 262130.765625}])
Host.create([{:dns_name => "kc-isfs-acesx07.esx.umkc.edu", :cpu_count => 8,
               :mem_size => 98294.14453125}])
Host.create([{:dns_name => "kc-isfs-acesx08.esx.umkc.edu", :cpu_count => 8,
               :mem_size => 98294.14453125}])
Host.create([{:dns_name => "kc-isfs-acesx09.esx.umkc.edu", :cpu_count => 8,
               :mem_size => 98294.14453125}])
