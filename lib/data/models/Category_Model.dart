import 'package:flutter/material.dart';

class CategoryModel {

   String? title;
   String? image;
   int? price, oldPrice;
   bool? isLoved = false;

  CategoryModel(
   {this.title, this.image, this.price, this.oldPrice, this.isLoved});
  CategoryModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return;
    }
    title = map['title'];
    image = map['image'];
    price = map['price'];
    oldPrice = map['oldPrice'];
    isLoved  = map ['isLoved'];

  }

  toJson(){
    return{
      'title' : title,
      'image' :image,
      'price' : price,
      'oldPrice' : oldPrice,
      'isLoved' :isLoved,
    };
  }
}