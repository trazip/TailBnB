# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# => https://source.unsplash.com/collection/94971817/672x448
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Destroying everything'
User.destroy_all
Appartment.destroy_all

description = "Profitez d'un séjour au coeur du septième arrondissement dans le quartier le plus prestigieux de Paris et promenez vous à pied jusqu'à la Tour Eiffel, jusqu'aux Champs Elysées ou encore jusqu'à Saint-Germain des Près !

Le logement
L'Hôtel de l'Empereur est un hôtel de charme avec des vues panoramiques imprenables sur le Dôme des Invalides.

A deux pas de la Tour Eiffel, des Invalides et des principaux centres d'intérêts à Paris, c'est au coeur du quartier le plus chic de Paris que vous bénéficiez d'un emplacement exceptionnel entre le Paris touristique et celui des affaires .
Chambre d'environ 17 m²
Equipements: douche, WC, tv écran led, WIFI gratuit, air conditionné en été, coffre-fort, sèche-cheveux et station Ipod.
Pour 1 ou 2 personne(s) uniquement avec un grand lit (180 cm)

Chambre non fumeur.

Si vous avez besoin d'un lit bébé, préférez la Triple.

Le petit-déjeuner est en supplément."

puts 'Creating users'

10.times do
  gender = ['female', 'male'].sample
  if gender == 'female'
    first_name = ['Olivia', 'Emma', 'Ava', 'Sophia', 'Isabella', 'Charlotte', 'Amelia', 'Mia', 'Harper', 'Evelyn']
  else
    first_name = 'Liam Noah Oliver William Elijah James Benjamin Lucas Mason Ethan'.split.sample
  end
  last_name = ['Smith', 'Johnson', 'Williams', 'Brown', 'Johns', 'Miller'].sample
  User.create(first_name: first_name, last_name: last_name, email: "#{first_name}@example.com", password: 'password', password_confirmation: 'password')
end

puts 'Creating Appartment'

10.times do
  title = ['Magnifique appartment', 'Somptueux duplex', 'Petit studio cosy', 'Chambre luxueuse', 'Mansarde historique'].sample
  number = rand(1..50).to_s
  avenue = 'Avenue ' + ['Montaigne', 'des Champs-Elysées', 'de Flandre', 'Parmentier'].sample
  boulevard = 'Boulevard ' + ['Haussmann', 'Raspail', 'Saint-Germain', 'Voltaire', 'Barbès'].sample
  address = "#{number} #{[avenue, boulevard].sample}"
  appartment = Appartment.new(image_url: '', title: title, description: description, address: address, user_id: User.limit(1).order("RANDOM()").ids.join.to_i, active: true, price: rand(50..220))
  image_number = rand(1..19)
  file = URI.open(Dir[File.join(File.dirname(__FILE__), "../app/assets/images/image_#{image_number}.jpg")].first)
  appartment.photo.attach(io: file, filename: 'appartment_image_#{image_number}.jpg', content_type: 'image/jpg')
  appartment.save
end
