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
        [Given(@"that I can see a product's details")]
        public void GivenThatICanSeeAProductsDetails()
        {
            throw new PendingStepException();
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
