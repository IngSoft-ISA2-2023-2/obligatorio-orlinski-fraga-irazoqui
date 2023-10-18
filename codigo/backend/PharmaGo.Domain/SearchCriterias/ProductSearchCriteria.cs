using PharmaGo.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace PharmaGo.Domain.SearchCriterias
{
    public class ProductSearchCriteria
    {
        public string? Name { get; set; }
        public int? PharmacyId { get; set; }

        public Expression<Func<Product, bool>> Criteria(Product product)
        {
            if (!string.IsNullOrEmpty(Name) && PharmacyId != null)
            {
                return p => p.Name == product.Name && p.Deleted == false && p.Pharmacy == product.Pharmacy 
                            && p.Stock > 0;
            }
            else if (string.IsNullOrEmpty(Name) && PharmacyId != null)
            {
                return p => p.Pharmacy == product.Pharmacy && p.Deleted == false && p.Stock > 0;
            }
            else if (!string.IsNullOrEmpty(Name) && PharmacyId == null)
            {
                return p => p.Name == product.Name && p.Deleted == false && p.Stock > 0;
            }
            else
            {
                return p => p.Name == p.Name && p.Deleted == false && p.Stock > 0;
            }
        }
    }
}
