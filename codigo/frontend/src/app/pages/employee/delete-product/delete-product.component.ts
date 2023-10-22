import { Component, OnInit } from '@angular/core';
import { cilCheckAlt, cilX } from '@coreui/icons';
import { CommonService } from '../../../services/CommonService';
import { Product } from 'src/app/interfaces/product';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-delete-product',
  templateUrl: './delete-product.component.html',
  styleUrls: ['./delete-product.component.css'],
})
export class DeleteProductComponent implements OnInit {
  products: Product[] = [];
  icons = { cilCheckAlt, cilX };
  targetItem: any = undefined;
  visible = false;
  modalTitle = '';
  modalMessage = '';

  constructor(
    private commonService: CommonService,
    private productService: ProductService
  ) {}

  ngOnInit(): void {
    this.getProducts();
  }

  closeModal(): void {
    this.visible = false;
  }

  getProducts(){
    this.productService.getProducts().subscribe((p: any) => (this.products = p));
  }

  deleteProduct(code: string): void {
    console.log(this.products)
    for (let product of this.products) {
      if (product.code === code) {
        this.targetItem = product;
        break;
      }
    }
    if (this.targetItem) {
      this.modalTitle = 'Delete Product';
      this.modalMessage = `Deleting '${this.targetItem.code} - ${this.targetItem.name}'. Are you sure ?`;
      this.visible = true;
    }
  }
  
  
  saveModal(event: any): void {
    if (event) {
      this.productService.deleteProduct(this.targetItem).subscribe((p: any) => {
        if (p) {
          this.visible = false;
          this.getProducts();
          this.commonService.updateToastData(
            `Success deleting product "${this.targetItem.code} - ${this.targetItem.name}"`,
            'success',
            'Drug deleted.'
          );
        }
      });
    }
  }
  
  
}