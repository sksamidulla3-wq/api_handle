import 'dart:convert';
import 'package:api_handle/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

import 'detailpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter API Handle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataProductModel? productsModel;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: productsModel != null && productsModel!.products!.isNotEmpty
          ? ListView.builder(
              itemCount: productsModel!.products!.length,
              itemBuilder: (ctx, index) {
                var product = productsModel!.products![index];
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => DetailPage(thisProduct: product,)),
                          );
                        },
                        title: Text(product.title!),
                        subtitle: Text(product.description!),
                        leading: Image.network(
                          product.thumbnail!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        trailing: Text(product.price.toString()),
                      ),
                    ),
                    Divider(thickness: 2, color: Colors.grey),
                    Container(
                      height: 80,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.images!.length,
                        itemBuilder: (ctx, childIndex) {
                          var eachImage = product.images![childIndex];
                          return Image.network(
                            eachImage,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  void getProducts() async {
    var uri = Uri.parse("https://dummyjson.com/products");
    var response = await httpClient.get(uri);
    if (response.statusCode == 200) {
      productsModel = DataProductModel.fromJson(jsonDecode(response.body));
      setState(() {});
    }
  }
}
