//namespace abxsa.data;

using MasterData as MD from '../db/MasterData.cds';

context Transaction {

    /*@@layout{"layoutInfo":{"x":-329,"y":-113.5}}*/
    entity PurchaseOrder {
        key PURCHASEORDERID : Integer;
        HISTORY         : MD.HistoryT;
        NOTEID          : MD.BusinessKey null;
        PARTNER			: association[1] to MD.Partner { PARTNERID };
        CURRENCY        : MD.CurrencyT;
        GROSSAMOUNT     : MD.AmountT;
        NETAMOUNT       : MD.AmountT;
        TAXAMOUNT       : MD.AmountT;
        LIFECYCLESTATUS : MD.StatusT;
        APPROVALSTATUS  : MD.StatusT;
        CONFIRMSTATUS   : MD.StatusT;
        ORDERINGSTATUS  : MD.StatusT;
        INVOICINGSTATUS : MD.StatusT;
    };

    /*@@layout{"layoutInfo":{"x":-85,"y":-114.5}}*/
    entity PurchaseOrderItems {
    	key HEADER: association[1..1] to PurchaseOrder;
    	key PURCHASEORDERITEM : Integer;
    	PRODUCT: association[1..1] to MD.Product { PRODUCTID };
    	NOTEID : MD.BusinessKey null;
    	CURRENCY : MD.CurrencyT;
    	GROSSAMOUNT     : MD.AmountT;
        NETAMOUNT       : MD.AmountT;
        TAXAMOUNT       : MD.AmountT;
        QUANTITY		: MD.QuantityT;
        QUANTITYUNIT	: MD.UnitT;
        DELIVERYDATE	: DateTime;
    };	

    /*@@layout{"layoutInfo":{"x":-290,"y":-33.5}}*/
    entity SalesOrder {
	    key SALESORDERID: Integer;
	    HISTORY         : MD.HistoryT;
	    NOTEID          : MD.BusinessKey null;
	    PARTNER			: association[1] to MD.Partner { PARTNERID };
	    CURRENCY        : MD.CurrencyT;
	    GROSSAMOUNT     : MD.AmountT;
	    NETAMOUNT       : MD.AmountT;
	    TAXAMOUNT       : MD.AmountT;
	    LIFECYCLESTATUS : MD.StatusT;
	    BILLINGSTATUS	: MD.StatusT;
	    DELIVERYSTATUS  : MD.StatusT;
    };

    /*@@layout{"layoutInfo":{"x":-21,"y":-34.5}}*/
    entity SalesOrderItems {
    	key HEADER: association[1..1] to SalesOrder;
    	key SALESORDERITEM : Integer;
    	PRODUCT			: association[1..1] to MD.Product { PRODUCTID };
		NOTEID			: MD.BusinessKey null;
    	CURRENCY		: MD.CurrencyT;
    	GROSSAMOUNT     : MD.AmountT;
        NETAMOUNT       : MD.AmountT;
        TAXAMOUNT       : MD.AmountT;
        QUANTITY		: MD.QuantityT;
        QUANTITYUNIT	: MD.UnitT;
        DELIVERYDATE	: DateTime;
        ITEMATPSTATUS	: MD.StatusT;
        OPITEMPOS		: Integer;
    };

};