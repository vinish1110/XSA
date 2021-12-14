using MasterData as MD from '../db/MasterData.cds';
using Transaction as TR from '../db/Transaction.cds';

context CDSViews {

view ![BusinessPartner] as select from MD.Partner{
    PARTNERID as BPid,
    PARTNERROLE as BPRole,
    COMPANYNAME as Company
} where CURRENCY = 'USD';

view ![POrders]  as select from TR.PurchaseOrder{
		PURCHASEORDERID as OrderId,
		PARTNER.PARTNERID as SupplierId,
		CURRENCY as CurrencyCode,
		GROSSAMOUNT as GrossAmount,
		NETAMOUNT as NetAmount,
		TAXAMOUNT as TaxAmount,
		LIFECYCLESTATUS as Status
	};

view ![OrderStatus] as select from POrders {
      case Status
            when 'P' then 'Paid'
            when 'R' then 'Rejected'
			when 'C' then 'Confirmed'
			when 'N' then 'New'
			when 'X' then 'Cancelled'
			end as Status,
        count(OrderId) as NoOfOrders,
        sum(GrossAmount) as TotalAmount
} group by Status;

view ![SupplierOrderItems] as select from TR.PurchaseOrderItems mixin {
    product : Association[1] to MD.Product on product.PRODUCTID = $projection.ProductId;
}
into
{
    key HEADER.PURCHASEORDERID as OrderId,
    key PURCHASEORDERITEM as ItemNo,
    PRODUCT.PRODUCTID as ProductId,
    GROSSAMOUNT as GrossAmount,
    CURRENCY as CurrencyCode,
    QUANTITY as Quantity,
    QUANTITYUNIT as QuantityUnit,
    product
};
	view ![SupplierOrders] as select from POrders mixin {
		items: association[1..*] to SupplierOrderItems on items.OrderId = $projection.OrderId;
		supplier: association[1] to MD.Partner on supplier.PARTNERID = $projection.SupplierId;
	} into {
		OrderId,
		SupplierId,
		GrossAmount,
		Status,
		items,
		supplier
	};
	
	view ![ConsumptionView] as select from SupplierOrders{
		supplier.COMPANYNAME as CompanyName,
		items.GrossAmount,
		items.CurrencyCode,
		items.Quantity,
		items.QuantityUnit,
		items.product[CATEGORY = 'Others'].PRODUCTID,
		items.product.PRICE as Price,
		ceil(items.product.PRICE * items.Quantity) as CalculatedPrice
		
	};
}