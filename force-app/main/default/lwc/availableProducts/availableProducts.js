 import { LightningElement,wire,track,api} from 'lwc';  
 import {refreshApex} from '@salesforce/apex';  
 import gePriceBookProducts from '@salesforce/apex/availableProductLwc.gePriceBookProducts';  
 import addProductsToOrder from '@salesforce/apex/availableProductLwc.addProductsToOrder';  
 import { ShowToastEvent } from 'lightning/platformShowToastEvent'
 import {publish,MessageContext} from 'lightning/messageService';
 import UPDATE_ORDER_PRODUCT_FILE from '@salesforce/messageChannel/updateOrderProducts__c';
 import invokeService from '@salesforce/apex/MyRestCalloutClass.invokeRestWithoutAuth';
 
 const COLS=[ 
    {label : 'Product Name',fieldName : 'productLink',type : 'url',
        typeAttributes :{
            label : {fieldName : 'Name'},
            target : '_blank'
        }
    },  
    {label:'Price',fieldName:'UnitPrice', type:'currency'}  
 ];  

 export default class DataTableInLwc extends LightningElement {
    @api recordId;
    cols = COLS;  
    products = [];
    isFirstPage = true;
    isLastPage = false;
    currentPage = 1;
    pageSize = 3;

    @api searchKey ='';


    @wire(MessageContext)
    messageContext;
  
    @wire(gePriceBookProducts,{orderId: '$recordId', keyWord : '$searchKey'}) 
    productList (result){
      if(result.data){
        this.products = result.data;
        console.log("productlist:"+result.data);
        console.dir(result.data);
      }
    };

    get paginatedData(){
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.products.slice(start,end);
    }

    handlePreviousPage(){
      console.debug('Previous page:'+this.currentPage);
      this.currentPage--;
      this.isFirstPage = (this.currentPage = 1)? true : false;
    }
    
    handleNextPage(){
      console.debug('Next  page:'+this.currentPage);
     this.currentPage++;
     this.isLastPage = (this.currentPage >=  Math.ceil(this.products.length / this.pageSize ))? true : false;
    }
    
    handleOnChange(event){
        this.searchKey = event.target.value;
       /* //this code gets the results from apex, but it does not updates the results in the UI
        let keyW = event.target.value;
        gePriceBookProducts({orderId: '$recordId', keyWord : keyW})
        .then( result => {
          console.log("Search for key:"+keyW+ 'list:'+result);
          this.products = result.data;
        })
        .catch(error => {
          console.log("Error in Search key recordId:"+error);
        });*/
    }

    addProducts(){  
      console.log("addProducts"+this.recordId);
      var selectedRecords =  
        this.template.querySelector("lightning-datatable").getSelectedRows();  
        addProductsToOrder({productList: selectedRecords, orderId: this.recordId})  
        .then(result=>{  
            console.log("addProducts selectedRecords",selectedRecords);
            const payload ={
              productAddedMessage :'Product Added'
          };
          console.log("addProducts2");
          publish(this.messageContext,UPDATE_ORDER_PRODUCT_FILE,payload);
          this.showToast('Products added to the order.', result, 'Success', 'dismissable');
          console.log("addProducts3");
        
      })
      .catch(error=>{
        //alert('Error adding products to the Order'+JSON.stringify(error)); 
        this.showToast('Error Adding products:', error.body.message, 'error', 'dismissable'); 
      })
    }  

    invokeWebService(){
      invokeRestNoAuth()
      .then(result => {
          console.log('REST callout successful. Result:', result);
          // Process the result as needed
      })
      .catch(error => {
          console.error('Error making REST callout:', error);
      });
    }

    showToast(title, message, variant, mode) {
      const event = new ShowToastEvent({
          title: title,
          message: message,
          variant: variant,
          mode: mode
      });
      this.dispatchEvent(event);
    }

 }  