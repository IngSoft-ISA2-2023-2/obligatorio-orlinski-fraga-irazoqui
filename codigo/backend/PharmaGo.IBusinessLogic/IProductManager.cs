using PharmaGo.Domain.Entities;
using System.Linq.Expressions;

namespace PharmaGo.IBusinessLogic
{
    public interface IProductManager
    {
        Product Create(Product product, string token);
        void Delete(Product productToDelete, string mockToken);
        IEnumerable<Product> GetAll(Expression<Func<Product, bool>> criteria);
    }
}
