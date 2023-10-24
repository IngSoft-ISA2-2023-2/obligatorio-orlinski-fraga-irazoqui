import { Component, OnInit } from '@angular/core';
import { cilBarcode, cilPencil, cilPaint, cilAlignCenter, cilDollar, cilLibrary, cilLoop1, cilTask, cilShortText } from '@coreui/icons';
import { AbstractControl, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Pharmacy } from '../../../interfaces/pharmacy';
import { ProductService } from '../../../services/product.service';
//import { ProductFakeService } from '../../../services/product-fake.service';
import { ProductRequest } from '../../../interfaces/product';
import { CommonService } from '../../../services/CommonService';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-update-single-product',
  templateUrl: './update-single-product.component.html',
  styleUrls: ['./update-single-product.component.css'],
})
export class UpdateSingleProductComponent implements OnInit {
  form: FormGroup | any;
  pharmacys: Pharmacy[] = [];

  icons = {
    cilBarcode, cilPencil, cilAlignCenter, cilLibrary,
    cilDollar, cilLoop1, cilTask, cilShortText, cilPaint
  };

  constructor(
    private commonService: CommonService,
    private productService: ProductService,
    private route: ActivatedRoute,
    private fb: FormBuilder
  ) {

    this.form = this.fb.group({
      name: new FormControl(),
      code: new FormControl(),
      description: new FormControl(),
      quantity: new FormControl(),
      price: new FormControl(),
      stock: new FormControl(),
    });
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      const productId = params['id'];
      this.productService.getProduct(productId).subscribe((product) => {
        this.form.controls.name.setValue(product.name);
        this.form.controls.description.setValue(product.description);
        this.form.controls.code.setValue(product.code);
        this.form.controls.price.setValue(product.price);
        this.form.controls.stock.setValue(product.stock);
      });
    });
  }

  get name(): AbstractControl {
    return this.form.controls.name;
  }

  get description(): AbstractControl {
    return this.form.controls.description;
  }

  get code(): AbstractControl {
    return this.form.controls.code;
  }

  get price(): AbstractControl {
    return this.form.controls.price;
  }

  get stock(): AbstractControl {
    return this.form.controls.stock;
  }

  updateProduct(): void {
    let name = this.name.value ? this.name.value : "";
    let description = this.description.value ? this.description.value : "";
    let code = this.code.value ? this.code.value : "";
    let price = this.price.value ? this.price.value : 0;
    let stock = this.stock.value ? this.stock.value : 0;

    let productRequest = new ProductRequest(code, name, description, price, "", stock);
    this.productService.updateProduct(productRequest).subscribe((product) => {
      if (product) {
        this.commonService.updateToastData(
          `Success updating "${product.code} - ${product.name}"`,
          'success',
          'Product updated.'
        );
      }
    });

  }
}
