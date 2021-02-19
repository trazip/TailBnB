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

description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis ac ex sed commodo. Sed est arcu, laoreet sit amet venenatis at, placerat vitae eros. Proin iaculis magna vitae mauris aliquam consequat. Vivamus vel mauris leo. Aliquam sagittis nec nisi a vulputate. Morbi et mi auctor, consectetur augue ac, fermentum enim. Pellentesque in nunc vitae arcu aliquam pulvinar vel a nisl. Aliquam elit dui, blandit at varius in, porttitor ut urna. Donec ac congue arcu. Sed aliquam diam eros, id ultrices leo ullamcorper eu.
Vivamus sollicitudin elit in justo lacinia, imperdiet consectetur nisi rhoncus. Nulla vehicula id ex eu auctor. Praesent imperdiet dui vel lectus tempor faucibus. Nulla rutrum diam non fermentum vehicula. Proin ut mollis diam. Vivamus placerat, purus quis maximus blandit, magna libero vestibulum velit, eu venenatis urna elit non lorem. Aenean commodo, justo et ullamcorper convallis, dolor purus accumsan lectus, sit amet pulvinar est velit sit amet lorem. Curabitur congue varius nunc, nec faucibus est viverra a. Proin non dignissim tellus.
Nam mattis ex ac nunc porta, eget placerat est eleifend. Sed et odio est. Maecenas faucibus varius mi, id ultrices orci pretium eu. In ligula justo, vulputate sit amet est posuere, pulvinar viverra ligula. Cras accumsan massa vitae nisl accumsan, sit amet ornare quam facilisis. Aliquam magna leo, gravida eget est efficitur, euismod tristique sapien. Aenean vitae elit laoreet, dignissim neque nec, pellentesque nisi. Vivamus pretium vehicula dui. Maecenas blandit ante id nibh tristique, et ornare odio auctor. Maecenas lacinia elit et orci rhoncus, ac convallis mi tempor. Donec a nisi odio. Quisque ac ante in nisl blandit fermentum a in ex. Aliquam in purus eu massa tempor venenatis tincidunt a leo. Phasellus eget hendrerit orci.
Aliquam accumsan enim blandit est hendrerit placerat. Sed pellentesque ut nunc nec bibendum. Praesent nec metus gravida, maximus orci quis, gravida lacus. Aenean ex metus, viverra quis tellus posuere, porttitor interdum velit. Fusce quis libero id lacus dapibus commodo. Aliquam sed sem auctor, efficitur dui eu, cursus leo. Donec luctus id purus ut ultrices. Nam nisl tortor, vestibulum at rutrum nec, convallis quis sem. Quisque auctor volutpat orci, nec tincidunt nulla sodales non. In rutrum urna eget mi fringilla, aliquam viverra ipsum blandit. Nunc volutpat, nisl varius ultricies facilisis, erat sem posuere elit, a tempus ex enim a ante. Vestibulum eu erat maximus, lobortis est sed, sagittis risus. Fusce sit amet dapibus ipsum. Praesent sed tempor lectus, eu venenatis est. Maecenas sed ultricies ante.
Integer sed est sit amet purus placerat tempor. Donec sodales turpis at nulla gravida, sit amet consequat nibh tincidunt. Vestibulum ultrices, nisi vel tempus euismod, urna arcu sodales mauris, in mollis nulla quam ac tellus. Curabitur eu mattis nibh. Pellentesque eget metus vestibulum, aliquet magna ac, eleifend elit. Quisque mi massa, sodales non accumsan vel, aliquet ut lacus. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst. Morbi ut accumsan odio. Sed placerat lectus magna, a laoreet metus pharetra lobortis."

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
