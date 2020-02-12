# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |blog_post|
  Blog.create!(
    title: "Entry post #{blog_post}",
    body: "Cat ipsum dolor sit amet, present belly, scratch hand when stroked.
    Sniff catnip and act crazy sit on human and sleep everywhere, but not in
    my bed yet i vomit in the bed in the middle of the night. Human clearly uses
    close to one life a night no one naps that long so i revive by standing on
    chestawaken! purrrrrr, fall over dead (not really but gets sypathy). Sun bathe crash
    against wall but walk away like nothing happened and love blinks and purr purr purr purr
    yawn and run in circles. Nap all day enslave the hooman play riveting piece on synthesizer keyboard.
    Meow meow mama scoot butt on the rug or chill on the couch table cough furball. Really likes hummus
    you are a captive audience while sitting on the toilet, pet me kitty kitty touch my tail,
    i shred your hand purrrr. Meow in empty rooms lick arm hair do i like standing on litter cuz
    i sits when i have spaces, my cat buddies have no litter i live in luxury cat life eat from dog's
    food hack up furballs Gate keepers of hell lick butt. Caticus cuteicus catto munch salmono intently sniff hand,
    for lie on your belly and purr when you are asleep. This is the day wake up human for food at 4am
    for grass smells good purrrrrr pet me pet me don't pet me eat the rubberband. Munch, munch, chomp,
    chomp nyan fluffness ahh cucumber! or destroy couch as revenge refuse to come home when humans are going to bed;
    stay out all night then yowl like i am dying at 4am. Drink water out of the faucet sun bathe, for purrr purr
    littel cat, little cat purr purr so bird bird bird bird bird bird human why take bird out i could have eaten that
    for meow and walk away. Slap owner's face at 5am until human fills food dish bleghbleghvomit my
    furball really tie the room together, and get video posted to internet for chasing red dot.
    Cats making all the muffins. With tail in the air my cat stared at me he was sipping his tea,
    too yet i like cats because they are fat and fluffy or my water bowl is clean and freshly replenished,
    so i'll drink from the toilet for meowwww for grab pompom in mouth and put in water dish meow and walk away.",
  )
end

puts "10 blog entries created"

5.times do |book|
  Book.create!(
    title: "Book #{book}",
    author: "Author #{book}",
    percent_completed: 80,
  )
end

puts "5 books on current reading list created"

9.times do |item|
  Portfolio.create!(
  title: "Project #{item}",
  subtitle: "description #{item}",
  body: "Cat ipsum dolor sit amet, present belly, scratch hand when stroked.
  Sniff catnip and act crazy sit on human and sleep everywhere, but not in
  my bed yet i vomit in the bed in the middle of the night. Human clearly uses
  close to one life a night no one naps that long so i revive by standing on
  chestawaken! purrrrrr, fall over dead (not really but gets sypathy). Sun bathe crash
  against wall but walk away like nothing happened and love blinks and purr purr purr purr
  yawn and run in circles. Nap all day enslave the hooman play riveting piece on synthesizer keyboard.",
  main_image: "http://placehold.it/600x400",
  thumbnail: "http://placehold.it/350x200",
  )
end

puts "9 portfolio grid examples created"
