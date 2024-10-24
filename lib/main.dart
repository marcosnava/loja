// main.dart
import 'package:flutter/material.dart';
import 'package:loja/models/auth.dart';
import 'package:loja/models/cart.dart';
import 'package:loja/models/order_list.dart';
import 'package:loja/models/product_list.dart';
import 'package:loja/pages/auth_page.dart';
import 'package:loja/pages/cart_page.dart';
import 'package:loja/pages/orders_page.dart';
import 'package:loja/pages/product_detail_page.dart';
import 'package:loja/pages/product_form_page.dart';
import 'package:loja/pages/products_overview_page.dart';
import 'package:loja/pages/products_page.dart';
import 'package:loja/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: Colors.purple, secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        //home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.auth: (ctx) => const AuthPage(),
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
          AppRoutes.products: (ctx) => const ProductsPage(),
          AppRoutes.productForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
