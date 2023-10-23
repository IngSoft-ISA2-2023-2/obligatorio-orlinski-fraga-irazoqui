using PharmaGo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpecFlowPharmaGo.Specs.StepDefinitions
{
    [Binding]
    public class PurchaseProductStepDefinition
    {
        private Product product;
        [Given(@"that I can see a product's details")]
        public void GivenThatICanSeeAProductsDetails()
        {
            this.product = new Product()
            {
                Name = "product Name",
                Code = "CODE",
                Deleted = false,
                Description = "description",
                Id = 1,
                Pharmacy = new Pharmacy(),
                Price = 1000,
                Stock = 100
            };
        }

        [When(@"I click the add to cart button")]
        public void WhenIClickTheAddToCartButton()
        {
            throw new PendingStepException();
        }

        [Then(@"the product is added to my cart")]
        public void ThenTheProductIsAddedToMyCart()
        {
            throw new PendingStepException();
        }

    }
}
