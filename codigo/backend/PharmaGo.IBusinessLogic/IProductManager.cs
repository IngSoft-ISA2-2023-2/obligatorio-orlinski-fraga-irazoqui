using PharmaGo.Domain.Entities;
using System.Linq.Expressions;

namespace PharmaGo.IBusinessLogic
{
    public interface IProductManager
    {
        Product GetById(string code);
        Product Create(Product product, string token);
        Product Update(string code, Product updatedProduct);
        void Delete(Product productToDelete, string mockToken);
        IEnumerable<Product> GetAll(Expression<Func<Product, bool>> criteria);
    }
}
