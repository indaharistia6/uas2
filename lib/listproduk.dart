import  'package:flutter/material.dart';
//import  terlebih  dahulu  halaman  yang  diperlukan 
import  './detail_produk.dart';
//Top  Level/Root
void  main()  =>  runApp(MyApp());


class  MyApp  extends  StatelessWidget  {
@override

Widget  build(BuildContext  context)  {

return  MaterialApp(
title:  'First  App',

home:  MyHomePage(),
);
}
}

class  MyHomePage  extends  StatelessWidget  { @override
Widget  build(BuildContext  context)  {
return  Scaffold(

appBar:  AppBar(title:  Text("Product  Listing")),

body:  ListView(
shrinkWrap:  true,

padding:  const  EdgeInsets.fromLTRB(2.0,  10.0,  2.0,  10.0),

children:  <Widget>[

new  GestureDetector(

onTap:  ()  {

Navigator.of(context).push(new  MaterialPageRoute(

builder:  (BuildContext  context)  =>  DetailProduk(
name:  "PANTAI KUTA",
description:  "Pantai Kuta adalah sebuah tempat pariwisata yang terletak kecamatan Kuta, sebelah selatan Kota Denpasar, Bali, Indonesia. Daerah ini merupakan sebuah tujuan wisata turis mancanegara dan telah menjadi objek wisata andalan Pulau Bali sejak awal tahun 1970-an",
price:  1000,
image:  "kuta.jpg", star:  1,
),
));
},

child:  ProductBox(

name:  "PANTAI KUTA",
description:  "Pantai Kuta terletak di....", 
price:  1000,
image:  "kuta.jpg",),
),


new  GestureDetector( 
  onTap:  ()  {
Navigator.of(context).push(new  MaterialPageRoute( 
  builder:  (BuildContext  context)  =>  DetailProduk(
name:  "DANAU BERATAN",
description:  "Danau Bratan adalah sebuah danau yang terletak di kawasan Bedugul, Desa Candikuning, Kecamatan Baturiti, Kabupaten Tabanan, Bali.",

price:  800,
image:  "beratan.jpg", star:  4,
),
));
},
child:  ProductBox( 
name:  "DANAU BERATAN",
description:  "Danau Beratan terletak di...",  
price:  800,
image:  "beratan.jpg",)),



new  GestureDetector( 
  onTap:  ()  {
Navigator.of(context).push(
  new  MaterialPageRoute( 
    builder:  (BuildContext  context)  =>  DetailProduk(
name:  "TANJUNG BENOA",
description:  "Tanjung Benoa merupakan tempat wisata di Bali yang terkenal akan pantainya. Tempat ini juga merupakan surganya wahana air seperti banana boat, scuba diving, parasailing, rolling donut, seawalker, flying fish, snorkeling dll. ",

price:  2000,
image:  "benoa.jpg", star:  3,
),
));
},

child:  ProductBox( name:  "TANJUNG BENOA",
description:  "Tanjung Benoa terletak di...", price:  2000,
image:  "benoa.jpg",),
),


new  GestureDetector( onTap:  ()  {
Navigator.of(context).push(new  MaterialPageRoute( builder:  (BuildContext  context)  =>  DetailProduk(
name:  "TAMPAK SIRING",
description:  "Tampak Siring, nama sebuah kecamatan di kabupaten Gianyar, luas dari wilayah kecamatan Tampak Siring, sebesar 42,63 kilometer persegi. Jika anda berangkat dari airport Ngurah Rai Denpasar, maka anda perlu waktu satu jam lima belas menit, untuk ke tempat wisata di Ubud ini dengan mobil. Tampak Siring lebih dikenal dikalangan wisatawan sebagai sebuah pura yang bernama Tirta Empul.",

price:  1500,
image:  "tampak.jpg", star:  3,
),
));
},
child:  ProductBox( 
name:  "TAMPAK SIRING",
description:"Tampak Siring terletak di...", 
price:  1500,
image:  "tampak.jpg",),
),


new  GestureDetector( onTap:  ()  {
Navigator.of(context).push(new  MaterialPageRoute( builder:  (BuildContext  context)  =>  DetailProduk(
name:  "TANAH LOT",
description:  "Tanah Lot salah satu pura penting bagi umat Hindu Bali dan lokasi pura terletak di atas batu besar yang berada di lepas pantai.",
price:  100,
image:  "tanah_lot.jpg", star:  5,
),
));
},

child:  ProductBox( name:  "TANAH LOT",
description:  "Tanah Lot terletak di...", 
price:  100,
image:  "tanah_lot.jpg",
),	),
],
));
}}

//menggunakan  widget  StatelessWidget
class  ProductBox  extends  StatelessWidget  {
//deklarasi  variabel  yang  diterima  dari  MyHomePage
ProductBox({Key  key,  this.name,  this.description,  this.price,  this.image})
:  super(key:  key);
//menampung  variabel  yang  diterima  untuk  dapat  digunakan  pada  class  ini
final  String  name;
final  String  description; 
final  int  price;
final  String  image;

Widget  build(BuildContext  context)  {
//menggunakan  widget  container 
return  Container(
//padding
      padding:  EdgeInsets.all(2),
      //  height:  120,
      //menggunakan  widget  card 
      child:  Card(
      //membuat  tampilan  secara  horisontal  antar  image  dan  deskripsi 
      child:  Row(mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      //children  digunakan  untuk  menampung  banyak  widget 
      children:  <Widget>[
      Image.asset( "assets/appimages/"  +  image, width:  150,
      ),
      Expanded(
      //child  digunakan  untuk  menampung  satu  widget 
      child:  Container(
      padding:  EdgeInsets.all(5),
      //membuat  tampilan  secara  vertikal 
      child:  Column(
      mainAxisAlignment:  MainAxisAlignment.start,
      //ini  isi  tampilan  vertikal  tersebut 
      children:  <Widget>[
      //menampilkan  variabel  menggunakan  widget  text 
      Text(this.name,
      style:  TextStyle(fontWeight:  FontWeight.bold,)), Text(this.description),
      Text(
      "Price:  "  +  this.price.toString(), style:  TextStyle(color:  Colors.red),
      ),
      //menampilkan  widget  icon    dibungkus  dengan  row 
      Row(
      children:  <Widget>[ Row(
      children:  <Widget>[
      Icon(Icons.star,  size:  10,  color:  Colors.deepOrange,),
      Icon(Icons.star,  size:  10,  color:  Colors.deepOrange,), 
      Icon(Icons.star,  size:  10,  color:  Colors.deepOrange,), 
      Icon(Icons.star,  size:  10,  color:  Colors.orange),
      ],
      )

      ],
      )
      ],
      )))
      ])));
      }
      }
