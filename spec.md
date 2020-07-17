 Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship [*My example: user has many recipes, a category has many recipes, recipe has many comments]

- [x] Include at least one belongs_to relationship [*My examples: A recipe belongs to a user, recipe belongs to a category, comment belongs to a user, comment belongs to a recipe]

- [x] Include at least two has_many through relationships [*My example: category has many users through recipes, a recipe has many users thru comments, a user has many recipe_comments thru comments (source: recipe)]

- [X] Include at least one many-to-many relationship [*My example: A recipe has many comments thru users, a user has many comments thru recipes]

- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user [*My example: recipes have many comments through users, users submit content as a comment attribute]

- [X] Include reasonable validations for simple model objects [*My example: valiations exist in each model for either user signup or for attribute content presence and 'length']

- [X] Include a class level ActiveRecord scope method [*My example: User.most_recipes URL: /users/most_recipes, returns top most active users (in regards to posting recipes)]

- [X] Include signup [*My example: manually coded user controller/routes]

- [X] Include login [*My example: manually coded user controller/routes]

- [X] Include logout [*My example: manually coded user controller/routes]

- [X] Include third party signup/login [*My example: OmniAuth]

- [X]  Include nested resource show or index [*My example: users/2/recipes]

- [X] Include nested resource "new" form [*My example: recipes/1/comments/new]

- [X] Include form display of validation errors [*My example: /recipes/new)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate