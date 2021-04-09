# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shop = Shop.create(name: "MATRIZ", pseudonym: "MATRIZ", address: "Matrizlandia 001 col. La Matrix", city:"Zion")
Employee.create(
        name: "Invitado",
        last_name_1: "",
        last_name_2: "",
        rfc: "rfc",
        address: "",
        phone_home: 0,
        phone_mobile: 0,
        charge: "invitado",
        shop_id: shop.id
    )