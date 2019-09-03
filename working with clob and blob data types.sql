--step1: create mobiles table
create table mobiles(
mobile_id number(4),
mobile_name varchar2(15),
price number(5),
mobile_desc clob,
mobile_photo blob);


--step2: create data file(data_file.txt)
/*
1001,OPPO F11,350,OPPOF11_DESC.txt,oppof11_photo.jpg
1002,VIVO S1,400,VIVOS1_DESC.txt,vivos1_photo.jpg
*/

--step3: create control file(control_file.ctl)
/*
LOAD DATA
INFILE 'data_file.txt'
  INTO TABLE mobiles
  FIELDS TERMINATED BY ','
  ( mobile_id,
    mobile_name,
    price,
    desc_file    FILLER,
    photo_file   FILLER,
    mobile_desc    LOBFILE(desc_file)TERMINATED BY EOF ,
    mobile_photo   LOBFILE(photo_file) TERMINATED BY EOF
  )
*/

--step3: Run sql * loader utility as following
/*
1- go to the directory where you created the above files and run the command line prompt
2- Run the sql loader as following
> sqlldr hr/hr@orclpdb
3- enter the control file name (control_file.ctl)
*/

--step4: check the table
select * from mobiles ;