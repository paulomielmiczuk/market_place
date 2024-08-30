require "open-uri"

puts "destroying all users"
User.destroy_all

puts "creating users..."

user1 = User.create!(email: "darth@gmail.com", password: "123456", name: 'Darth Vader')
user2 = User.create!(email: "han@gmail.com", password: "123456", name: 'Han Solo')
user3 = User.create!(email: "luke@gmail.com", password: "123456", name: 'Luke Skywalker')
user4 = User.create!(email: "yoda@gmail.com", password: "123456", name: 'Master Yoda')
user5 = User.create!(email: "r2d2@gmail.com", password: "123456", name: 'R2-D2')
user6 = User.create!(email: "c3po@gmail.com", password: "123456", name: 'C-3PO')
User.create!(email: "paulo@gmail.com", password: "123456", name: 'Paulo Mielmiczuk')
User.create!(email: "tomas@gmail.com", password: "123456", name: 'Tomas Vannucchi')
User.create!(email: "thaila@gmail.com", password: "123456", name: 'Thaila Esteves')

puts "users created"

puts "creating places..."

place1 = Place.new(name: "Allianz Parque", location: "R. Palestra Itália, 200 - Água Branca, São Paulo - SP, 05001-200", description: "Localizado no coração de São Paulo, o Allianz Parque é uma excelente opção para quem busca conforto e conveniência durante a estadia na cidade. Com uma classificação de 5 estrelas, este espaço oferece um ambiente moderno e bem equipado, ideal para eventos esportivos e shows. O preço é competitivo, a partir de R$ 1000 por noite.", price: 1000, rating: 5, user: user4)
file1 = URI.open("https://allianzparque.com.br/wp-content/uploads/2023/03/arena6.jpeg")
place1.photo.attach(io: file1, filename: "allianz.png", content_type: "image/png")
place1.save

place2 = Place.new(name: "Itaquerão", location: "Av. Miguel Ignácio Curi, 111 - Vila Carmosina, São Paulo - SP, 08295-005", description: "O Itaquerão oferece preço acessível de R$ 100 por noite. Com uma classificação de 2 estrelas, é uma escolha básica para quem busca funcionalidade e acesso ao metrô Itaquera", price: 100, rating: 2, user: user1)
file2 = URI.open("https://s2-ge.glbimg.com/DtqOQDkLkW_-hmBsaU9XLCNevk4=/0x0:1600x1200/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2023/Y/t/n1KFAWQkSXCqcJb8wAxQ/whatsapp-image-2023-12-18-at-10.11.05.jpeg")
place2.photo.attach(io: file2, filename: "itaquera.png", content_type: "image/png")
place2.save

place3 = Place.new(name: "Morumbi", location: "Praça Roberto Gomes Pedrosa, 1 - Morumbi, São Paulo - SP, 05653-070", description: "O Estádio do Morumbi, com sua classificação de 1 estrela, pode não ser a melhor escolha para os mais exigentes. Com preços a partir de R$ 200, este local oferece uma experiência que pode deixar a desejar em termos de conforto e comodidade.", price: 200, rating: 1, user: user3)
file3 = URI.open("https://www.estadiodomorumbi.com.br/wp-content/uploads/2017/09/morumbi-shows-6.jpg")
place3.photo.attach(io: file3, filename: "morumbi.png", content_type: "image/png")
place3.save

place4 = Place.new(name: "Canindé", location: "R. Comendador Nestor Pereira, 33 - Canindé, São Paulo - SP, 03034-070", description: "O Estádio do Canindé, de classificação 3 estrelas, oferece uma reserva modesta por R$ 50 por noite. Apesar de ser um local mais antigo, é uma opção econômica para quem busca simplicidade e muita história.", price: 50, rating: 3, user: user2)
file4 = URI.open("https://conteudo.imguol.com.br/c/esporte/5d/2018/09/26/festa-no-estadio-do-caninde-1537988922009_615x300.jpg")
place4.photo.attach(io: file4, filename: "caninde.png", content_type: "image/png")
place4.save

