 Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship [*My example: user has many recipes, a category has many recipes, recipe has many comments]

- [x] Include at least one belongs_to relationship [*My examples: A recipe belongs to a user, recipe belongs to a category, comment belongs to a user, comment belongs to a recipe]

- [x] Include at least two has_many through relationships [*My example: category has many users through recipes, a recipe has many users thru comments, a user has many recipe_comments thru comments (source: recipe)]

- [X] Include at least one many-to-many relationship [*My example: A recipe has many comments thru users, a user has many comments thru recipes]

- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user [recipes have many comments through users, users submit content as a comment attribute]

- [X] Include reasonable validations for simple model objects [*My example: valiations exist in each model for either user signup or for attribute content presence and 'length']

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [ ] Include signup (how e.g. Devise)

- [ ] Include login (how e.g. Devise)

- [ ] Include logout (how e.g. Devise)

- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)

- [ ] Include nested resource show or index (URL e.g. users/2/recipes)

- [ ] Include nested resource "new" form (URL e.g. recipes/1/comments/new)

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate