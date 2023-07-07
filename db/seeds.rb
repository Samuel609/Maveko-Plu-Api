# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seeds.rb

# Currencies
Currency.create(name: "US Dollar", symbol: "$")
Currency.create(name: "Euro", symbol: "€")
Currency.create(name: "British Pound", symbol: "£")

# Customers
Customer.create(name: "John Doe")
Customer.create(name: "Jane Smith")
Customer.create(name: "Michael Johnson")

# Unit of Measures
UnitOfMeasure.create(name: "Piece", unit: "pc")
UnitOfMeasure.create(name: "Kilogram", unit: "kg")
UnitOfMeasure.create(name: "Meter", unit: "m")

# Suppliers
Supplier.create(name: "Supplier A")
Supplier.create(name: "Supplier B")
Supplier.create(name: "Supplier C")

# Items
Item.create(
  item_code: "ITM001",
  decor_code: "DEC001",
  item_name: "Item 1",
  item_description: "This is item 1",
  image: "item1.jpg",
  dimensions: "10x10x5",
  article_group: "Group A",
  tax_class: "Class A",
  weight: "1 kg",
  base_unit: UnitOfMeasure.first,
  target_unit: UnitOfMeasure.last
)
Item.create(
  item_code: "ITM002",
  decor_code: "DEC002",
  item_name: "Item 2",
  item_description: "This is item 2",
  image: "item2.jpg",
  dimensions: "15x15x8",
  article_group: "Group B",
  tax_class: "Class B",
  weight: "2 kg",
  base_unit: UnitOfMeasure.first,
  target_unit: UnitOfMeasure.last
)
Item.create(
  item_code: "ITM003",
  decor_code: "DEC003",
  item_name: "Item 3",
  item_description: "This is item 3",
  image: "item3.jpg",
  dimensions: "20x20x10",
  article_group: "Group C",
  tax_class: "Class C",
  weight: "3 kg",
  base_unit: UnitOfMeasure.first,
  target_unit: UnitOfMeasure.last
)

# Pricings
Pricing.create(
  price_in_euro: 10,
  old_purchase_price: 8,
  valid_from_old_purchase: Date.today - 30,
  new_purchase_price: 9,
  valid_from_new_purchase: Date.today,
  valid_to_new_purchase: Date.today + 365,
  old_retail_price: 15,
  new_retail_price: 20,
  new_retail_price_valid_from: Date.today,
  new_retail_price_valid_to: Date.today + 365,
  change_in_percentage: 10,
#   currency: Currency.find_by(name: "Euro")
)
Pricing.create(
  price_in_euro: 20,
  old_purchase_price: 15,
  valid_from_old_purchase: Date.today - 30,
  new_purchase_price: 18,
  valid_from_new_purchase: Date.today,
  valid_to_new_purchase: Date.today + 365,
  old_retail_price: 30,
  new_retail_price: 25,
  new_retail_price_valid_from: Date.today,
  new_retail_price_valid_to: Date.today + 365,
  change_in_percentage: 15,
#   currency: Currency.find_by(name: "US Dollar")
)
Pricing.create(
  price_in_euro: 20,
  old_purchase_price: 15,
  valid_from_old_purchase: Date.today - 30,
  new_purchase_price: 18,
  valid_from_new_purchase: Date.today,
  valid_to_new_purchase: Date.today + 365,
  old_retail_price: 30,
  new_retail_price: 25,
  new_retail_price_valid_from: Date.today,
  new_retail_price_valid_to: Date.today + 365,
  change_in_percentage: 15,
  #currency: Currency.find_by(name: "US Dollar")
)

# Supplier Item Pricings
SupplierItemPricing.create(
  status: "Active",
  item: Item.first,
  supplier: Supplier.first,
  pricing: Pricing.first
)

# Main Item Pricings
MainItemPricing.create(
  item: Item.first,
  pricing: Pricing.second
)

# Customer Item Pricings
CustomerItemPricing.create(
  item: Item.first,
  customer: Customer.first,
  pricing: Pricing.third
)