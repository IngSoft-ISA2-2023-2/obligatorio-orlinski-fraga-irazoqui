Feature: Modify product

Scenario: Modify a product successfully
Given An existing product
When I change a $<variable> with the $<value>
And Click the Modify button
Then The product is modified $<isModified>
And A message in the lower part on the screen appears
And Updated in the database
Examples:  
|variable|value| isModified |
|name   |coca1|true|
|description|Dale sabor a tu vida|true|
|price  |50|true|
|stock  |30|true|
	

Scenario: Invalid product name modifying existing product
Given An existing product
When I change a $<variable> with the $<value>
And Click the Modify button
Then The product is modified $<isModified>
And A message in the lower part on the screen appears
And Database is not updated
Examples:
|variable|value| isModified |
|name| !$% | false |
|name|  | false |


Scenario: Invalid product description modifying existing product
Given An existing product
When I change a $<variable> with the $<value>
And Click the Modify button
Then The product is modified $<isModified>
And A message in the lower part on the screen appears
And Database is not updated
Examples:
|variable		  |value| isModified |
|description	  | !$%| false |
|description	  | | false |

Scenario: Invalid product price modifying existing product
Given An existing product
When I change a $<variable> with the $<value>
And Click the Modify button
Then The product is modified $<isModified>
And A message in the lower part on the screen appears
And Database is not updated
Examples:
|variable |value    | isModified |
| price	  |  -10	| false |
| price	  |  abc	| false |
| price	  |  !$%	| false |

Scenario: Invalid product stock modifying existing product
Given An existing product
When I change a $<variable> with the $<value>
And Click the Modify button
Then The product is modified $<isModified>
And A message in the lower part on the screen appears
And Database is not updated
Examples:
| variable|value| isModified |
| stock	  | -5| false |
| stock	  | abc| false |
| stock	  |  | false |