place5 = Place.new(name: "Sesc Pompéia", location: "R. Clélia, 93 - Água Branca, São Paulo - SP, 05042-000", description: "Este lugar recebe uma classificação perfeita de 5 estrelas por sua beleza e comodidades. Com preços acessíveis a partir de R$ 40, é uma excelente escolha para quem deseja explorar a vibrante cultura de São Paulo com conforto.", price: 40, rating: 5, user: user5)
file5 = URI.open("https://f.i.uol.com.br/fotografia/2023/05/22/1684778406646bada67367d_1684778406_3x2_md.jpg")
place5.photo.attach(io: file5, filename: "sescpompeia.png", content_type: "image/png")
place5.save

place6 = Place.new(name: "Sesc Pinheiros", location: "R. Pais Leme, 195 - Pinheiros, São Paulo - SP, 05424-150", description: "O Sesc Pinheiros, apesar de ser considerado 'feio', recebe uma boa classificação de 4 estrelas por sua excelente relação custo-benefício. Com preços a partir de R$ 40 por noite, é uma opção econômica para quem valoriza uma reserva confortável e prática.", price: 40, rating: 4, user: user5)
file6 = URI.open("https://reconhecasaopaulo.com.br/wp-content/uploads/2023/03/reconheca-12-1.png")
place6.photo.attach(io: file6, filename: "sescpinheiros.png", content_type: "image/png")
place6.save

place7 = Place.new(name: "Casa de Francisca", location: "R. Quintino Bocaiúva, 22 - Sé, São Paulo - SP, 01004-010", description: "Localizado na Rua Quintino Bocaiúva, 22, Sé, a Casa de Francisca é um espaço descolado com uma classificação perfeita de 5 estrelas. Com uma decoração única e atmosfera acolhedora, este local oferece uma experiência memorável por R$ 70 por noite.", price: 70, rating: 5, user: user6)
file7 = URI.open("https://offloadmedia.feverup.com/saopaulosecreto.com/wp-content/uploads/2022/06/13090421/casa-de-francisca.jpg")
place7.photo.attach(io: file7, filename: "casadefrancisca.png", content_type: "image/png")
place7.save

place8 = Place.new(name: "Canto da Ema", location: "Av. Brig. Faria Lima, 364 - Pinheiros, São Paulo - SP, 05426-200", description: "O Canto da Ema, na Avenida Brigadeiro Faria Lima, 364, Pinheiros, é um local animado com uma classificação de 3.5 estrelas. Com preços a partir de R$ 30, este espaço é perfeito para quem deseja desfrutar da música ao vivo e da energia contagiante de São Paulo.", price: 30, rating: 3.5, user: user6)
file8 = URI.open("https://cantodaema.com.br/wp-content/uploads/2023/03/Zeca-Baleiro.png")
place8.photo.attach(io: file8, filename: "cantodaema.png", content_type: "image/png")
place8.save

place9 = Place.new(name: "Espaço Unimed", location: "RR. Tagipuru, 795 - Barra Funda, São Paulo - SP, 01156-000", description: " Localizado na Rua Tagipuru, 795, Barra Funda, o Espaço Unimed é uma opção modesta com uma classificação de 2.5 estrelas. Apesar de receber críticas mistas, é uma alternativa acessível a partir de R$ 90 por noite.", price: 90, rating: 2.5, user: user3)
file9 = URI.open("https://www.mundorh.com.br/wp-content/uploads/2022/05/espaco-unimed.jpg")
place9.photo.attach(io: file9, filename: "unimed.png", content_type: "image/png")
place9.save

place10 = Place.new(name: "Teatro Municipal", location: "Praça Ramos de Azevedo, s/n - República, São Paulo - SP, 01037-010", description: "O Teatro Municipal de São Paulo é uma opção excelente com uma classificação de 4.5 estrelas. Com preços a partir de R$ 50 por noite, este local oferece uma experiência cultural única, ideal para os amantes das artes cênicas.", price: 50, rating: 4.5, user: user2)
file10 = URI.open("https://i0.wp.com/notasmusicais.com/wp-content/uploads/2023/08/TMRJ_Daniel-Ebendinger.jpg?fit=929%2C620&ssl=1")
place10.photo.attach(io: file10, filename: "municipal.png", content_type: "image/png")
place10.save

puts "places created"
