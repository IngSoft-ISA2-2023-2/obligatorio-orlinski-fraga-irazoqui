export class ProductRequest {
  code: string;
  name: string;
  description: string;
  price: number;
  pharmacyName: string = "";

  constructor(code: string, name: string, description: string, price: number, pharmacyName: string) {
    this.code = code;
    this.name = name;
    this.description = description;
    this.price = price;
    this.pharmacyName = pharmacyName;
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
