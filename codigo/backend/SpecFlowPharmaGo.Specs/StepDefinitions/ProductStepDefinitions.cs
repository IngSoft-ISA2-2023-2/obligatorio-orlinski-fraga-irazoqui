using PharmaGo.BusinessLogic;
using PharmaGo.Domain.Entities;
using PharmaGo.Exceptions;
using PharmaGo.IBusinessLogic;
using PharmaGo.IDataAccess;
using Moq;

namespace SpecFlowPharmaGo.Specs.StepDefinitions
{
    [Binding]
    public class ProductSteps
    {
        private Product _product = new Product();
        private bool _isProductCreated;
        private Pharmacy _pharmacy = new Pharmacy() { Id = 1, Name = "pharmacy", Address = "address", Users = new List<User>() };
        private Mock<IRepository<Product>> _productRepository;
        private Mock<IRepository<Pharmacy>> _pharmacyRepository;
        private Mock<IRepository<Session>> _sessionRepository;
        private Mock<IRepository<User>> _userRepository;
        private IProductManager _productManager;
        private string _mockToken = "c80da9ed-1b41-4768-8e34-b728cae25d2f";

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
            if (decimal.TryParse(price, out decimal parsedPrice))
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
            // Llama al método ValidOrFail para verificar si el producto es válido
            try
            {
                _product.ValidOrFail();
                _isProductCreated = true;
            }
            catch (InvalidResourceException)
            {
                // Maneja la excepción si la validación falla
                _isProductCreated = false;
            }
        }

        [Then("The product is created shoud be (.*)")]
        public void ThenTheProductIsCreatedSuccessfully(string isCreated)
        {
            _userRepository = new Mock<IRepository<User>>();
            _sessionRepository = new Mock<IRepository<Session>>();
            _productRepository = new Mock<IRepository<Product>>();
            _pharmacyRepository = new Mock<IRepository<Pharmacy>>();
            _productManager =  new ProductManager(_productRepository.Object, _pharmacyRepository.Object, _sessionRepository.Object, _userRepository.Object);
            if (bool.TryParse(isCreated, out bool parsedIsCreated))
            {
                _productManager.Create(_product, _mockToken);
                try
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
                catch (InvalidResourceException)
                {
                    if (!parsedIsCreated)
                    {
                        Assert.True(_isProductCreated);
                    }
                    else
                    {
                        Assert.False(_isProductCreated);
                    }
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
            // No se necesita una base de datos real, así que no se realiza ninguna acción aquí
        }
        #endregion

    }
}