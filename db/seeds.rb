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

dc = City.create!(name: "DC", img_url: "https://www.foley.com/files/Office/8766eedf-e4b8-42fe-9c37-4f8383686c0d/Presentation/OfficePhoto/washingtondc.jpg")
arlington = City.create!(name: "Arlington", img_url: "https://www.apartmentguide.com/blog/wp-content/uploads/2015/09/Arlington-Virginia-Neighborhoods-A-Guide-Clarendon.jpg")
nashville = City.create!(name: "Nashville", img_url: "http://magsonthemove.com/wp-content/uploads/2015/07/10970371685_0194391c51_o.jpg")

mac = Item.create!(name: "Mac & Cheese", img_url: "http://www.sweetrecipeas.com/wp-content/uploads/2013/02/pulledporkmacandcheese1.jpg", city: dc)
brisket = Item.create!(name: "Brisket", img_url: "https://www.charbroil.com/community/wp-content/uploads/2016/06/DSC_0418-resized.jpg", city: dc)
beans = Item.create!(name: "Beans", img_url: "https://fthmb.tqn.com/z_3vtoUf2_Zmvn6H2VMqJ9Xan9o=/2000x1334/filters:no_upscale()/about/baked-beans-g2k-56a8c1fe3df78cf772a05b7a.jpg", city: dc)
pork = Item.create!(name: "Pork", img_url: "https://butimhungry.files.wordpress.com/2011/05/1471.jpg", city: dc)
ribs_nashville = Item.create!(name: "Ribs", img_url: "https://media-cdn.tripadvisor.com/media/photo-s/06/48/48/b7/bbq-pork-spare-ribsmmmmm.jpg", city: nashville)

fed_pig = Location.create!(name: "Federalist Pig", address: "1654 Columbia Rd NW, Washington, DC 20009")
sloppy_momma = Location.create!(name: "Sloppy Momma's", address: "1942 11th St NW, Washington, DC 20001")
smoke_and_barrel = Location.create!(name: "Smoke & Barrel", address: "2471 18th St NW, Washington, DC 20009")

mac_fed_pig = Tag.create!(item: mac, location: fed_pig)
mac_sloppy_momma = Tag.create!(item: mac, location: sloppy_momma)
brisket_fed_pig = Tag.create!(item: brisket, location: fed_pig)
brisket_smoke = Tag.create!(item: brisket, location: smoke_and_barrel)
beans_fed_pig = Tag.create!(item: beans, location: fed_pig)
beans_sloppy_momma = Tag.create!(item: beans, location: sloppy_momma)
pork_smoke = Tag.create!(item: pork, location: smoke_and_barrel)
