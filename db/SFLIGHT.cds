
@cds.persistence.exists 
Entity ![SFLIGHT] {
key     ![MANDT]: String(3)  @title: 'MANDT' ; 
key     ![CARRID]: String(3)  @title: 'CARRID' ; 
key     ![CONNID]: String(4)  @title: 'CONNID' ; 
key     ![FLDATE]: String(8)  @title: 'FLDATE' ; 
        ![PRICE]: Decimal(15, 2) not null  @title: 'PRICE' ; 
        ![CURRENCY]: String(5) not null  @title: 'CURRENCY' ; 
        ![PLANETYPE]: String(10) not null  @title: 'PLANETYPE' ; 
        ![SEATSMAX]: Integer not null  @title: 'SEATSMAX' ; 
        ![SEATSOCC]: Integer not null  @title: 'SEATSOCC' ; 
        ![PAYMENTSUM]: Decimal(17, 2) not null  @title: 'PAYMENTSUM' ; 
        ![SEATSMAX_B]: Integer not null  @title: 'SEATSMAX_B' ; 
        ![SEATSOCC_B]: Integer not null  @title: 'SEATSOCC_B' ; 
        ![SEATSMAX_F]: Integer not null  @title: 'SEATSMAX_F' ; 
        ![SEATSOCC_F]: Integer not null  @title: 'SEATSOCC_F' ; 
}

@cds.persistence.exists 
Entity ![SBOOK] {
key     ![MANDT]: String(3)  @title: 'MANDT' ; 
key     ![CARRID]: String(3)  @title: 'CARRID' ; 
key     ![CONNID]: String(4)  @title: 'CONNID' ; 
key     ![FLDATE]: String(8)  @title: 'FLDATE' ; 
key     ![BOOKID]: String(8)  @title: 'BOOKID' ; 
        ![CUSTOMID]: String(8) not null  @title: 'CUSTOMID' ; 
        ![CUSTTYPE]: String(1) not null  @title: 'CUSTTYPE' ; 
        ![SMOKER]: String(1) not null  @title: 'SMOKER' ; 
        ![LUGGWEIGHT]: Decimal(8, 4) not null  @title: 'LUGGWEIGHT' ; 
        ![WUNIT]: String(3) not null  @title: 'WUNIT' ; 
        ![INVOICE]: String(1) not null  @title: 'INVOICE' ; 
        ![CLASS]: String(1) not null  @title: 'CLASS' ; 
        ![FORCURAM]: Decimal(15, 2) not null  @title: 'FORCURAM' ; 
        ![FORCURKEY]: String(5) not null  @title: 'FORCURKEY' ; 
        ![LOCCURAM]: Decimal(15, 2) not null  @title: 'LOCCURAM' ; 
        ![LOCCURKEY]: String(5) not null  @title: 'LOCCURKEY' ; 
        ![ORDER_DATE]: String(8) not null  @title: 'ORDER_DATE' ; 
        ![COUNTER]: String(8) not null  @title: 'COUNTER' ; 
        ![AGENCYNUM]: String(8) not null  @title: 'AGENCYNUM' ; 
        ![CANCELLED]: String(1) not null  @title: 'CANCELLED' ; 
        ![RESERVED]: String(1) not null  @title: 'RESERVED' ; 
        ![PASSNAME]: String(25) not null  @title: 'PASSNAME' ; 
        ![PASSFORM]: String(15) not null  @title: 'PASSFORM' ; 
        ![PASSBIRTH]: String(8) not null  @title: 'PASSBIRTH' ; 
}

@cds.persistence.exists 
Entity ![SCARR] {
key     ![MANDT]: String(3)  @title: 'MANDT' ; 
key     ![CARRID]: String(3)  @title: 'CARRID' ; 
        ![CARRNAME]: String(20) not null  @title: 'CARRNAME' ; 
        ![CURRCODE]: String(5) not null  @title: 'CURRCODE' ; 
        ![URL]: String(255) not null  @title: 'URL' ; 
}

@cds.persistence.exists 
Entity ![SPFLI] {
key     ![MANDT]: String(3)  @title: 'MANDT' ; 
key     ![CARRID]: String(3)  @title: 'CARRID' ; 
key     ![CONNID]: String(4)  @title: 'CONNID' ; 
        ![COUNTRYFR]: String(3) not null  @title: 'COUNTRYFR' ; 
        ![CITYFROM]: String(20) not null  @title: 'CITYFROM' ; 
        ![AIRPFROM]: String(3) not null  @title: 'AIRPFROM' ; 
        ![COUNTRYTO]: String(3) not null  @title: 'COUNTRYTO' ; 
        ![CITYTO]: String(20) not null  @title: 'CITYTO' ; 
        ![AIRPTO]: String(3) not null  @title: 'AIRPTO' ; 
        ![FLTIME]: Integer not null  @title: 'FLTIME' ; 
        ![DEPTIME]: String(6) not null  @title: 'DEPTIME' ; 
        ![ARRTIME]: String(6) not null  @title: 'ARRTIME' ; 
        ![DISTANCE]: Decimal(9, 4) not null  @title: 'DISTANCE' ; 
        ![DISTID]: String(3) not null  @title: 'DISTID' ; 
        ![FLTYPE]: String(1) not null  @title: 'FLTYPE' ; 
        ![PERIOD]: Integer not null  @title: 'PERIOD' ; 
}



 view ![FlightView] as select from SBOOK as sb
	 inner join SFLIGHT as sp on 
	 sb.CARRID = sp.CARRID and 
	 sb.CONNID = sp.CONNID and 
	 sb.FLDATE = sp.FLDATE
	 {
		
	 	sb.CARRID,
	 	sb.CONNID,
	 	sb.FLDATE,
	 	sb.BOOKID,
	 	sb.LUGGWEIGHT,
	 	sb.COUNTER,
	 	sp.PRICE,
	 	sp.CURRENCY,
	 	sp.SEATSMAX
		
	 };

