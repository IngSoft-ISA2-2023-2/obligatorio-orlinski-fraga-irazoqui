import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { ProductRequest } from '../interfaces/product';

@Injectable({ providedIn: 'root' })
export class ProductFakeService {

  createProduct(product: ProductRequest): Observable<ProductRequest> {
    // Simula una respuesta exitosa
    return of(product);
  }
}