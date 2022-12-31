import { LightningElement,wire,track,api} from 'lwc';  
 import {refreshApex} from '@salesforce/apex';  
 import getProducts from '@salesforce/apex/ProductUtility.getProductList';  
 import addProductsToOrder from '@salesforce/apex/ProductUtility.addProductsToOrder';  
 const COLS=[  
   {label:'Name',fieldName:'Product2.Name', type:'text'},   
   {label:'Price',fieldName:'UnitPrice', type:'currency'}  
 ];  
 export default class DataTableInLwc extends LightningElement {  
   @api recordId;
   cols=COLS;  
   products;

   @wire(getProducts,{orderId: '$recordId'}) productList (result){
    if(result.data){
      this.products=result.data;
      console.log("productlist:"+result.data);
      console.dir(result.data);
    }
     
   };  

 
   addProducts(){  
    console.log("addProducts"+this.recordId);
     var selectedRecords =  
      this.template.querySelector("lightning-datatable").getSelectedRows();  
      addProductsToOrder({productList: selectedRecords, orderId: this.recordId})  
     .then(result=>{  
       return refreshApex(this.products);  
     })  
     .catch(error=>{  
       alert('Error getting Available products'+JSON.stringify(error));  
     })  
   }  
 }  