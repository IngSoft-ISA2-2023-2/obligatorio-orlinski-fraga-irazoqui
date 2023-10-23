Feature: Modify product

Scenario: Modify a product successfully
Given An existing product
When I change a $<variable> with the $<value>
And Click the Modify button
Then The product is modified successfully
And A message in the lower part on the screen appears
And Updated in the database
Examples:  
| code    | name | description															  | price | stock  |variable|value| isModified |
| 12345	  | Coca | Dale sabor a tu vida													  | 80    | 10     | name   |coca1|true|
| 12345	  | Coca | Lorem ipsum dolor sit amet consectetur adipiscing elit malesuada vulp. | 80    | 10     | description|Dale sabor a tu vida|true|
| 12345	  | Coca | Dale sabor a tu vida | 80    | 10     | price  |50|true|
| 12345	  | Coca | Dale sabor a tu vida | 80    | 10     | stock  |30|true|
	

Scenario: Invalid product name modifying existing product
Given An existing product
When I change the name to a new name
And Click the Modify button
Then The product is not modified
And A message in the lower part on the screen appears
And Database is not updated
Examples:
| code    | name | description			| price | stock  |variable|value| isModified |
| 12345	  | !$% | Dale sabor a tu vida |  80	|   10	 | 50	| name		| false |
| 12345	  |  | Dale sabor a tu vida |  80	| 10	 | 50	| name		| false |


Scenario: Invalid product description modifying existing product
Given An existing product
When I change a description to a new description
And Click the Modify button
Then The product is not modified
And A message in the lower part on the screen appears
And Database is not updated
Examples:
| code    | name | description			| price | stock  |variable|value| isModified |
| 12345	  | coca | Dale sabor a tu vida |  80	|   10	 | description	| Dale sabor a tu vida| false |
| 12345	  | coca | Dale sabor a tu vida |  80	| 10	 | description	| | false |

Scenario: Invalid product price modifying existing product
Given An existing product
When I change a price to a new price
And Click the Modify button
Then The product is not modified
And A message in the lower part on the screen appears
And Database is not updated
Examples:
| code    | name | description			| price | stock  |variable|value| isModified |
| 12345	  | coca | Dale sabor a tu vida |  80	|   10	 | price	| -10| false |
| 12345	  | coca | Dale sabor a tu vida |  80	| 10	 | price	| abc| false |
| 12345	  | coca | Dale sabor a tu vida |  80	| 10	 | price	| | false |

Scenario: Invalid product stock modifying existing product
Given An existing product
When I change a stock to a new stock
And Click the Modify button
Then The product is not modified
And A message in the lower part on the screen appears
And Database is not updated
Examples:
| code    | name | description			| price | stock  |variable|value| isModified |
| 12345	  | coca | Dale sabor a tu vida |  80	|   10	 | stock	| -5| false |
| 12345	  | coca | Dale sabor a tu vida |  80	| 10	 | stock	| abc| false |
| 12345	  | coca | Dale sabor a tu vida |  80	| 10	 | stock	| | false |

Scenario: Change screen before modifying the product
Given An existing product
When I change name, description and/or price
And Leave the page
Then The product is not modified
And The user is redirected to another page