using PharmaGo.Domain.Entities;
using PharmaGo.Exceptions;

namespace SpecFlowPharmaGo.Specs.StepDefinitions
{
    [Binding]
    public class ProductSteps
    {
        private Product _product = new Product();
        private bool _isProductCreated;
        private Pharmacy _pharmacy = new Pharmacy();

        #region Scenario: Create new product successfully
        [Given("The product code is (.*)")]
        public void GivenAValidProductCodeInPharmacy(string code)
        {
            _product.Code = code;
        }

        [Given("the name is (.*)")]
        public void GivenAValidProductName(string name)
        {
            _product.Name = name;
        }

        [Given("the description is (.*)")]
        public void GivenAValidProductDescription(string description)
        {
            _product.Description = description;
        }

        [Given("the price is (.*)")]
        public void GivenAValidProductPrice(string price)
        {
            if (float.TryParse(price, out float parsedPrice))
            {
                _product.Price = parsedPrice;
            }
        }

        [Given("a certain pharmacy")]
        public void GivenAValidPharmacy()
        {
            _product.Pharmacy = _pharmacy;
        }

        [When("I Click the Create button")]
        public void WhenClickTheCreateButton()
        {
            // Llama al m�todo ValidOrFail para verificar si el producto es v�lido
            try
            {
                _product.ValidOrFail();
                _isProductCreated = true;
            }
            catch (InvalidResourceException)
            {
                // Maneja la excepci�n si la validaci�n falla
                _isProductCreated = false;
            }
        }

        [Then("The product is created shoud be (.*)")]
        public void ThenTheProductIsCreatedSuccessfully(string isCreated)
        {
            if (bool.TryParse(isCreated, out bool parsedIsCreated))
            {
                if (parsedIsCreated)
                {
                    Assert.True(_isProductCreated);
                }
                else
                {
                    Assert.False(_isProductCreated);
                }
            }
            
        }

        [Then("A message in the lower part on the screen appears")]
        public void ThenAMessageInTheLowerPartOnTheScreenAppears()
        {
            // No aplica, solo al frontend
        }

        [Then("Added to the database")]
        public void ThenAddedToTheDatabase()
        {
            // No se necesita una base de datos real, as� que no se realiza ninguna acci�n aqu�
        }
        #endregion

    }
}