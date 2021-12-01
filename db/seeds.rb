# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require 'open-uri'
require 'nokogiri'
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroy all recipes"
PlannedRecipe.destroy_all
Recipe.destroy_all
puts "killing current users"
User.destroy_all

url = "https://www.bbcgoodfood.com/search/recipes"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.standard-card-new__article-title').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end

puts "adding admin"
user = User.new(email: 'souschef@gmail.com', username: 'admin', password: '123456')
user.photo.attach(io: File.open('app/assets/images/admin.jpg'), filename: 'admin.jpg', content_type: 'image/jpg')
user.save!
puts "email: souschef@gmail.com, password: 123456"

puts "adding other users"
user = User.new(email: 'tim@gmail.com', username: 'Tim', password: '123456')
user.photo.attach(io: File.open('app/assets/images/tim.jpg'), filename: 'tim.jpg', content_type: 'image/jpg')
user.save!

user = User.new(email: 'kate@gmail.com', username: 'Kate', password: '123456')
user.photo.attach(io: File.open('app/assets/images/kate.jpg'), filename: 'kate.jpg', content_type: 'image/jpg')
user.save!

user = User.new(email: 'frank@gmail.com', username: 'Frank', password: '123456')
user.photo.attach(io: File.open('app/assets/images/frank.jpg'), filename: 'frank.jpg', content_type: 'image/jpg')
user.save!

puts "removing ingredients..."
Ingredient.destroy_all

puts "adding ingredients..."
300.times do
  @ingredient = Ingredient.new(name: Faker::Food.unique.ingredient)
  puts @ingredient.name
  @ingredient.save!
end
puts "Done"

FridgeItem.destroy_all

puts "stocking your fridge..."
item = FridgeItem.new
item.ingredient_id = Ingredient.last.id
item.user_id = User.last.id
item.save!

item = FridgeItem.new
item.ingredient_id = Ingredient.first.id
item.user_id = User.last.id
item.save!

puts "adding some recipes"

