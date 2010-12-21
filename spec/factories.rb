Factory.define :user do |user|
  user.name "Example User"
  user.email "example@railstutorial.com"
  user.password "password"
  user.password_confirmation "password"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :recipe do |recipe|
  recipe.title "Broiler Style Nachos"
  recipe.preptime "2"
  recipe.cooktime "2"
  recipe.ingredients "Tortilla chips
  Cheese"
  recipe.directions "Turn your oven on to broil.
  Place a piece of aluminum foil to cover a cookie sheet.
  Spread chips out on the tinfoil, you want them overlapping so the cheese can help them stick together.
  Sprinkle cheese over the chips. You can do as much or as little as you would like.
  Stick the cookie sheet with your nachos into the oven, the rack should make it so your nachos are near the broiler.
  Turn the oven light on.
  With the oven light on keep a close eye on the progress of your nachos, broil in oven until the cheese is melted and bubbling but not so long that the chips have started to burn.
  Take your nachos out of oven (don't forget to turn off the oven :o ).
  You probably don't need to let them cool too much, in fact enjoy them immediately after removing them from the oven to ensure maximum nom nom nomibility"
  recipe.servings "1"
end
