# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Item.destroy_all
Location.destroy_all

Favorite.destroy_all
Comment.destroy_all

User.destroy_all



dc = City.create!(name: "Washington DC", thumbnail: "https://www.foley.com/files/Office/8766eedf-e4b8-42fe-9c37-4f8383686c0d/Presentation/OfficePhoto/washingtondc.jpg", big_pic: "https://worldstrides.com/wp-content/uploads/2015/08/0025_Washington-DC_5730767_Full.jpg")
nashville = City.create!(name: "Nashville", thumbnail: "http://magsonthemove.com/wp-content/uploads/2015/07/10970371685_0194391c51_o.jpg", big_pic: "http://magsonthemove.com/wp-content/uploads/2015/07/10970371685_0194391c51_o.jpg")
arlington = City.create!(name: "Arlington", thumbnail: "https://www.apartmentguide.com/blog/wp-content/uploads/2015/09/Arlington-Virginia-Neighborhoods-A-Guide-Clarendon.jpg", big_pic: "https://www.apartmentguide.com/blog/wp-content/uploads/2015/09/Arlington-Virginia-Neighborhoods-A-Guide-Clarendon.jpg")
alexandria = City.create!(name: "Alexandria", thumbnail: "https://farm4.staticflickr.com/3045/2568607447_85c95e3d5c_z.jpg", big_pic: "http://i.huffpost.com/gen/1562646/images/o-ALEXANDRIA-VIRGINIA-facebook.jpg")
austin = City.create!(name: "Austin", thumbnail: "http://i.imgur.com/xrDtP4t.jpg", big_pic: "http://i.imgur.com/xrDtP4t.jpg")
new_york = City.create!(name: "New York", thumbnail: "https://www.city-journal.org/sites/cj/files/New-York.jpg", big_pic: "https://www.city-journal.org/sites/cj/files/New-York.jpg")
san_fran = City.create!(name: "San Francisco", thumbnail: "http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/1444253482/DG2015-san-francisco.jpg?itok=MdRJm2Zo", big_pic: "http://www.sftravel.com/sites/sftraveldev.prod.acquia-sites.com/files/SanFrancisco_0.jpg")
chicago = City.create!(name: "Chicago", thumbnail: "https://tctechcrunch2011.files.wordpress.com/2015/02/chicago.jpg", big_pic: "https://tctechcrunch2011.files.wordpress.com/2015/02/chicago.jpg")
memphis = City.create!(name: "Memphis", thumbnail: "https://lonelyplanetimages.imgix.net/a/g/hi/t/9340aadc71fd006c3f9b2823a400e772-memphis.jpg?sharp=10&vib=20&w=1200", big_pic: "https://lonelyplanetimages.imgix.net/a/g/hi/t/9340aadc71fd006c3f9b2823a400e772-memphis.jpg?sharp=10&vib=20&w=1200")






mac = Item.create!(name: "Mac & Cheese", img_url: "http://www.sweetrecipeas.com/wp-content/uploads/2013/02/pulledporkmacandcheese1.jpg", city: dc)
brisket = Item.create!(name: "Brisket", img_url: "https://www.charbroil.com/community/wp-content/uploads/2016/06/DSC_0418-resized.jpg", city: dc)
beans = Item.create!(name: "Beans", img_url: "https://fthmb.tqn.com/z_3vtoUf2_Zmvn6H2VMqJ9Xan9o=/2000x1334/filters:no_upscale()/about/baked-beans-g2k-56a8c1fe3df78cf772a05b7a.jpg", city: dc)
pork = Item.create!(name: "Pork", img_url: "https://butimhungry.files.wordpress.com/2011/05/1471.jpg", city: dc)
ribs_nashville = Item.create!(name: "Ribs", img_url: "https://media-cdn.tripadvisor.com/media/photo-s/06/48/48/b7/bbq-pork-spare-ribsmmmmm.jpg", city: nashville)

fed_pig_mac = Location.create!(name: "Federalist Pig", address: "1654 Columbia Rd NW, Washington, DC 20009", item: mac)
sloppy_momma_mac = Location.create!(name: "Sloppy Momma's", address: "1942 11th St NW, Washington, DC 20001", item: mac)
smoke_and_barrel_mac = Location.create!(name: "Smoke & Barrel", address: "2471 18th St NW, Washington, DC 20009", item: mac)
bbq_bus_mac = Location.create!(name: "BBQ Bus", address: "mobile", item: mac)

