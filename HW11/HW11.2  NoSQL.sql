# HW11 NoSQL
# HW11.1

HSET ipaddr 127.0.0.1 1

# HW11.2
SET Serj mail@mail.ru
SET mail@mail Serj
GET Serj
GET mail@mail.ru

# HW11.3
db.shop.insert({category: 'Процессоры'})
db.shop.insert({category: 'Материнские платы'})

db.shop.update({category: 'Процессоры'}, {$set: { products:['Intel Core i3-8100', 'Intel Core i5-7400', 'AMD FX-8320E'] }})
db.shop.update({category: 'Материнские платы'}, {$set: { products:['Asus Rog Maximum', 'Gigabate h310m', 'MSI B250m'] }})
