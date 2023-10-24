import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { Product, ProductRequest } from '../interfaces/product';
import { environment } from '../../environments/environment';
import { CommonService } from './CommonService';
import { StorageManager } from '../utils/storage-manager';

@Injectable({ providedIn: 'root' })
export class ProductService {
  private url = environment.apiUrl + '/api/product';

  httpOptions = {
    headers: new HttpHeaders()
      .set('Content-Type', 'application/json')
      .set('Authorization', 'f4522298-a723-4c47-ad43-594f09eeae66')
  };

  constructor(
    private http: HttpClient,
    private commonService: CommonService,
    private storageManager: StorageManager) { }

  getHttpHeaders(): HttpHeaders {
    let login = JSON.parse(this.storageManager.getLogin());
    let token = login ? login.token : "";

    return new HttpHeaders()
      .set('Content-Type', 'application/json')
      .set('Authorization', token);
  }

  /** POST Create Product */
  createProduct(product: ProductRequest): Observable<Product> {
    return this.http.post<Product>(this.url, product, { headers: this.getHttpHeaders() })
      .pipe(
        tap(),
        catchError(this.handleError<Product>('Create Product'))
      );
  }

  getProduct(id: number): Observable<Product> {
    const url = `${this.url}/${id}`;
    return this.http.get<Product>(url, {headers: this.getHttpHeaders() })
    .pipe(
      tap(),
      catchError(this.handleError<Product>(`Get Product id=${id}`))
    );
  }

  getProducts() {
    return this.http.get<Product[]>(this.url, {headers: this.getHttpHeaders() })
      .pipe(
        tap(),
        catchError(this.handleError<Product[]>('Get Products', []))
      );
  }

  updateProduct(product: ProductRequest): Observable<Product> {
    const url = `${this.url}/${product.code}`;
    return this.http.put<Product>(url, product, { headers: this.getHttpHeaders() })
      .pipe(
        tap(),
        catchError(this.handleError<Product>('Update Product'))
      );
  }

  deleteProduct(product: any): Observable<Product>  {
    console.log("product service DELETE")
    console.log(product)
    return this.http.request<Product>('DELETE', this.url, 
    { 
      headers: this.getHttpHeaders(),
      body: {
        Code: product.code,
        Name: product.name,
        Description: product.description,
        Price: product.price,
        PharmacyName: product.pharmacy.name,
      }
    })
      .pipe(
        tap(),
        catchError(this.handleError<Product>('Delete Product'))
      );
  }

  /**
   * Handle Http operation that failed.
   * Let the app continue.
   *
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      // TODO: send the error to remote logging infrastructure
      //console.error(error); // log to console instead

      // TODO: better job of transforming error for user consumption
      this.log(`${operation} failed: ${error.error.message}`);

      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }

  /** Log a DrugService error with the MessageService */
  private log(message: string) {
    this.commonService.updateToastData(message, "danger", "Error");
  }
}
