Feature: PurchaseProduct

A short summary of the feature

Scenario: add product to cart succesfully
	Given that I can see a product's details
	When I click the add to cart button
	Then the product is added to my cart

Scenario: Add product to cart with negative quantity
	Given that I insert a negative quantity to the product
	When I click the add to cart button
	Then the product is not added to my cart
	And an error message appears on the bottom of the screen

Scenario: Add product to cart with more quantity than stock
	Given I insert a product quantity higher than the stock
	When I click the add to cart button
	Then the product is not added to my cart
	And an error message appears on the bottom of the screen

Scenario: buy product succesfully
	Given that I added a product and its quantity to my cart
	When I click the button to proceed to checkout
	Then the subtotal of drugs and products are combined
