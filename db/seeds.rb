# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Argument.destroy_all
Agreement.destroy_all
Avatar.destroy_all
User.destroy_all
Discussion.destroy_all

# Create a user
user = User.create( name: 'IsmaelHaddad', email: 'isma.7h@gmail.com', image_url: "https://lh4.googleusercontent.com/-OvEonYfBGHM/AAAAAAAAAAI/AAAAAAAAAAs/X3Zfwb1djn0/s96-c/photo.jpg")

# Create a discussion
discussion = Discussion.create(topicTitle: 'Deberian las motos poder utilizar el carril bus?',
                               topicDescription: 'En muchas ciudades se estan planteando el permitir a las motocicletas circular por los carriles bus, y esto esta despertando mucha controversia entre personas que creen en la facilitación del uso de la motocicleta y en las que proponen la mejoria de los medios de transporte público para una reducción de vehiculos contaminantes.',
                               user: user
                              )

# Create the two avatars of the discussion
Avatar.create( name: 'John Locke', opinion: 'A favor de la utilización del carril bus por las motocicletas.', discussion: discussion, user: user )
Avatar.create( name: 'John Smith', opinion: 'En contra de la utilización del carril bus por las motocicletas. A favor del uso del transporte público.', discussion: discussion, user: user )

# Add arguments on the discussion
Argument.create( num: 1, content: 'Las motos contaminan menos que los coches debido a que: pesan menos y en conseqüencia el consumo de carburante es menor, y ocupan poco espacio y eso permite que se pueda estacionar con facilidad y aportar fluidez en el tráfico. Por ejemplo, en Londres a partir de 2012, se permitió la utilización del carril bus y durante los tres primeros años se noto "una reducción en el tiempo de desplazamiento para los motociclistas y una menor emisión de dioxido de carbono".',
  publish_time: DateTime.now, discussion: discussion, avatar: Avatar.first )
Argument.create( num: 2, content: 'Pero, la utilización de motocicletas en el carril bus entorpece a los autobuses y a veces perjudica la precisión en el horario de estos. Si apostamos por la mejora de los medios de transporte públicos, podremos atraer a mas personas para que se utilizen y asi reducir el numero de vehiculos y en conseqüencia disminuir la contaminación.',
  publish_time: DateTime.now, discussion: discussion, avatar: Avatar.second )
Argument.create( num: 3, content: 'Las motos contaminan menos que los coches debido a que: pesan menos y en conseqüencia el consumo de carburante es menor, y ocupan poco espacio y eso permite que se pueda estacionar con facilidad y aportar fluidez en el tráfico. Por ejemplo, en Londres a partir de 2012, se permitió la utilización del carril bus y durante los tres primeros años se noto "una reducción en el tiempo de desplazamiento para los motociclistas y una menor emisión de dioxido de carbono".',
  publish_time: DateTime.now, discussion: discussion, avatar: Avatar.second )
Argument.create( num: 4, content: 'Pero, la utilización de motocicletas en el carril bus entorpece a los autobuses y a veces perjudica la precisión en el horario de estos. Si apostamos por la mejora de los medios de transporte públicos, podremos atraer a mas personas para que se utilizen y asi reducir el numero de vehiculos y en conseqüencia disminuir la contaminación.',
  publish_time: DateTime.now, discussion: discussion, avatar: Avatar.first )

# Add agreements on the discussion
Agreement.create( content: 'Utilización del carril bus por las motos en diferentes horarios.', isAccepted: true, isAgree: true, discussion: discussion, avatar: Avatar.first )
Agreement.create( content: 'Mejorar transporte público.', isAccepted: false, isAgree: true, discussion: discussion, avatar: Avatar.first )
Agreement.create( content: 'Las motos contaminan menos que los coches.', isAccepted: false, isAgree: false, discussion: discussion, avatar: Avatar.first )