# 50.times do
#   @recipe = Recipe.new(
#     name: Faker::Food.unique.dish,
#     description: Faker::Lorem.sentence,
#     creator: User.first,
#     instructions: Faker::Lorem.sentence,
#     cooking_time: rand(60)
#   )

  recipe1 = Recipe.new(
    name: "Steak and kidney pudding",
    description: "Suet pastry filled with tender steak and kidney in a rich gravy - a British classic pudding to be proud of.",
    creator: User.last,
    instructions: "Preheat the oven to 170ºC/350ºF/Gas 3.

        Rinse the kidneys and pat dry with kitchen paper. Cut the kidneys, in half, snip out the white cores and cut the kidneys into roughly 1.5cm/¾in pieces.

        Place the cubes of steak into a large, strong plastic bag and the kidney pieces into another bag. Divide the flour between the two bags, then season, to taste, with salt and freshly ground black pepper. Tie the ends of the bags and shake until the steak and kidneys are thoroughly coated in the seasoned flour.

        Heat two tablespoons of the oil in a large non-stick frying pan and fry the steak, in batches, over a medium heat, adding extra oil as needed, until the steak is well-browned all over. Remove the steak from the frying pan with a slotted spoon and transfer to a flameproof casserole.

        Return the frying pan to the heat and repeat the process with the kidneys, frying on both sides until well-browned. Remove the kidneys from the frying pan with a slotted spoon and transfer to the casserole.

        Return the frying pan to the heat, add the remaining oil, then add the onion. Cook the onion over a low heat, stirring often, for five minutes, or until softened. Stir the cooked onion into the casserole with the beef and kidneys.

        Deglaze the frying pan with the wine, bringing it to the boil while stirring to lift all the browned bits from the bottom of the pan. Pour the mixture immediately over the beef, kidneys and onion.

        Strip the thyme leaves from the stalks and add them to the casserole. Stir in the bay leaf, beef stock and tomato purée.

        Bring the beef mixture to the boil. Remove three ladlefuls of the sauce for gravy and set aside in a small pan to cool. When cooled, set it aside in the fridge for use as gravy.

        Cover the casserole and transfer to the oven to cook for 1½-2 hours, or until the beef is tender (stir the mixture halfway through cooking).

        Return the casserole to the hob and simmer the mixture for 2-3 minutes, or until the sauce is thick enough to coat the back of a spoon. When the sauce is thick enough, remove from the heat and leave to cool.

        Meanwhile, for the suet pastry, put the flour, suet and salt into a large bowl and mix until well combined.

        Stir in enough water to make a soft dough - you'll probably need around 300ml/10½fl oz of water. Turn out the dough onto a floured surface and bring it together to form a ball. Knead the dough lightly, then remove a generous quarter of the dough to make a lid for the pudding and set aside. Roll out the remaining pastry into a rough 5cm/10in circle (the size of an average dinner plate). It should be about 1cm/¼in thick.

        Butter a 1.5 litre/2 pint 12¾fl oz pudding basin and line it with the pastry. The pastry should reach 1cm/¼in above the top of the dish. Press the pastry against the sides of the basin and trim neatly.

        Spoon the steak and kidney mixture into the pastry-lined pudding basin. Brush the rim of the pastry with water. Roll the remaining pastry into a circle just large enough to sit on top of the pudding dish and place it over the filling. Trim into place and press the edges together well to seal.

        Cover the dish with a large circle of baking parchment, with a pleat in the middle to allow for expansion. Cover the parchment with a circle of aluminium foil, again with a pleat. Secure both covers tightly with string. Create a carrying handle by tying the excess string across the top of the basin - this will help you lift the pudding out of the pan after it's cooked.

        Place the pudding onto an upturned saucer or small trivet in a large, deep saucepan and add enough just-boiled water to come halfway up the sides of the basin. Cover the pan with a tight-fitting lid and place on the hob over a medium heat. Steam the pudding in simmering water for 2½ hours, adding more water as necessary.

        When the pudding is cooked through, turn off the heat and carefully lift the basin from the water. Let the pudding stand for five minutes.

        Heat the reserved gravy on the hob, stirring, until the gravy is bubbling and heated through. Strain through a small sieve into a warmed jug.

        Cut the string, foil and paper off the pudding basin. Run a blunt-ended knife around the inside of the pudding basin to loosen the sides of the pudding and invert it onto a deep plate. Serve in generous wedges with hot gravy.",
    cooking_time: 120
  )
  file1 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/steakandkidneypuddin_93128_16x9.jpg')
  recipe1.photo.attach(io: file1, filename: 'rec.png', content_type: 'image/png')
  p recipe1
  recipe1.save!

    recipe2 = Recipe.new(
    name: 'Rump steak with béarnaise sauce and chips',
    description: 'James Martin shows you how to cook a great rump steak with homemade béarnaise sauce and perfect chips. This is the kind of special dinner to break out when you really want to impress.

      Equipment and preparation: You will need a deep fat fryer for this recipe.',
    creator: User.first,
    instructions: 'Heat the vegetable oil in a deep fat fryer to 160C/320F. (CAUTION: Hot oil can be dangerous. Do not leave unattended.)

      For the béarnaise sauce, place the vinegar, white wine, peppercorns and shallot into a small saucepan and bring to the boil. Simmer until the liquid has reduced by half.

      Remove the peppercorns, then pour the mixture into a medium heat-proof bowl. Add the egg yolks to the bowl and whisk well.

      Place the bowl over a pan of simmering water and whisk the eggs together until thickened and light in colour. Gradually add the melted butter, whisking constantly. Season with salt and freshly ground black pepper and add the chopped tarragon leaves.Turn off the heat and leave the bowl over the pan until ready to use.

      For the steak and chips, place the potatoes into the fat fryer, a few at a time, and cook for 2-3 minutes, or until just tender but not coloured. Drain on a plate lined with kitchen paper and turn up the fat fryer to 190C/375F.

      Season the steaks with salt and freshly ground black pepper. Heat a frying pan until hot, add the butter, olive oil and the steaks and fry on one side for two minutes (without moving the steak), or until browned. Turn the steak over and cook for another two minutes, then remove the pan from the heat and leave the steaks to rest.

      Place the semi-cooked chips back into the fat fryer in batches and cook for another 2-3 minutes, or until golden-brown and crispy. Keep warm on a tray in the oven if necessary.

      To serve, carve the steak into thick slices, place onto plates and spoon the béarnaise sauce over. Pile some chips and salad leaves alongside.',
    cooking_time: 30
  )

  file2 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/rump_steak_chips_and_76854_16x9.jpg')
  recipe2.photo.attach(io: file2, filename: 'rec.png', content_type: 'image/png')
  puts recipe2
  recipe2.save!

  recipe3 = Recipe.new(
    name: 'Roast goose',
    description: 'The Hairy Bikers make the best roast goose.

      Their easy and delicious recipe is perfect for Christmas or festive meals. Make their amazing stuffing and gravy recipes which are also included in this recipe for one epic dinner.',
    creator: User.first,
    instructions: 'Preheat the oven to 200C/180C Fan/Gas 6.

      Place the goose on a rack over a large sturdy roasting tin and prick with a skewer a few times down each side just below the wing. Season the goose well with salt and freshly ground black pepper.

      Put the quartered onion and three bay leavers into the goose body cavity and cover the legs with folded triangles of foil. Roast the goose for one hour, then take it out of the oven and put on a board. Carefully drain the fat from the roasting tin into a large heatproof bowl.

      Reduce the oven temperature to 180C/160C Fan/Gas 4.

      Cook the goose for another hour, removing the foil after 30 minutes so the legs can brown. (If your goose is very fatty, you may need to remove it from the oven and drain the fat one more time during the last hour of cooking.)

      To test when the goose is cooked, pierce the thickest part of the thigh with a skewer, then press the skewer against the leg and check the juices that run out. When the goose is cooked, the juices should run clear.

      Remove the goose from the oven and transfer to a warmed serving platter. Cover loosely with foil and a couple of dry tea towels. Leave to rest for 25-30 minutes.

      Increase the oven temperature to 200C/180C Fan/Gas 6.

      Meanwhile, for the stock and stuffing, separate the liver from the rest of the giblets. Pat dry on kitchen paper and cut into small pieces, discarding any sinew or damaged parts. Put in a small bowl, cover and chill until ready to use.

      Put the rest of the giblets into a large saucepan. Add the onion, carrots, celery stick, bay leaves, thyme and season. Pour over 1 litre/1¾ pints water and bring to the boil. Reduce the heat and simmer gently for 1¼ hours. Cover with a lid for the final 30 minutes. Strain through a sieve into a measuring jug.

      For the stuffing, heat two tablespoons of the reserved fat in a large non-stick frying pan and fry the onions for five minutes, or until softened and lightly browned, stirring occasionally. Scatter the apple into the pan with the onion and sprinkle with the sugar. Cook for a further 3-4 minutes, or until lightly carameslised. Add the goose liver and fry for a further 1-2 minutes until browned. Place the mixture into a large bowl and set aside to cool.

      Stir in the breadcrumbs, sausage meat and sage to the onions, apple and liver once cooked. Season with lots of salt and pepper and mix well. Grease a 20cm/8in square shallow baking tin with a little more of the reserved goose fat. Spoon the stuffing mixture into the tin and spread evenly. Cover and chill until ready to bake.

      Place the eating apples alongside the stuffing. Brush the cut-side of each apple with a little more oil. Bake for 20 minutes, or until the stuffing is golden-brown and cooked through.

      For the gravy, hold the roasting tin with a dry tea towel at one end, so all the cooking juices run to the corner. Remove as much of the goose fat as possible.

      Place the roasting tin over a medium heat and stir in the flour until thoroughly combined. Slowly stir in the cider and the goose stock. Bring to the boil, stirring constantly and scraping up the sediment from the bottom of the pan. Pour into a saucepan and return to a simmer, stirring with a whisk to break up any floury lumps. Cook for 4-5 minutes, stirring occasionally then season with plenty of salt and pepper. Strain though a fine sieve into a warmed jug.

      Remove the tea towel and foil from the goose. Place the apples around the goose and garnish with a few sage or bay leaves. Serve the stuffing and gravy with the goose at the table.',
    cooking_time: 150
  )
  file3 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/roast_goose_with_apples_74479_16x9.jpg')
  recipe3.photo.attach(io: file3, filename: 'rec.png', content_type: 'image/png')
  recipe3.save!

  recipe4 = Recipe.new(
    name: 'Sprouts with crispy bacon',
    description: 'Sprouts with crispy bacon and beautiful garlicky cream will lure in the most stubborn of sprouts haters.',
    creator: User.first,
    instructions: 'Cook the Brussels sprouts in a saucepan of boiling salted water for 8-10 minutes. Drain and refresh in a bowl of ice and water. Drain again when the sprouts have cooled.

      Add the bacon lardons to a non-stick frying pan, and fry over a medium heat until crisp.

      Add the cream and crushed garlic to a small pan and bring to the boil.

      Stir the sprouts into the crisp bacon; then stir in the hot cream.

      Season with salt and pepper and serve straightaway.',
    cooking_time: 25
    )

  file4 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/creamedbrusselssprou_84835_16x9.jpg')
  recipe4.photo.attach(io: file4, filename: 'rec.png', content_type: 'image/png')
  recipe4.save!


  recipe5 = Recipe.new(
    name: 'Easy roast potatoes',
    description: 'Not only are these really easy roast potatoes, theyre vegetarian. Roasting in olive oil gives a great flavour. Dont bother using expensive extra virgin olive oil for cooking, though. A blend is fine.',
    creator: User.first,
    instructions: 'Preheat the oven to 220C/200C Fan/Gas 7.


      Peel the potatoes and cut into large chunks. Parboil in boiling salted water for 5 minutes. Drain and toss in the pan to roughen the edges.

      Put a generous tablespoon or so of olive oil or goose fat in a roasting tin and put in oven, until smoking. Carefully take the tin out of the oven and add the potatoes to the hot fat, shaking them about as you do so.

      Put the tin back in the oven and cook for about 1 hour until the roast potatoes are golden and crunchy on the outside and soft in the middle. Turn them over from time to time while they are cooking to make sure they colour on all sides.',
    cooking_time: 100
  )

  file5 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/roastpotatoes_8818_16x9.jpg')
  recipe5.photo.attach(io: file5, filename: 'rec.png', content_type: 'image/png')
  recipe5.save!

  recipe6 = Recipe.new(
    name: 'Maple-roast parsnips',
    description: 'Nigellas easy roast parsnips with a generous glug of maple syrup. A wonderful Christmas dinner accompaniment.',
    creator: User.first,
    instructions: 'Preheat the oven to 200C/180C Fan/Gas 6.

      Peel the parsnips and then halve them crosswise, then halve or quarter each piece lengthwise. Place the parsnips into a roasting tin.

      Pour the oil over the parsnips and mix them well so that the oil covers all of the pieces. Pour the maple syrup over the parsnips and roast for 35 minutes, or until they are tender and golden-brown. To serve place on a clean serving dish.',
    cooking_time: 45
  )

  file6 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/mapleroastparsnips_84758_16x9.jpg')
  recipe6.photo.attach(io: file6, filename: 'rec.png', content_type: 'image/png')
  recipe6.save!

  recipe7 = Recipe.new(
    name: 'Sherry trifle',
    description: 'Traditional trifle recipe couldnt be easier, use ready-made custard and sponge to save time but dont skimp on the sherry! The cream syllabub is super simple too. Perfection!',
    creator: User.first,
    instructions: 'Lay the sponge pieces and biscuits in the base of a deep glass dish. Spoon over the sherry and cognac and leave to soak in for a few minutes.

      Warm the jam in a bowl in the microwave or in a saucepan until it is runny then pour over the soaked sponge and biscuits. Sprinkle the fruit and flaked almonds on top. Pour over the custard.

      To make the syllabub topping, place the sherry, brandy and lemon juice into a bowl and stir in the sugar until it dissolves. Pour in the cream with a pinch of nutmeg. Whisk until it holds its shape. Dont over-whisk, or whisk too vigorously, as the cream may split. Spoon the syllabub over the trifle and refigerate, preferably overnight.

      Just before serving, scatter with the grated orange rind and/or flaked toasted almonds.',
    cooking_time: 50
  )
   file7 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/sherrytrifle_76387_16x9.jpg')
  recipe7.photo.attach(io: file7, filename: 'rec.png', content_type: 'image/png')
  recipe7.save!


  recipe8 = Recipe.new(
    name: 'Christmas pudding',
    description: 'Get motivated in November to make your Christmas pudding to have it mature in time for Christmas.

      Equipment and preparation: You will need a 1.2 litre/2 pint pudding basin, baking paper, foil and kitchen string.',
    creator: User.first,
    instructions: '
      Combine the mixed fruit, prunes, muscovado sugar, rum and stout in a mixing bowl. Stir well to mix, cover and leave for 24 hours to soak.

      After 24 hours, mix the walnuts, almonds, ground almonds, breadcrumbs, flour, butter, spices, cherries and eggs along with the soaked fruit mixture in a large mixing bowl, making sure you include all the soaking liquor from the soaked fruit. Mix well until completely combined (let all the members of the family have a stir and make a wish).

      Cover with cling film and leave to stand in a cool place for 24 hours.

      After 24 hours, grease a 1.2 litre/2 pint pudding basin with butter. Cut a circle of baking paper and place into the bottom of the pudding basin and then grease it with a little more butter. Pack the pudding mixture into the pudding basin, pressing as you add it. Fold a pleat into the middle of a large piece of baking paper and place over the pudding. Cover with a large piece of pleated foil, ensuring the pleats are on top of one another. Secure tightly with kitchen string tied under the lip of the pudding basin.

      Place an upturned saucer into a large saucepan one-quarter full of water. Fold a long piece of foil into quarters lengthways to create a long strip and place the pudding basin in the middle of the strip. Bring the sides of the strip up the sides of the pudding basin and lower into the saucepan. Ensure the water in the saucepan comes one-third of the way up the side of the pudding basin, but nowhere near the top of the basin. Leave the ends of the foil strip hanging over the side to make it easy to remove the pudding later.

      Bring the water to the boil and then reduce the heat to a gentle simmer. Simmer gently for 5-6 hours, topping up the water level as necessary throughout cooking (do not allow the pan to dry out).

      Once the pudding is cooked, remove from the pan and set aside to cool. The pudding can be stored for up to two years in a cool, dry place. To serve, reheat the pudding by steaming again (in the same way) for two hours, or until hot all the way through. Alternatively, remove the foil and reheat in the microwave.',
    cooking_time: 120
  )

  file8 = URI.open('https://images.immediate.co.uk/production/volatile/sites/30/2020/08/light-fruity-christmas-pudding-3b9aeac-e1626189256864.jpg?quality=90&webp=true&resize=300,272')
  recipe8.photo.attach(io: file8, filename: 'rec.png', content_type: 'image/png')
  recipe8.save!


  recipe9 = Recipe.new(
    name: 'Radicchio, chestnut and blue cheese salad',
    description: 'Get motivated in November to make your Christmas pudding to have it mature in time for Christmas.

      Equipment and preparation: You will need a 1.2 litre/2 pint pudding basin, baking paper, foil and kitchen string.',
    creator: User.first,
    instructions: '
      Put 2 teaspoons of lime juice, 2 teaspoons of orange juice, the wholegrain mustard, honey, olive oil, sesame oil and salt in a small jar and shake to mix, or whisk together in a small jug or bowl.

      Put 2 teaspoons of lime juice, 2 teaspoons of orange juice, the wholegrain mustard, honey, olive oil, sesame oil and salt in a small jar and shake to mix, or whisk together in a small jug or bowl.

      Put the radicchio in a large mixing bowl. Pour the dressing over and toss well. Add the chestnuts and most of the blue cheese and toss again, gently but thoroughly, then tip into a serving bowl and sprinkle the remaining blue cheese on top. Put the radicchio in a large mixing bowl. Pour the dressing over and toss well. Add the chestnuts and most of the blue cheese and toss again, gently but thoroughly, then tip into a serving bowl and sprinkle the remaining blue cheese on top.',
    cooking_time: 27
  )

  file9 = URI.open('https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/radicchio_walnut_and_89453_16x9.jpg')
  recipe9.photo.attach(io: file9, filename: 'rec.png', content_type: 'image/png')
  recipe9.save!

  recipe10 = Recipe.new(
    name: 'Classic pigs in blankets',
    description: 'Everybody loves this traditional Christmas side dish and weve got three tasty twists including black pudding, butternut squash and chestnuts – you choose!',
    creator: User.first,
    instructions: '
      STEP 1
        Heat oven to 190C/170C fan/gas 5. Cut the bacon rashers in half. Wrap a piece of bacon around each of the chipolatas.

      STEP 2
        Place on a baking tray and cook for 30-35 mins until golden.',
    cooking_time: 45
  )

  file10 = URI.open('https://images.immediate.co.uk/production/volatile/sites/30/2020/08/pigs-in-blankets-04fc5e2.jpg?quality=90&webp=true&resize=440,400')
  recipe10.photo.attach(io: file10, filename: 'rec.png', content_type: 'image/png')
  recipe10.save!

  # image_url = "https://source.unsplash.com/random?sig=#{rand(1..10)}/&food/800x600"
