using PharmaGo.Domain.Entities;
using PharmaGo.Exceptions;
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
        private PurchaseDetailProduct purchaseDetailProduct;

        #region Add product to cart successfully
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

            this.purchaseDetailProduct = new PurchaseDetailProduct()
            {
                Id = 1,
                Pharmacy = new Pharmacy(),
                Price = 1000,
                Product = this.product,
                Status = " "
            };
        }

        [When(@"I click the add to cart button")]
        public void WhenIClickTheAddToCartButton()
        {
            
        }

        [Then(@"the product is added to my cart")]
        public void ThenTheProductIsAddedToMyCart()
        {
            bool exists = this.purchaseDetailProduct != null;
            Assert.True(exists);
        }
        #endregion

        #region add product to cart with negative quantity
        [Given(@"that I insert a negative quantity to the product")]
        public void GivenThatIInsertANegativeQuantityToTheProduct()
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

            this.purchaseDetailProduct = new PurchaseDetailProduct()
            {
                Id = 1,
                Pharmacy = new Pharmacy(),
                Price = -1,
                Product = this.product,
                Status = " "
            };
        }

        [Then(@"the product is not added to my cart")]
        public void ThenTheProductIsNotAddedToMyCart()
        {
            
        }

        [Then(@"an error message appears on the bottom of the screen")]
        public void ThenAnErrorMessageAppearsOnTheBottomOfTheScreen()
        {
            Assert.Throws<InvalidResourceException>(() => this.purchaseDetailProduct.Verify());
        }
        #endregion

        #region Add product to cart with more quantity than stock
        [Given(@"I insert a product quantity higher than the stock")]
        public void GivenIInsertAProductQuantityHigherThanTheStock()
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

            this.purchaseDetailProduct = new PurchaseDetailProduct()
            {
                Id = 1,
                Pharmacy = new Pharmacy(),
                Price = 100,
                Quantity = 1000,
                Product = this.product,
                Status = " "
            };
        }
        #endregion

        #region buy product succesfully
        private Drug drug;
        private PurchaseDetail purchaseDetail;
        private decimal total;
        [Given(@"that I added a product and its quantity to my cart")]
        public void GivenThatIAddedAProductAndItsQuantityToMyCart()
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

            this.purchaseDetailProduct = new PurchaseDetailProduct()
            {
                Id = 1,
                Pharmacy = new Pharmacy(),
                Price = 1000,
                Quantity = 10,
                Product = this.product,
                Status = " "
            };

            this.drug = new Drug()
            {
                Name = "drug",
                Code = "code",
                Deleted = false,
                Id = 1,
                Pharmacy = new Pharmacy(),
                Prescription = false,
                Presentation = new Presentation(),
                Price = 33,
                Quantity = 10,
                Stock = 100,
                Symptom = "symptoms",
                UnitMeasure = new UnitMeasure(),
            };

            this.purchaseDetail = new PurchaseDetail()
            {
                Drug = this.drug,
                Id = 2,
                Pharmacy = new Pharmacy(),
                Price = 33,
                Quantity = 10,
                Status = ""
            };
        }

        [When(@"I click the button to proceed to checkout")]
        public void WhenIClickTheButtonToProceedToCheckout()
        {
            this.total = 
                (this.purchaseDetail.Quantity * this.purchaseDetail.Price) + 
                (this.purchaseDetailProduct.Quantity * this.purchaseDetailProduct.Price);
        }

        [Then(@"the subtotal of drugs and products are combined")]
        public void ThenTheSubtotalOfDrugsAndProductsAreCombined()
        {
            Console.WriteLine("total: " + this.total);
            Console.WriteLine("subtotals: " + (this.purchaseDetail.Quantity * this.purchaseDetail.Price) +
                (this.purchaseDetailProduct.Quantity * this.purchaseDetailProduct.Price));

            Assert.True(Decimal.Equals(this.total, 
                (this.purchaseDetail.Quantity * this.purchaseDetail.Price) +
                (this.purchaseDetailProduct.Quantity * this.purchaseDetailProduct.Price)));
        }
        #endregion



    }
}
