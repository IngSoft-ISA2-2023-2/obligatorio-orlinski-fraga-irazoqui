Feature: Product

@mytag
Scenario: Create new product successfully
	Given The product code is $<code>
	And the name is $<name>
	And the description is $<description>
	And the price is $<price>
	When I Click the Create button
	Then The product is created shoud be $<isCreated>
	And A message in the lower part on the screen appears
	And Added to the database
 Examples:  
    | code    | name | description | price | isCreated |
    | 12345 | coca   | Dale sabor a tu vida          | 80    | true      |