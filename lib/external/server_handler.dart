import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_flutter_php/models/product.dart';
import 'package:mobile_flutter_php/models/seller.dart';
import 'package:mobile_flutter_php/screens/product_screen.dart';

class ServerHandler {
  final String _baseUrl = 'http://10.0.0.117/backend_flutter_php/api';

  //get the list of sellers
  Future<List<Seller>> getSellers() async {
    try {
      List<Seller> sellers = [];

      http.Response response =
          await http.get(Uri.parse('$_baseUrl/gen/sellers'));

      //dynamic seller = jsonDecode(response.body)['sellers'];
      List sellerList = (json.decode(response.body))['sellers'];

      for (Map m in sellerList) {
        sellers.add(Seller.fromMap(m));
      }

      return sellers;
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print('Server Handler : error : ' + e.toString());
      // ignore: use_rethrow_when_possible
      rethrow;
    }
  }

  Future<List<Product>> getProductsPerSeller(int sellerId) async {
    try {
      List<Product> products = [];

      http.Response response = await http
          .get(Uri.parse('$_baseUrl/gen/products?seller_id=$sellerId'));

      //print(response.body);

      List productList = (json.decode(response.body))['products'];

      for (Map m in productList) {
        products.add(Product.fromMap(m));
      }

      return products;
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print('Server Handler : error : ' + e.toString());
      // ignore: use_rethrow_when_possible
      rethrow;
    }
  }
}
