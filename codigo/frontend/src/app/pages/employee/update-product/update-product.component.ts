import { Component, OnInit } from '@angular/core';
import { cilCheckAlt, cilPencil } from '@coreui/icons';
import { ProductService } from '../../../services/product.service';
//import { ProductFakeService } from '../../../services/product-fake.service';
import { Product } from '../../../interfaces/product';

@Component({
  selector: 'app-update-product',
  templateUrl: './update-product.component.html',
  styleUrls: ['./update-product.component.css'],
})
export class UpdateProductComponent implements OnInit {
  products: Product[] = [];
  icons = { cilCheckAlt, cilPencil };
  targetItem: any = undefined;
  visible = false;
  modalTitle = '';
  modalMessage = '';

  constructor(
    private productService: ProductService
  ) {}

  ngOnInit(): void {
    this.getProductsByUser();
  }

  getProductsByUser() {
    this.productService.getProducts().subscribe((p: any) => (this.products = p));
  }

}
