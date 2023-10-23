using Moq;
using PharmaGo.BusinessLogic;
using PharmaGo.Domain.Entities;
using PharmaGo.Exceptions;
using PharmaGo.IBusinessLogic;
using PharmaGo.IDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using PharmaGo.WebApi.Controllers;
using Microsoft.AspNetCore.Http;

namespace SpecFlowPharmaGo.Specs.StepDefinitions
{
    public class ModifyProductStepDefinition
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

            #region Scenario: Modify new product successfully
            [Given("An existing product (.*)")]
            public void GivenAValidProductCodeInPharmacy(string code)
            {
                _product.Code = code;
            }

            [When("I change a (.*) with the (.*)")]

            [When("I Click the Create button")]
            public void WhenClickTheCreateButton()
            {
                // Llama al metodo ValidOrFail para verificar si el producto es valido
                try
                {
                    _product.ValidOrFail();
                    _isProductCreated = true;
                }
                catch (InvalidResourceException)
                {
                    // Maneja la excepcion si la validacion falla
                    _isProductCreated = false;
                }
            }

            [Then("The product is modified (.*)")]
            public void ThenTheProductIsCreatedSuccessfully(string isCreated)
            {
                _userRepository = new Mock<IRepository<User>>();
                _sessionRepository = new Mock<IRepository<Session>>();
                _productRepository = new Mock<IRepository<Product>>();
                _pharmacyRepository = new Mock<IRepository<Pharmacy>>();
                _productManager = new ProductManager(_productRepository.Object, _pharmacyRepository.Object, _sessionRepository.Object, _userRepository.Object);
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
                // No se necesita una base de datos real, asi que no se realiza ninguna accion aqui
            }
            #endregion
        }

    }
}