# end
puts "Enjoy!"

sleep(0.5)

  lambs_kidneys = Ingredient.new(name: "lambs kidneys", unit: "number")
  lambs_kidneys.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = lambs_kidneys.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 3
    recipe_item.save!

  braising_steak = Ingredient.new(name: "braising steak", unit: "g")
  braising_steak.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = braising_steak.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 700
    recipe_item.save!

  plain_flour= Ingredient.new(name: "plain flour", unit: "number")
  plain_flour.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = plain_flour.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 3
    recipe_item.save!

  black_pepper= Ingredient.new(name: "black pepper", unit: "g")
  black_pepper.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = black_pepper.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 2
    recipe_item.save!

  black_pepper= Ingredient.new(name: "black pepper", unit: "g")
  black_pepper.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = black_pepper.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 2
    recipe_item.save!

  salt = Ingredient.new(name: "salt", unit: "g")
  salt.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = salt.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 1
    recipe_item.save!

  sunflower_oil = Ingredient.new(name: "sunflower oil", unit: "ml")
  sunflower_oil.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sunflower_oil.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 3
    recipe_item.save!



  onion = Ingredient.new(name: "onion", unit: "number")
  onion.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = onion.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 1
    recipe_item.save!


  red_wine = Ingredient.new(name: "red wine", unit: "ml")
  red_wine.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = red_wine.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 200
    recipe_item.save!



  thyme = Ingredient.new(name: "thyme", unit: "bunch")
  thyme.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = thyme.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 0.1
    recipe_item.save!


  bay_leaf = Ingredient.new(name: "bay leaf", unit: "number")
  bay_leaf.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = bay_leaf.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 5
    recipe_item.save!

  beef_stock = Ingredient.new(name: "beef stock", unit: "ml")
  beef_stock.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = beef_stock.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 500
    recipe_item.save!


  tomato_puree = Ingredient.new(name: "tomato puree", unit: "g")
  tomato_puree.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = tomato_puree.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 5
    recipe_item.save!

  self_raising_flour = Ingredient.new(name: "self-raising flour", unit: "g")
  self_raising_flour.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = self_raising_flour.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 350
    recipe_item.save!

  suet = Ingredient.new(name: "suet", unit: "g")
  suet.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = suet.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 175
    recipe_item.save!

  butter = Ingredient.new(name: "butter", unit: "g")
  butter.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = butter.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 175
    recipe_item.save!

  beef_meat = Ingredient.new(name: "Beef meat", unit: "grams")
  beef_meat.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = beef_meat.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 300
    recipe_item.save!

  potatoes = Ingredient.new(name: "potatoes", unit: "grams")
  potatoes.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = potatoes.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 400
    recipe_item.save!

  black_pepper = Ingredient.new(name: "black pepper", unit: "grams")
  black_pepper.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = black_pepper.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 1
    recipe_item.save!

  olive_oil = Ingredient.new(name: "olive oil", unit: "ml")
  olive_oil.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = olive_oil.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 0.5
    recipe_item.save!

  mixed_salad_leaves = Ingredient.new(name: "mixed salad leaves", unit: "grams")
  mixed_salad_leaves.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = mixed_salad_leaves.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 150
    recipe_item.save!

  tarragon_vinegar = Ingredient.new(name: "tarragon vinegar", unit: "ml")
  tarragon_vinegar.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = tarragon_vinegar.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 0.5
    recipe_item.save!

  white_wine = Ingredient.new(name: "white wine", unit: "ml")
  white_wine.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = white_wine.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 50
    recipe_item.save!


  white_peppercorns = Ingredient.new(name: "white peppercorns", unit: "g")
  white_peppercorns.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = white_wine.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 2
    recipe_item.save!

  bannana_shallot = Ingredient.new(name: "bannana shallot", unit: "number")
  bannana_shallot.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = bannana_shallot.id
    recipe_item.recipe_id = recipe1.id
    recipe_item.quantity = 1
    recipe_item.save!

  eggs = Ingredient.new(name: "eggs", unit: "number")
  eggs.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = eggs.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 4
    recipe_item.save!

  butter = Ingredient.new(name: "butter", unit: "g")
  butter.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = butter.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 200
    recipe_item.save!

  lemon = Ingredient.new(name: "lemon", unit: "number")
  lemon.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = lemon.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 0.25
    recipe_item.save!

  tarragon = Ingredient.new(name: "tarragon", unit: "g")
  tarragon.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = tarragon.id
    recipe_item.recipe_id = recipe2.id
    recipe_item.quantity = 5
    recipe_item.save!

  goose = Ingredient.new(name: "goose", unit: "kg")
  goose.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = goose.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 5
    recipe_item.save!

  # onion = Ingredient.new(name: "onion", unit: "number")
  # onion.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = onion.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 4
    recipe_item.save!

  # bay_leaf = Ingredient.new(name: "bay leaf", unit: "number")
  # bay_leaf.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = bay_leaf.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 5
    recipe_item.save!

  red_apples = Ingredient.new(name: "red apples", unit: "number")
  red_apples.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = red_apples.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 3
    recipe_item.save!

  goose_giblets = Ingredient.new(name: "red apples", unit: "number")
  goose_giblets.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = red_apples.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 3
    recipe_item.save!


  carrots = Ingredient.new(name: "carrots", unit: "number")
  carrots.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = carrots.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 2
    recipe_item.save!

  celery = Ingredient.new(name: "celery", unit: "number")
  celery.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = celery.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 1
    recipe_item.save!

  # thyme = Ingredient.new(name: "thyme", unit: "bunch")
  # thyme.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = thyme.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 1
    recipe_item.save!

  goose_fat = Ingredient.new(name: "goose fat", unit: "number")
  goose_fat.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = goose_fat.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 1
    recipe_item.save!

  cooking_apple = Ingredient.new(name: "cooking_apple", unit: "number")
  cooking_apple.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = cooking_apple.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 1
    recipe_item.save!

  caster_sugar = Ingredient.new(name: "caster sugar", unit: "g")
  caster_sugar.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = caster_sugar.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 14
    recipe_item.save!

  goose_liver = Ingredient.new(name: "goose liver", unit: "number")
  goose_liver.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = goose_liver.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 1
    recipe_item.save!

  white_breadcrumbs = Ingredient.new(name: "white breadcrumbs", unit: "g")
  white_breadcrumbs.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = white_breadcrumbs.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 100
    recipe_item.save!

  sausage_meat = Ingredient.new(name: "sausage meat", unit: "g")
  sausage_meat.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sausage_meat.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 500
    recipe_item.save!

  sage = Ingredient.new(name: "sage", unit: "leaves")
  sage.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sage.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 4
    recipe_item.save!

  plain_flour = Ingredient.new(name: "plain flour", unit: "g")
  plain_flour.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = plain_flour.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 30
    recipe_item.save!

  giblet_stock = Ingredient.new(name: "giblet stock", unit: "ml")
  giblet_stock.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = giblet_stock.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 300
    recipe_item.save!

  dry_cider = Ingredient.new(name: "dry cider", unit: "ml")
  dry_cider.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = dry_cider.id
    recipe_item.recipe_id = recipe3.id
    recipe_item.quantity = 250
    recipe_item.save!

  brussels_sprouts = Ingredient.new(name: "brussels sprouts", unit: "kg")
  brussels_sprouts.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = brussels_sprouts.id
    recipe_item.recipe_id = recipe4.id
    recipe_item.quantity = 1
    recipe_item.save!

  cured_bacon = Ingredient.new(name: "cured_bacon", unit: "rashers")
  cured_bacon.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = cured_bacon.id
    recipe_item.recipe_id = recipe4.id
    recipe_item.quantity = 8
    recipe_item.save!

  double_cream = Ingredient.new(name: "double cream", unit: "ml")
  double_cream.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = double_cream.id
    recipe_item.recipe_id = recipe4.id
    recipe_item.quantity = 250
    recipe_item.save!

  garlic = Ingredient.new(name: "garlic", unit: "cloves")
  garlic.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = garlic.id
    recipe_item.recipe_id = recipe4.id
    recipe_item.quantity = 250
    recipe_item.save!

  potatoes = Ingredient.new(name: "potatoes", unit: "kg")
  potatoes.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = potatoes.id
    recipe_item.recipe_id = recipe5.id
    recipe_item.quantity = 1
    recipe_item.save!

  plain_flour = Ingredient.new(name: "plain flour", unit: "g")
  plain_flour.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = plain_flour.id
    recipe_item.recipe_id = recipe5.id
    recipe_item.quantity = 30
    recipe_item.save!

  parsnips = Ingredient.new(name: "parsnips", unit: "kg")
  parsnips.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = parsnips.id
    recipe_item.recipe_id = recipe6.id
    recipe_item.quantity = 1
    recipe_item.save!

  vegetable_oil = Ingredient.new(name: "vegetable oil", unit: "ml")
  vegetable_oil.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = vegetable_oil.id
    recipe_item.recipe_id = recipe6.id
    recipe_item.quantity = 125
    recipe_item.save!

  maple_syrup = Ingredient.new(name: "maple syrup", unit: "ml")
  maple_syrup.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = maple_syrup.id
    recipe_item.recipe_id = recipe6.id
    recipe_item.quantity = 80
    recipe_item.save!

  sponge_finger = Ingredient.new(name: "sponge finger", unit: "packet")
  sponge_finger.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sponge_finger.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 1
    recipe_item.save!

  amaretti_biscuits = Ingredient.new(name: "amaretti biscuits", unit: "g")
  amaretti_biscuits.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = amaretti_biscuits.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 150
    recipe_item.save!

  sweet_sherry = Ingredient.new(name: "sweet sherry", unit: "ml")
  sweet_sherry.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sweet_sherry.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 275
    recipe_item.save!

  cognac = Ingredient.new(name: "cognac", unit: "ml")
  cognac.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = cognac.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 30
    recipe_item.save!

  raspberry_jam = Ingredient.new(name: "raspberry jam", unit: "g")
  raspberry_jam.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = raspberry_jam.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 80
    recipe_item.save!

  blackberries = Ingredient.new(name: "blackberries", unit: "g")
  blackberries.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = blackberries.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 450
    recipe_item.save!

  raspberries = Ingredient.new(name: "raspberries", unit: "g")
  raspberries.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = raspberries.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 450
    recipe_item.save!

  custard = Ingredient.new(name: "custard", unit: "ml")
  custard.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = custard.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 600
    recipe_item.save!\

  custard = Ingredient.new(name: "custard", unit: "ml")
  custard.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = custard.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 600
    recipe_item.save!

  brandy = Ingredient.new(name: "brandy", unit: "ml")
  brandy.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = brandy.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 60
    recipe_item.save!

  # lemon = Ingredient.new(name: "lemon", unit: "number")
  # lemon.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = lemon.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 1
    recipe_item.save!

  caster_sugar = Ingredient.new(name: "caster sugar", unit: "g")
  caster_sugar.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = caster_sugar.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 55
    recipe_item.save!

  double_cream = Ingredient.new(name: "double cream", unit: "ml")
  double_cream.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = double_cream.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 425
    recipe_item.save!

  freshly_grated_nutmeg = Ingredient.new(name: "freshly grated nutmeg", unit: "number")
  freshly_grated_nutmeg.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = freshly_grated_nutmeg.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 1
    recipe_item.save!

  orange_zests = Ingredient.new(name: "orange zests", unit: "number")
  orange_zests.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = orange_zests.id
    recipe_item.recipe_id = recipe7.id
    recipe_item.quantity = 2
    recipe_item.save!

  dried_fruit = Ingredient.new(name: "dried_fruit", unit: "g")
  dried_fruit.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = dried_fruit.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 350
    recipe_item.save!

  prunes = Ingredient.new(name: "prunes", unit: "g")
  prunes.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = prunes.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  muscovado_sugar = Ingredient.new(name: "muscovado sugar", unit: "g")
  muscovado_sugar.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = muscovado_sugar.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  dark_rum = Ingredient.new(name: "dark rum", unit: "ml")
  dark_rum.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = dark_rum.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 80
    recipe_item.save!

  stout = Ingredient.new(name: "stout", unit: "ml")
  stout.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = stout.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  chopped_wallnuts = Ingredient.new(name: "chopped wallnuts", unit: "g")
  chopped_wallnuts.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = chopped_wallnuts.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!


  chopped_almonds = Ingredient.new(name: "chopped almonds", unit: "g")
  chopped_almonds.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = chopped_almonds.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  ground_almonds = Ingredient.new(name: "ground almonds", unit: "g")
  ground_almonds.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = ground_almonds.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  white_breadcrumbs = Ingredient.new(name: "white breadcrumbs", unit: "g")
  white_breadcrumbs.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = white_breadcrumbs.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  plain_flour = Ingredient.new(name: "plain flour", unit: "g")
  plain_flour.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = plain_flour.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 50
    recipe_item.save!

  # butter = Ingredient.new(name: "butter", unit: "g")
  # butter.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = butter.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  # freshly_grated_nutmeg = Ingredient.new(name: "plain flour", unit: "number")
  # freshly_grated_nutmeg.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = freshly_grated_nutmeg.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 1
    recipe_item.save!

  ground_cinnamon = Ingredient.new(name: "ground cinnamon", unit: "g")
  ground_cinnamon.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = ground_cinnamon.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 14
    recipe_item.save!

  mixed_spice = Ingredient.new(name: "mixed spice", unit: "g")
  mixed_spice.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = mixed_spice.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 30
    recipe_item.save!

  glace_cherries = Ingredient.new(name: "glace cherries", unit: "g")
  glace_cherries.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = glace_cherries.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 100
    recipe_item.save!

  # eggs = Ingredient.new(name: "eggs", unit: "number")
  # eggs.save!
  # puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = eggs.id
    recipe_item.recipe_id = recipe8.id
    recipe_item.quantity = 3
    recipe_item.save!

  lime = Ingredient.new(name: "lime", unit: "number")
  lime.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = lime.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 1
    recipe_item.save!

  orange = Ingredient.new(name: "orange", unit: "number")
  orange.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = orange.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 1
    recipe_item.save!


  wholegrain_mustard = Ingredient.new(name: "wholegrain mustard", unit: "g")
  wholegrain_mustard.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = wholegrain_mustard.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 14
    recipe_item.save!


  honey = Ingredient.new(name: "honey", unit: "g")
  honey.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = honey.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 15
    recipe_item.save!

  olive_oil = Ingredient.new(name: "olive oil", unit: "ml")
  olive_oil.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = olive_oil.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 15
    recipe_item.save!

  sesame_oil = Ingredient.new(name: "sesame oil", unit: "ml")
  sesame_oil.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sesame_oil.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 15
    recipe_item.save!

  radicchio = Ingredient.new(name: "radicchio", unit: "number")
  radicchio.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = sesame_oil.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 2
    recipe_item.save!

  chestnuts = Ingredient.new(name: "chestnuts", unit: "g")
  chestnuts.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = chestnuts.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 100
    recipe_item.save!

  stilton = Ingredient.new(name: "stilton", unit: "g")
  stilton.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = stilton.id
    recipe_item.recipe_id = recipe9.id
    recipe_item.quantity = 100
    recipe_item.save!

  smoked_streaky_bacon = Ingredient.new(name: "smoked_streaky_bacon", unit: "rashers")
  smoked_streaky_bacon.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = smoked_streaky_bacon.id
    recipe_item.recipe_id = recipe10.id
    recipe_item.quantity = 8
    recipe_item.save!


  chipolatas = Ingredient.new(name: "chipolatas", unit: "number")
  chipolatas.save!
  puts "add some ingredients to recipes"

    recipe_item = RecipeItem.new
    recipe_item.ingredient_id = chipolatas.id
    recipe_item.recipe_id = recipe10.id
    recipe_item.quantity = 16
    recipe_item.save!
# We already have Recipes, We already have ingredients
# So we just need to link those two together for each recipes
