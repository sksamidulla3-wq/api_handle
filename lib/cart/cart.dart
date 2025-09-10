import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;
import 'detail.dart';
import 'model.dart';

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

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CartsModel? cartsModel;

  @override
  void initState() {
    super.initState();
    getProductsCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: cartsModel != null && cartsModel!.carts!.isNotEmpty
          ? ListView.builder(
              itemCount: cartsModel!.carts!
                  .expand((cart) => cart.products!)
                  .length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                var product = cartsModel!.carts!
                    .expand((cart) => cart.products!)
                    .toList()[index];

                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Details(thisProduct: product),
                        ),
                      );
                    },
                    title: Text(product.title!),
                    subtitle: Text(product.price.toString()),
                    leading: Image.network(
                      product.thumbnail!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    trailing: Text(product.quantity.toString()),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  void getProductsCarts() async {
    var uri = Uri.parse("https://dummyjson.com/carts");
    var response = await httpClient.get(uri);
    if (response.statusCode == 200) {
      cartsModel = CartsModel.fromJson(jsonDecode(response.body));
      setState(() {});
    }
  }
}
