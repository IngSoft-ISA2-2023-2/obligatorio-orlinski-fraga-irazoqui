﻿using PharmaGo.Domain.Entities;

namespace PharmaGo.IBusinessLogic
{
    public interface IProductManager
    {
        Product Create(Product product, string token);
        void Delete(Product productToDelete, string mockToken);
    }
}
