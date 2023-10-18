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