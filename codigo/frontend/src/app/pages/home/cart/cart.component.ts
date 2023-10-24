import { Component, OnInit } from '@angular/core';
import { cilCart, cilPlus, cilCompass, cilCheckCircle, cilTrash } from '@coreui/icons';
import { IconSetService } from '@coreui/icons-angular';
import { Drug } from 'src/app/interfaces/drug';
import { StorageManager } from '../../../utils/storage-manager';
import { Router } from '@angular/router';
import { CommonService } from '../../../services/CommonService';
import { Product } from 'src/app/interfaces/product';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  cart: Drug[] = [];
  cartProducts: Product[] = [];
  totalDrugs: number = 0;
  totalProducts: number = 0;
  totalCombined: number = 0;

  constructor(
    public iconSet: IconSetService,
    private storageManager: StorageManager,
    private router: Router,
    private commonService: CommonService) {
    iconSet.icons = { cilCart, cilPlus, cilCompass, cilCheckCircle, cilTrash };
  }

  ngOnInit(): void {
    this.cart = JSON.parse(this.storageManager.getData('cart'));
    this.cartProducts = JSON.parse(this.storageManager.getData('cartProducts'));
    if (!this.cart) {
      this.cart = [];
      this.storageManager.saveData('cart', JSON.stringify(this.cart));
    }
    if (!this.cartProducts) {
      this.cartProducts = [];
      this.storageManager.saveData('cartProducts', JSON.stringify(this.cartProducts));
    }
    this.storageManager.saveData('total', JSON.stringify(0));
    this.updateTotal();
  }

  delete(index: number){
    this.cart = JSON.parse(this.storageManager.getData('cart'));
    this.cart.splice(index, 1);
    this.storageManager.saveData('cart', JSON.stringify(this.cart));
    this.updateTotalDrugs();
    this.updateHeader(this.cart.length);
  }

  deleteProduct(index: number){
    this.cartProducts = JSON.parse(this.storageManager.getData('cartProducts'));
    this.cartProducts.splice(index, 1);
    this.storageManager.saveData('cartProducts', JSON.stringify(this.cartProducts));
    this.updateTotalProducts();
    this.updateHeader(this.cartProducts.length);
  }

  updateTotalDrugs(){
    this.totalDrugs = 0;
    this.cart = JSON.parse(this.storageManager.getData('cart'));
    for(let item of this.cart){
      this.totalDrugs += (item.price * item.quantity);
    }
  }

  updateTotalProducts(){
    this.totalProducts = 0;
    this.cartProducts = JSON.parse(this.storageManager.getData('cartProducts'));
    for(let item of this.cartProducts){
      this.totalProducts += (item.price * item.quantity);
    }
  }

  updateTotal(){
    this.updateTotalDrugs();
    this.updateTotalProducts();
    this.totalCombined = this.totalDrugs + this.totalProducts;
  }

  updateHeader(value: number){
    this.commonService.updateHeaderData(value);
   }

  goToCho(){
    this.storageManager.saveData('totalDrugs', JSON.stringify(this.totalDrugs));
    this.storageManager.saveData('totalProducts', JSON.stringify(this.totalProducts));
    this.storageManager.saveData('totalCombined', JSON.stringify(this.totalCombined));
    this.router.navigate(['/home/cart/cho']);
  }
  
}
