import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_php/models/product.dart';
import 'package:mobile_flutter_php/utils/colors.dart';

class ProductScreenDetails extends StatelessWidget {
  static const routeName = '/product-details-screen';
  const ProductScreenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
        backgroundColor: primaryColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: primaryColor,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'http://10.0.0.117/backend_flutter_php/assets/${product.image}',
                height: MediaQuery.of(context).size.height * 1 / 2 + 25,
                fit: BoxFit.cover,
              ),
              Text(
                'R\$ ${product.pricePerKg}',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Descrição:",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  product.description!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
