import { Component, OnInit } from '@angular/core';
import { cilCart, cilPlus, cilCompass } from '@coreui/icons';
import { IconSetService } from '@coreui/icons-angular';
import { Drug } from '../../../interfaces/drug';
import { DrugService } from '../../../services/drug.service';
import { CommonService } from '../../../services/CommonService';
import { StorageManager } from 'src/app/utils/storage-manager';
import { Product } from 'src/app/interfaces/product';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  drugs: Drug[] = [];
  products: Product[]=[];
  cart: Drug[] = [];
  cartProducts: Product[]=[];
  quantity: number = 1
  showProducts: boolean = false;
  visible = false;
  modalTitle = 'Add product to cart';
  modalMessage = '';
  productToBuy: Product;
  
  constructor(
    public iconSet: IconSetService,
    private drugService: DrugService,
    private productService: ProductService,
    private commonService: CommonService,
    private storageManager: StorageManager) {
    iconSet.icons = { cilCart, cilPlus, cilCompass };

    this.commonService.onSearchDataUpdate.subscribe((data: any) => {
      this.drugs = data;
    });

    this.productToBuy = this.products[0];
  }

  ngOnInit(): void {
    this.updateCart();
    this.getDrugs();
    this.getProducts();
    this.storageManager.saveData('total', JSON.stringify(0));
  }

  getDrugs(): void {
    this.drugService.getDrugs()
    .subscribe(drugs => this.drugs = drugs);
  }

  getProducts(): void {
    this.productService.getProducts()
    .subscribe(products => this.products = products);
  }

  updateCart(): void {
    this.cart = JSON.parse(this.storageManager.getData('cart'));
    if (!this.cart) {
      this.cart = [];
      this.storageManager.saveData('cart', JSON.stringify(this.cart));
    }
    this.commonService.updateHeaderData(this.cart.length);
  }

  changeDisplay(): void {
    this.showProducts = !this.showProducts;
  }
  
  AddProductToCart(product: Product): void {
    if (product) {
      this.cartProducts = JSON.parse(this.storageManager.getData('cartProducts'));
      if (!this.cartProducts) {
        this.cartProducts = [];
        this.storageManager.saveData('cartProducts', JSON.stringify(this.cartProducts));
      }
      
      let exist: boolean = false;
      for (let item of this.cartProducts) {
        if (item.code === product.code){
          item.quantity += this.quantity;
          exist = true;
          break;
        }
      }
      if (!exist){
        product.quantity = this.quantity;
        this.cartProducts.push(product);
      }
      this.storageManager.saveData('cartProducts', JSON.stringify(this.cartProducts));
    }
    this.updateHeader(this.cartProducts.length);
    this.visible = false;
  }

  updateHeader(value: number){
    this.commonService.updateHeaderData(value);
  }

  showModal(product: Product): void{
    this.quantity = 1;
    this.visible = true;
    this.productToBuy = product;
  }

  closeModal(): void {
    this.visible = false;
  }
}
