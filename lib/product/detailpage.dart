import 'package:api_handle/product/product_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{

  ProductModel? thisProduct;


  DetailPage({required this.thisProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(thisProduct!.title!),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(thisProduct!.thumbnail!),
            Text(thisProduct!.description!),
            Text(thisProduct!.price.toString()),
            Text(thisProduct!.discountPercentage.toString()),
            Text(thisProduct!.rating.toString()),
            Text(thisProduct!.stock.toString()),
            Text(thisProduct!.brand!),
            Text(thisProduct!.category!),
            Text(thisProduct!.returnPolicy!),
            Text(thisProduct!.shippingInformation!),
            Text(thisProduct!.warrantyInformation!),
            Text(thisProduct!.id.toString()),
            Text(thisProduct!.rate.toString()),
          ],
        ),
      ),
    );
  }
}