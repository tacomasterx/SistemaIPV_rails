# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)Employee.first

Shop.create( name: "MATRIZ", pseudonym: "MATRIZ", address: "Matrizlandia 001 col. La Matrix", city: "Zion"  )
Employee.create(
    name: "Invitado",
    last_name_1: "", 
    last_name_2: "", 
    rfc: "rfc", 
    address: "", 
    phone_home: 0,
    phone_mobile: 0, 
    charge: "invitado", 
    shop_id: 1
)
ProductType.create([
    { name: 'Lápiz' },
    { name: 'Lapicero' },
    { name: 'Borrador' },
    { name: 'Bolígrafo' },
    { name: 'Sacapuntas' }
    ])
ProductStatus.create([
    { name: 'Disponible', managable: 1 },
    { name: 'Retenido', managable: 0 },
    { name: 'Transferido', managable: 0 },
    { name: 'Vendido', managable: 0 }
    ])

    #Test Brolio +

    ProductSubtype.create( name: 'Ninguno', product_type_id: 1)
    Player.create( name: 'Ninguno', linked_to_steroids: false)

Ejemplo.create(sku: "Invitado")		
InventoryItem.create(	original_cost: 10.0, shop_id: 1, product_id: 1, product_status_id: 4, employee_id: 1	)
PaymentDetail.create(	payment: 40.0, sale_id: 1	)
Product.create(
            name: "Sasdawrqwtqw",
            description: "Asdfg",
            unit: "",
            quantity: 1.0,
            weight: 1.0, 
            price_unit: 10.0, 
            profit: 25, 
            price_2: 5.0, 
            price_3: 10.0, 
            price_4: 25.0, 
            price_5: 50.0, 
            brand: "Aasdasdas", 
            sku: 234234252636, 
            created_at: "2021-04-19 19:29:07", 
            updated_at: "2021-04-19 19:29:07", 
            product_type_id: 1, 
            product_subtype_id: 1
            )
SaleSession.create(	employee_id:1, sale_id: 3	)
Sale.create(	amount: 37.5, discount: 6.25, created_at: "2021-04-19 19:30:19", updated_at: "2021-04-19 19:30:49", employee_id: 1, shop_id: 1	)
TestApi.create(	fakeId: 40, title: "enim quo cumque", body: "ut voluptatum aliquid illo tenetur nemo sequi quo ...", userId: 4	)
Transaction.create(	amount: 12.5, created_at: "2021-04-19 19:30:27", updated_at: "2021-04-19 19:30:27", sale_id: 1, inventory_item_id: 1	)
User.create(	email: "taco8918@hotmail.com", employee_id: 1	)