# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user  = User.create(name: 'Lewis', photo: 'https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.320.medium.jpg/1647334259839.jpg', bio: 'Driver from UK.')
second_user = User.create(name: 'Verstappen', photo: 'https://www.formula1.com/content/fom-website/en/drivers/max-verstappen/_jcr_content/image.img.640.medium.jpg/1646819045507.jpg', bio: 'Driver from Netherlands.')
third_user = User.create(name: 'Leclerc', photo: 'https://www.formula1.com/content/fom-website/en/drivers/charles-leclerc/_jcr_content/image.img.1920.medium.jpg/1646818893219.jpg', bio: 'Driver from Monaco.')

first_post = Post.create(author: first_user, title: 'My first championship', text: "Mercedes Team Principal Toto Wolff has defended his teams decision to keep Lewis Hamilton on used medium tyres at the end of the Dutch Grand Prix, which saw Hamilton drop from the lead to P4 as George Russell finished second.

The Silver Arrows pace on hard tyres was enough for them to cut into Max Verstappens lead midway through the race, and it seemed that a one-stop strategy from Mercedes could have genuinely threatened the Dutchman bid for victory. However, when the VSC emerged late on in the race  followed by a Safety Car for Valtteri Bottass retirement  Mercedes kept Hamilton out in the lead, prioritising track position, while Verstappen chose to switch to softs for the restart.
")
second_post = Post.create(author: first_user, title: 'My second championship', text: "Mercedes Team Principal Toto Wolff has defended his teams decision to keep Lewis Hamilton on used medium tyres at the end of the Dutch Grand Prix, which saw Hamilton drop from the lead to P4 as George Russell finished second.

The Silver Arrows pace on hard tyres was enough for them to cut into Max Verstappens lead midway through the race, and it seemed that a one-stop strategy from Mercedes could have genuinely threatened the Dutchman bid for victory. However, when the VSC emerged late on in the race  followed by a Safety Car for Valtteri Bottass retirement  Mercedes kept Hamilton out in the lead, prioritising track position, while Verstappen chose to switch to softs for the restart.
")

Comment.create(post: first_post, author: second_user, text: 'This is a horrible story, Lewis!' )
Comment.create(post: first_post, author: third_user, text: 'Love you Lewis!' )
