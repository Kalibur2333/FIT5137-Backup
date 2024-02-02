-- Create the 'article' table for managing articles information
CREATE TABLE article (
    articlecode   VARCHAR2(20) NOT NULL,
    articlename   VARCHAR2(80) NOT NULL,
    vendorkey     CHAR(3) NOT NULL,
    vendorname    VARCHAR2(30) NOT NULL,
    categoryinit  NUMBER(2),
    categoryname  VARCHAR2(30),
    typeinit      NUMBER(2),
    typename      VARCHAR2(20) NOT NULL,
    startdate     DATE,
    expiredate    DATE,
    colourinit    NUMBER(3),
    colourname    VARCHAR2(30),
    sex           CHAR(2),
    picture       CHAR(1),
    baseprice     NUMBER(10),
    saleprice     NUMBER(10),
    notes         VARCHAR2(80)
);

-- Add a primary key constraint to the 'article' table
ALTER TABLE article ADD CONSTRAINT article_pk PRIMARY KEY (articlecode);

-- Create the 'cashier' table for managing cashier transactions
CREATE TABLE cashier (
    notrans         CHAR(14) NOT NULL,
    datetrans       DATE NOT NULL,
    typetrans       CHAR(7),
    notes           VARCHAR2(30),
    userid          VARCHAR2(20),
    referencetrans  VARCHAR2(30)
);

-- Add a primary key constraint to the 'cashier' table
ALTER TABLE cashier ADD CONSTRAINT cashier_pk PRIMARY KEY (notrans);

-- Create the 'cashierdetail' table for managing details of cashier transactions
CREATE TABLE cashierdetail (
    notrans         CHAR(14) NOT NULL,
    barcode         VARCHAR2(20) NOT NULL,
    articlecode     VARCHAR2(20) NOT NULL,
    "size"          VARCHAR2(3) NOT NULL,
    qty             NUMBER(2) NOT NULL,
    baseprice       NUMBER(10),
    saleprice       NUMBER(10),
    discounttype    NUMBER(1),
    discountpersen  NUMBER(1),
    discountrupiah  NUMBER(10),
    discexpenses    NUMBER(1),
    consignment     NUMBER(2),
    consignmentrp   NUMBER(10),
    subtotal        NUMBER(10),
    payment         NUMBER(10)
);

-- Add a primary key constraint to the 'cashierdetail' table
ALTER TABLE cashierdetail ADD CONSTRAINT cashierdetail_pk PRIMARY KEY (notrans, barcode);

-- Create the 'cashierpayment' table for managing cashier payments
CREATE TABLE cashierpayment (
    id               NUMBER(5) NOT NULL,
    notrans          CHAR(14) NOT NULL,
    paidtype         VARCHAR2(13) NOT NULL,
    cardinit         CHAR(3),
    cardname         VARCHAR2(20),
    cardnumber       CHAR(19),
    totalpaid        NUMBER(10),
    machinename      CHAR(4),
    companycharge    NUMBER(10),
    customercharge   NUMBER(10),
    reffno           NUMBER(10),
    progressivedisc  NUMBER(10) NOT NULL
);

-- Add a primary key constraint to the 'cashierpayment' table
ALTER TABLE cashierpayment ADD CONSTRAINT cashierpayment_pk PRIMARY KEY (id);

-- Create the 'inventory' table for managing inventory information
CREATE TABLE inventory (
    barcode           VARCHAR2(20) NOT NULL,
    articlecode       VARCHAR2(20) NOT NULL,
    "size"            VARCHAR2(3) NOT NULL,
    currentbaseprice  NUMBER(10),
    currentsaleprice  NUMBER(10),
    consignment       NUMBER(2),
    consignmentrp     NUMBER(10),
    qty               NUMBER(2) NOT NULL,
    status            NUMBER(2) NOT NULL
);

-- Add a primary key constraint to the 'inventory' table
ALTER TABLE inventory ADD CONSTRAINT inventory_pk PRIMARY KEY (barcode);

-- Add foreign key constraints to establish relationships between tables
ALTER TABLE cashierpayment
    ADD CONSTRAINT relation_11 FOREIGN KEY (notrans) REFERENCES cashier (notrans);

ALTER TABLE inventory
    ADD CONSTRAINT relation_3 FOREIGN KEY (articlecode) REFERENCES article (articlecode);

ALTER TABLE cashierdetail
    ADD CONSTRAINT relation_5 FOREIGN KEY (notrans) REFERENCES cashier (notrans);

ALTER TABLE cashierdetail
    ADD CONSTRAINT relation_6 FOREIGN KEY (barcode) REFERENCES inventory (barcode);

ALTER TABLE cashierdetail
    ADD CONSTRAINT relation_8 FOREIGN KEY (articlecode) REFERENCES article (articlecode);
