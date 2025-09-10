import 'package:api_handle/cart/model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  CartsProductModel? thisProduct;

  Details({required this.thisProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(thisProduct!.title!)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                thisProduct!.thumbnail!,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
              Text(
                thisProduct!.title!.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Price:💲${thisProduct!.price!.toString()}"),
              Text(
                " In Stock ${thisProduct!.quantity.toString()}",
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
