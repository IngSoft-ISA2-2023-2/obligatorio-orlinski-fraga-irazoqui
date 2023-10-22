export class ProductRequest {
  code: string;
  name: string;
  description: string;
  price: number;
  pharmacyName: string;
  stock: number;

  constructor(code: string, name: string, description: string, price: number, pharmacyName: string, stock: number) {
    this.code = code;
    this.name = name;
    this.description = description;
    this.price = price;
    this.pharmacyName = pharmacyName;
    this.stock = stock;
  }
}

export interface Product {
  code: string;
  name: string;
  description: string;
  price: number;
  stock: number;
  pharmacy: {
    id: number;
    name: string;
  };
}