fed_pig_brisket = Location.create!(name: "Federalist Pig", address: "1654 Columbia Rd NW, Washington, DC 20009", item: brisket)
sloppy_momma_brisket = Location.create!(name: "Sloppy Momma's", address: "1942 11th St NW, Washington, DC 20001", item: brisket)
smoke_and_barrel_brisket = Location.create!(name: "Smoke & Barrel", address: "2471 18th St NW, Washington, DC 20009", item: brisket)
bbq_bus_brisket = Location.create!(name: "BBQ Bus", address: "mobile", item: brisket)

fed_pig_beans = Location.create!(name: "Federalist Pig", address: "1654 Columbia Rd NW, Washington, DC 20009", item: beans)
sloppy_momma_beans = Location.create!(name: "Sloppy Momma's", address: "1942 11th St NW, Washington, DC 20001", item: beans)
smoke_and_barrel_beans = Location.create!(name: "Smoke & Barrel", address: "2471 18th St NW, Washington, DC 20009", item: beans)
bbq_bus_beans = Location.create!(name: "BBQ Bus", address: "mobile", item: beans)

# mac_fed_pig = Tag.create!(item: mac, location: fed_pig)
# mac_sloppy_momma = Tag.create!(item: mac, location: sloppy_momma)
# brisket_fed_pig = Tag.create!(item: brisket, location: fed_pig)
# mac_smoke = Tag.create!(item: mac, location: smoke_and_barrel)
# beans_fed_pig = Tag.create!(item: beans, location: fed_pig)
# beans_sloppy_momma = Tag.create!(item: beans, location: sloppy_momma)
# pork_smoke = Tag.create!(item: pork, location: smoke_and_barrel)
# mac_bus = Tag.create!(item: mac, location: bbq_bus)

#Add Users
mark = User.new
mark.email = 'mark@google.com'
mark.password = 'password'
mark.password_confirmation = 'password'
mark.save!

diego = User.new
diego.email = 'diego@google.com'
diego.password = 'password'
diego.password_confirmation = 'password'
diego.save!

andy = User.new
andy.email = 'andy@google.com'
andy.password = 'password'
andy.password_confirmation = 'password'
andy.save!

sunshine = User.new
sunshine.email = 'sunshine@google.com'
sunshine.password = 'password'
sunshine.password_confirmation = 'password'
sunshine.save!

andrew = User.new
andrew.email = 'andrew@google.com'
andrew.password = 'password'
andrew.password_confirmation = 'password'
andrew.save!

angelo = User.new
angelo.email = 'angelo@google.com'
angelo.password = 'password'
angelo.password_confirmation = 'password'
angelo.save!


fav1 = Favorite.create!(location: fed_pig_mac, user: mark, medal: 2)
fav2 = Favorite.create!(location: sloppy_momma_mac, user: mark, medal: 1)
fav3 = Favorite.create!(location: smoke_and_barrel_mac, user: mark, medal: 3)

fav4 = Favorite.create!(location: fed_pig_mac, user: diego, medal: 2)
fav5 = Favorite.create!(location: sloppy_momma_mac, user: diego, medal: 1)
fav6 = Favorite.create!(location: smoke_and_barrel_mac, user: diego, medal: 3)

fav7 = Favorite.create!(location: fed_pig_mac, user: andy, medal: 2)
fav8 = Favorite.create!(location: sloppy_momma_mac, user: andy, medal: 1)
fav9 = Favorite.create!(location: smoke_and_barrel_mac, user: andy, medal: 3)

fav10 = Favorite.create!(location: fed_pig_mac, user: sunshine, medal: 2)
fav11 = Favorite.create!(location: sloppy_momma_mac, user: sunshine, medal: 1)
fav12 = Favorite.create!(location: smoke_and_barrel_mac, user: sunshine, medal: 3)

fav13 = Favorite.create!(location: fed_pig_mac, user: andrew, medal: 2)
fav14 = Favorite.create!(location: sloppy_momma_mac, user: andrew, medal: 1)
fav15 = Favorite.create!(location: smoke_and_barrel_mac, user: andrew, medal: 3)

fav16 = Favorite.create!(location: fed_pig_mac, user: angelo, medal: 1)
fav17 = Favorite.create!(location: sloppy_momma_mac, user: angelo, medal: 2)
fav18 = Favorite.create!(location: smoke_and_barrel_mac, user: angelo, medal: 3)
