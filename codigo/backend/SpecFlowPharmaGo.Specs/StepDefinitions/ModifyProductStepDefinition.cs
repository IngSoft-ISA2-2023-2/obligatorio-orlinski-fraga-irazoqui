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
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace SpecFlowPharmaGo.Specs.StepDefinitions
{
    public class ModifyProductStepDefinition
    {
        [Binding]
        public class ProductSteps
        {
            private Pharmacy _pharmacy = new Pharmacy() { Id = 1, Name = "pharmacy", Address = "address", Users = new List<User>() };
            private Product _productBackup;
            private bool _isProductUpdated;
            private Product _product;
            private Mock<IRepository<Product>> _productRepository;
            private Mock<IRepository<Pharmacy>> _pharmacyRepository;
            private Mock<IRepository<Session>> _sessionRepository;
            private Mock<IRepository<User>> _userRepository;
            private IProductManager _productManager;
            private string _mockToken = "c80da9ed-1b41-4768-8e34-b728cae25d2f";

            #region Scenario: Modify new product successfully

            [Given("An existing product")]
            public void GivenAValidProductCodeInPharmacy()
            {
                _product = new Product() { Code = "1", Name = "Coca", Description = "Dale sabor a tu vida", Price = 50, Stock = 10, Deleted = false, Id = 1, Pharmacy = _pharmacy};
                _productBackup = new Product() { Code = "1", Name = "Coca", Description = "Dale sabor a tu vida", Price = 50, Stock = 10, Deleted = false, Id = 1, Pharmacy = _pharmacy };
            }

            [When("I change a (.*) with the (.*)")]
            public void WhenIChangeTheValue(string variable, string value)
            {
                if(variable=="name")
                {
                    _product.Name = value;
                }
                else if (variable == "description")
                {
                    _product.Description = value;
                }
                else if (variable == "price")
                {
                    if (decimal.TryParse(value, out decimal parsedPrice))
                    {
                        _product.Price = parsedPrice;
                    }
                }
                else if (variable == "stock")
                {
                    if (int.TryParse(value, out int parsedStock))
                    {
                        _product.Stock = parsedStock;
                    }
                }
            }
            [When("Click the Modify button")]
            public void WhenClickTheModifyButton()
            { }

            [Then("The product is modified (.*)")]
            public void ThenTheProductIsUpdatedSuccessfully(string isModified)
            {
                _userRepository = new Mock<IRepository<User>>();
                _sessionRepository = new Mock<IRepository<Session>>();
                _productRepository = new Mock<IRepository<Product>>();
                _pharmacyRepository = new Mock<IRepository<Pharmacy>>();
                _productManager = new ProductManager(_productRepository.Object, _pharmacyRepository.Object, _sessionRepository.Object, _userRepository.Object);
                if (bool.TryParse(isModified, out bool parsedIsUpdated))
                {
                    _productManager.Update(_product.Code, _product);
                    try
                    {
                        if (parsedIsUpdated)
                        {
                            Assert.True(_isProductUpdated);
                        }
                        else
                        {
                            Assert.False(_isProductUpdated);
                        }
                    }
                    catch (InvalidResourceException)
                    {
                        if (!parsedIsUpdated)
                        {
                            Assert.True(_isProductUpdated);
                        }
                        else
                        {
                            Assert.False(_isProductUpdated);
                        }
                    }
                }
            }
            [Then(@"Database is not updated")]
            public void ThenDatabaseIsNotUpdated()
            {
            }
            [Then(@"Updated in the database")]
            public void ThenUpdatedInTheDatabase()
            {
            }
            #endregion
        }

    }
}
