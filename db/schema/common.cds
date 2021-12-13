using { sap,Currency, temporal,managed } from '@sap/cds/common';

extend sap.common.Currencies with {
    numcode : Integer;
    exponent : Integer;
    minor : String;
}

context opensap.common {
   aspect  Amount{
       currency : Currency;
   } 
}