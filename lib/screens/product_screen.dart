import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_php/external/server_handler.dart';
import 'package:mobile_flutter_php/models/product.dart';
import 'package:mobile_flutter_php/models/seller.dart';
import 'package:mobile_flutter_php/screens/sellers_screen.dart';
import 'package:mobile_flutter_php/utils/colors.dart';
import 'package:mobile_flutter_php/widgets/product_item.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product-screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> _products = [];

  bool _firstExec = true;

  void getProductsPerSeller(int sellerId) {
    ServerHandler()
        .getProductsPerSeller(sellerId)
        .then((value) => {
              print(value),
              setState(() {
                _products = value;
              }),
            })
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    Seller seller = ModalRoute.of(context)!.settings.arguments as Seller;

    if (_firstExec) {
      getProductsPerSeller(seller.id!);
      _firstExec = false;
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 50, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Better Buys',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                      color: primaryColor,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: primaryColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://10.0.0.117/backend_flutter_php/assets/${seller.image}'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (_products.isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      strokeWidth: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Loading Products',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),

            ///list of items
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                itemBuilder: ((context, index) => ProductItem(
                      product: _products[index],
                      productIndex: index,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
