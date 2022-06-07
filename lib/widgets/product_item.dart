import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_php/models/product.dart';
import 'package:mobile_flutter_php/screens/product_details.dart';
import 'package:mobile_flutter_php/utils/colors.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final int productIndex;
  const ProductItem(
      {Key? key, required this.product, required this.productIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(ProductScreenDetails.routeName, arguments: product),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: listColor[productIndex % 4],
                      width: 3,
                    ),
                  ),
                  child: Image.network(
                    'http://10.0.0.117/backend_flutter_php/assets/${product.image}',
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        listColor[productIndex % 4],
                        listColor[productIndex % 4].withOpacity(0.0)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              product.name!,
              style: GoogleFonts.poppins(
                color: primaryColor,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
