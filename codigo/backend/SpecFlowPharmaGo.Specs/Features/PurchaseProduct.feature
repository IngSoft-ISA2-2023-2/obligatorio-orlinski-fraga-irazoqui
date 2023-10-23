Feature: PurchaseProduct

A short summary of the feature

Scenario: add product to cart succesfully
	Given that I can see a product's details
	When I click the add to cart button
	Then the product is added to my cart
