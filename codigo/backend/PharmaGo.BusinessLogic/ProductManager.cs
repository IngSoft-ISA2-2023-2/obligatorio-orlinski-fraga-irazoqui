using PharmaGo.Domain.Entities;
using PharmaGo.Exceptions;
using PharmaGo.IBusinessLogic;
using PharmaGo.IDataAccess;

namespace PharmaGo.BusinessLogic
{
    public class ProductManager : IProductManager
    {
        private readonly IRepository<Product> _productRepository;
        private readonly IRepository<Pharmacy> _pharmacyRepository;
        private readonly IRepository<Session> _sessionRepository;
        private readonly IRepository<User> _userRepository;

        public ProductManager(IRepository<Product> productRepo,
                           IRepository<Pharmacy> pharmacyRepository,
                           IRepository<Session> sessionRespository,
                           IRepository<User> userRespository)
        {
            _productRepository = productRepo;
            _pharmacyRepository = pharmacyRepository;
            _sessionRepository = sessionRespository;
            _userRepository = userRespository;
        }

        public Product GetById(int id)
        {
            Product retrievedProduct = _productRepository.GetOneByExpression(p => p.Id == id);
            if (retrievedProduct == null)
            {
                throw new ResourceNotFoundException("The product does not exist.");
            }
            return retrievedProduct;
        }

        public Product Create(Product product, string token)
        {
            if (product == null)
            {
                throw new ResourceNotFoundException("Please create a product before inserting it.");
            }

            var guidToken = new Guid(token);
            Session session = _sessionRepository.GetOneByExpression(s => s.Token == guidToken);
            var userId = session.UserId;
            User user = _userRepository.GetOneDetailByExpression(u => u.Id == userId);


            Pharmacy pharmacyOfProduct = _pharmacyRepository.GetOneByExpression(p => p.Name == user.Pharmacy.Name);
            if (pharmacyOfProduct == null)
            {
                throw new ResourceNotFoundException("The pharmacy of the product does not exist.");
            }
            product.Pharmacy = pharmacyOfProduct;
            product.ValidOrFail();

            if (_productRepository.Exists(p => p.Code == product.Code && p.Pharmacy.Name == pharmacyOfProduct.Name))
            {
                throw new InvalidResourceException("The product already exists in that pharmacy.");
            }

            product.Pharmacy.Id = pharmacyOfProduct.Id;
            _productRepository.InsertOne(product);
            _productRepository.Save();
            return product;
        }

        public void Delete(Product productToDelete, string token) 
        {
            Product product = _productRepository.GetOneDetailByExpression(p => 
                String.Equals(productToDelete.Code, p.Code)
                && productToDelete.Pharmacy.Id == p.Pharmacy.Id);
            if (product is null) 
                throw new ResourceNotFoundException("The product does not exist");
            this._productRepository.DeleteOne(product);
        }
    }
}
