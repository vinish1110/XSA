//namespace abxsa.data;

context MasterData {
    type BusinessKey : String(10);
    type SDate : DateTime;
    type CurrencyT : String(5);
    type AmountT : Decimal(15, 2);
    type QuantityT : Decimal(13, 3);
    type UnitT : String(3);
    type StatusT : String(1);

    /*@@layout{"layoutInfo":{}}*/
    entity Employee {
        key EMPLOYEEID    : Integer not null;
            NAME          : MasterData.Name;
            SEX           : String(1);
            LANGUAGE      : String(1);
            PHONENUMBER   : String(30);
            EMAILADDRESS  : String(255);
            LOGINNAME     : String(12);
            CURRENCY      : String(5);
            SALARYAMOUNT  : Decimal(15, 2);
            ACCOUNTNUMBER : String(10);
            ADDRESSES     : association[1, 0..1] to MasterData.Address { ADDRESSID };
    };
	entity dummy{
		dummy: String(1);
	};
    type Name {
        FIRST    : String(40);
        MIDDLE   : String(40);
        LAST     : String(40);
        INITIALS : String(10);
    };
    type HistoryT {
        CREATEDBY : association[1, 0..1] to MasterData.Employee { EMPLOYEEID };
        CREATEDAT : Date;
        CHANGEDBY : association[1, 0..1] to MasterData.Employee { EMPLOYEEID };
        CHANGEDAT : Date;
    };

    /*@@layout{"layoutInfo":{"x":-426,"y":-100.5}}*/
    entity Address {
        key ADDRESSID   : Integer not null;
            CITY        : String(40);
            POSTALCODE  : String(10);
            STREET      : String(60);
            BUILDING    : String(10);
            COUNTRY     : String(3);
            REGION      : String(4);
            ADDRESSTYPE : String(2);
            LATITUDE    : Double;
            LONGITUDE   : Double;
            POINT       : hana.ST_POINT;
    };

    /*@@layout{"layoutInfo":{"x":-131,"y":-263.5}}*/
    entity Product {
        key PRODUCTID     : String(10) not null;
            TYPECODE      : String(4);
            CATEGORY      : String(40);
            HISTORY       : MasterData.HistoryT;
            TAXTARIFFCODE : String(1);
            CURRENCY      : String(4);
            PRICE         : Decimal(15, 2);
            NAMEID        : String(10);
            DESCID        : String(10);
            SUPPLIER      : association[1, 0..1] to MasterData.Partner { PARTNERID };
    };

    /*@@layout{"layoutInfo":{"x":294,"y":63.5}}*/
    entity Partner {
        PARTNERID    : Integer;
        PARTNERROLE  : String(3);
        EMAILADDRESS : String(255);
        PHONENUMBER  : String(30);
        FAXNUMBER    : String(30);
        WEBADDRESS   : String(1024);
        COMPANYNAME  : String(80);
        HISTORY      : MasterData.HistoryT;
        CURRENCY     : String(5);
        ADDRESSES    : association[1, 0..1] to MasterData.Address { ADDRESSID };
    };

    /*@@layout{"layoutInfo":{"x":-530,"y":-424.5}}*/
    entity Texts {
        key TEXTID      : String(10) not null;
            LANGUAGE    : String(2);
            ISOLANGUAGE : String(2);
            TEXT        : String(1024);
    };
};