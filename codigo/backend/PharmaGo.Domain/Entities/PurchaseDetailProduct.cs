using PharmaGo.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PharmaGo.Domain.Entities
{
    public class PurchaseDetailProduct
    {
        public int Id { get; set; }
        public Product Product { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public Pharmacy Pharmacy { get; set; }
        public string Status { get; set; }

        public void Verify()
        {
            if (this.Price < 0) throw new InvalidResourceException("quantity cannot be lower than 0");
            if (this.Quantity > this.Product.Stock) throw new InvalidResourceException("quantity cannot be higher than product stock");
        }
    }
}
