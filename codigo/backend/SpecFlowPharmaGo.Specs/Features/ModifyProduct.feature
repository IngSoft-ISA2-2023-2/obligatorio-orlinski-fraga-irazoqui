Feature: Modify product

Scenario: Modify a product successfully
Given: An existing product
When: I change a name, price stock or description
And: Click the Modify button
Then: The product is modified successfully
And: A message in the lower part on the screen appears
And: Updated in the database
Examples:  
    | code    | name | new name | description | new description | price | new price | stock | new stock | isModified |
    | 12345	  | Coca | Lorem ipsum dolor sit amet co. | Dale sabor a tu vida | Dale sabor a tu vida | 80 | 80 | 10 | 10 | true |
	| 12345	  | Coca | Coca | Dale sabor a tu vida | Lorem ipsum dolor sit amet consectetur adipiscing elit malesuada vulp. | 80 | 80 | 10 | 10 | true |
	| 12345	  | Coca | Coca | Dale sabor a tu vida | Dale sabor a tu vida | 80 | 100 | 10 | 10 | true |
	| 12345	  | Coca | Coca | Dale sabor a tu vida | Dale sabor a tu vida | 80 | 80 | 10 | 30 | true |
	

Scenario: Invalid product name modifying existing product
Given: An existing product
When: I change the product name
And: Click the Modify button
Then: The product is not modified
And: A message in the lower part on the screen appears
And: Database is not updated
Examples:
| code    | name | new name | description | new description | price | new price | stock | new stock | isModified |
    | 12345	  | Coca | Coca | Dale sabor a tu vida | Dale buen sabor a tu vida | 80 | 100 | 10 | 50 | false |

Scenario: Invalid product description modifying existing product
Given: An existing product
When: I change the product description
And: Click the Modify button
Then: The product is not modified
And: A message in the lower part on the screen appears
And: Database is not updated
Examples:
| code    | name | new name | description | new description | price | new price | stock | new stock | isModified |
    | 12345	  | Coca | Coca1 | Dale sabor a tu vida | Dale sabor a tu vida | 80 | 100 | 10 | 50 | false |

Scenario: Invalid product price modifying existing product
Given: An existing product
When: I change the product price
And: Click the Modify button
Then: The product is not modified
And: A message in the lower part on the screen appears
And: Database is not updated
Examples:
| code    | name | new name | description | new description | price | new price | stock | new stock | isModified |
| 12345	  | Coca | Coca1 | Dale sabor a tu vida | Dale buen sabor a tu vida | 80 | -20 | 10 | 20 | false |

Scenario: Invalid product stock modifying existing product
Given: An existing product
When: I change the product stock
And: Click the Modify button
Then: The product is not modified
And: A message in the lower part on the screen appears
And: Database is not updated
Examples:
| code    | name | new name | description | new description | price | new price | stock | new stock | isModified |
| 12345	  | Coca | Coca1 | Dale sabor a tu vida | Dale buen sabor a tu vida | 80 | 50 | 10 | -10 | false |

Scenario: Change screen before modifying the product
Given: An existing product
When: I change name, description and/or price
And: Leave the page
Then: The product is not modified
And: The user is redirected to another page