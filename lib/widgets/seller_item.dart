import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_php/models/seller.dart';
import 'package:mobile_flutter_php/screens/product_screen.dart';
import 'package:mobile_flutter_php/utils/colors.dart';

class SellerItem extends StatelessWidget {
  final Seller seller;
  final Color backgroundColor;
  SellerItem({Key? key, required this.seller, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .popAndPushNamed(ProductScreen.routeName, arguments: seller),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 200,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30),
              child: Column(
                children: [
                  Text(
                    seller.name!,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    width: 170,
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      seller.address!,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //Text(seller.description!),
                  SizedBox(height: 15),
                  Text(
                    'No Rating',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.network(
                  "http://10.0.0.117/backend_flutter_php/assets/${seller.image}"),
            ),
          ],
        ),
      ),
    );
  }
}
