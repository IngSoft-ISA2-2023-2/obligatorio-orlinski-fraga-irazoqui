Feature: Product

Scenario: Create new product successfully
	Given The product code is $<code>
	And the name is $<name>
	And the description is $<description>
	And the price is $<price>
	And a certain pharmacy
	When I Click the Create button
	Then The product is created shoud be $<isCreated>
	And A message in the lower part on the screen appears
	And Added to the database
 Examples:  
    | code    | name | description | price | isCreated |
    | 12345	  | coca   | Dale sabor a tu vida          | 80    | true      |
	| 12345   | Lorem ipsum dolor sit amet co.   | Dale sabor a tu vida          | 80    | true      |
	| 12345   | coca   | Lorem ipsum dolor sit amet consectetur adipiscing elit malesuada vulp.          | 80    | true      |
	| 12345   | coca   | Dale sabor a tu vida          | 80.50    | true      |


Scenario: Error creating new product
	Given The product code is $<code>
	And the name is $<name>
	And the description is $<description>
	And the price is $<price>
	And a certain pharmacy
	When I Click the Create button
	Then The product is created shoud be $<isCreated>
	And A message in the lower part on the screen appears
 Examples:  
    | code    | name | description | price | isCreated |
    | 2		| coca   | Dale sabor a tu vida          | 80    | false	 |
	| a		| coca   | Dale sabor a tu vida          | 80    | false	 |
	| -5	| coca   | Dale sabor a tu vida          | 80    | false     |
	| 123456| coca   | Dale sabor a tu vida          | 80    | false     |
	| @		| coca   | Dale sabor a tu vida          | 80    | false     |
	|		| coca   | Dale sabor a tu vida          | 80    | false     |
	| 12345	| Lorem ipsum dolor sit amet con.   | Dale sabor a tu vida          | 80    | false	 |
	| 12345 | @$&    | Dale sabor a tu vida          | 80    | false	 |
	| 12345 |	     | Dale sabor a tu vida          | 80    | false     |
	| 12345	| coca   | Lorem ipsum dolor sit amet consectetur adipiscing elit accumsan libero.          | 80    | false	 |
	| 12345 | coca   | "$@					         | 80    | false	 |
	| 12345 | coca   |						         | 80    | false     |
	| 12345 | coca   | Dale sabor a tu vida          | -5    | false     |
	| 12345 | coca   | Dale sabor a tu vida          | asd   | false     |
	| 12345 | coca   | Dale sabor a tu vida          | @$%   | false     |
	| 12345 | coca   | Dale sabor a tu vida          |		 | false     |

Scenario: Delete a product succesfully
	Given The product code is $<code>
	When I click the delete button
	Then the product should be deleted from the database
 Examples:  
    | code    |
    | AWXS	  | 

Scenario: Invalid Code deleting a product
	Given The product code is $<code>
	When I click the delete button
	Then The product is not deleted
	And an error message is returned to the employee
 Examples:  
    | code    |
    | 12345	  | 
	| 123456   | 
	| 123457   | 
	| 123458   |

Scenario: A non-employee deleting a product
	Given The product code is $<code>
	When A non-employee user touches a delete button
	Then The product is not deleted
	And an Authorization error message is returned to the employee
 Examples:  
    | code    |
    | 12345	  | 
	| 123456   | 
	| 123457   | 
	| 123458   |

Scenario: Get all drugs
	When I enter the product page
	Then All products are shown to me
