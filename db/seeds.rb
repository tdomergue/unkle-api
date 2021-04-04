# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating Options...'
puts '-----------------------'

Option.create!(
  identifier: 'LT100011758514',
  title: 'Standard Fire and Special Perils Policy',
  description: 'This is one of a kind of property and casualty insurance policy, which is offered by most of the property insurance providers within the country. It offers protection against special perils and fire- related outbreak.
  The owners of a house usually buy this policy or the tenants as the situation may be. A Standard Fire and Special Perils essentially provide cover to home against any loss/damage incurred due to any natural calamity such as earthquake, volcanic eruption, etc man-made calamity, any missile testing operations, overflowing of water from tanks, pipes, and so on.'
)
Option.create!(
  identifier: 'HDIE87652NSIZ9',
  title: 'Public Liability Coverage',
  description: 'A home is a place where you reside and it is obvious that your friends or relatives will visit you.
  On the off chance, there is a possibility that any of the guests or any third-party may encounter any loss or damage caused either to them or the property within the insuredʼs house. Under such circumstances, this house insurance comes at your rescue.'
)
Option.create!(
  identifier: 'NSOZ8623JGE890',
  title: 'Building Structure and Home Insurance',
  description: 'This house insurance policy offers protection to the structure of your home from any hazard or perils. Besides, it also provides a cover against any damage caused to the permanent fixings of the home such as fitting in the kitchen, washrooms, ceilings and so forth.
  Of course, there are houses, which have garages or rooms/shed on the outdoor premises. This type of property insurance also provides extended cover to such structures as well.'
)
Option.create!(
  identifier: 'GDUE86492JHE6V',
  title: 'Burglary and Theft',
  description: 'In case of any robbery or theft that happens in the insured house causing damage to the contents present in the house, this house insurance policy provides cover for the equivalent.'
)
Option.create!(
  identifier: 'GUYEN76549NHRSI',
  title: 'Personal Accident',
  description: 'This house insurance protects you and your family. In an unfortunate event such as an accident or any physical injury incurred anywhere across the globe, which led to a permanent disablement or demise of the insured person then the compensation for the same shall be provided.'
)
Option.create!(
  identifier: 'GUNSI8720JEUS4',
  title: 'Contents Insurance',
  description: 'Remember, buying this house insurance assures that not just the house beside every content present in the home is valuable and it protects the goods from any damage or loss under perilous situations like fire, theft, and so on.
  Right from the refrigerator, television sets to any important document are covered within this house insurance policy. When the interior of your house is destroyed due to mishap such as flood or has been burnt to ashes under a fire outbreak this house insurance will provide you with a cover.'
)
Option.create!(
  identifier: 'HDUEZ8632KOE94',
  title: 'Landlord Insurance',
  description: 'If you are a landlord, you need to maintain the building/flat and its structure. It is a big responsibility.
  Besides, a standard building insurance policy is generally not designed catering the interest of a landlord. So having this house insurance policy is necessary, as it will protect you from any loss of rent or public liability.'
)
Option.create!(
  identifier: 'HUSR872043NUOS',
  title: 'Tenant Insurance',
  description: 'If you are, tenant it means that you might be residing in a rented flat or house. Therefore, if you are a tenant, opt for choosing a cover for the content that belongs to you.
  This house insurance is a necessary buy for every tenant.'
)

puts "Seeds finished!"
puts "#{Option.count} options available in the DB!" 
puts "----------------------------------------------"
