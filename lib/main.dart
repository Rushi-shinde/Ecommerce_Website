import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Product/Product_UI/product.dart';
import 'Product/Product_bloc/product_bloc.dart';
import 'Product/Product_repo/product_fetch_api.dart';


void main() {
  runApp(RepositoryProvider(
    create: (context) => FetchApiRepo(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FetchApiRepo fetchApiRepo = FetchApiRepo();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(fetchApiRepo: fetchApiRepo),
      child: const MaterialApp(
        home: HomePage(title: 'Bloc Project'),
      ),
    );
  }
}

