import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Product, ProductRequest } from '../interfaces/product';

@Injectable({ providedIn: 'root' })
export class ProductFakeService {

  private productsList: Product[] = [
    {
      code: '12345',
      name: 'Producto 1',
      description: 'Descripción del Producto 1',
      price: 10.99,
      stock: 100,
      pharmacy: {
        id: 1,
        name: 'Farmacia A',
      }
    },
    {
      code: '67890',
      name: 'Producto 2',
      description: 'Descripción del Producto 2',
      price: 15.99,
      stock: 50,
      pharmacy: {
        id: 2,
        name: 'Farmacia A',
      }
    },
  ];

  createProduct(product: ProductRequest): Observable<ProductRequest> {
    // Simula una respuesta exitosa
    return of(product);
  }

  getProductsByUser(): Observable<Product[]> {
    // Devolvemos la lista completa de productos simulada
    return of(this.productsList);
  }

  getProduct(id: number): Observable<Product> {
    return of(this.productsList[0]);
  }

  updateProduct(product: ProductRequest): Observable<ProductRequest> {
    // Simula una respuesta exitosa
    return of(product);
  }
}