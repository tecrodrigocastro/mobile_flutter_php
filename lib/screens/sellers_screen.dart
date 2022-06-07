import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter_php/models/seller.dart';
import 'package:mobile_flutter_php/utils/colors.dart';
import 'package:mobile_flutter_php/widgets/seller_item.dart';

class SellersScreen extends StatefulWidget {
  static const routeName = '/sellers-screen';

  const SellersScreen({Key? key}) : super(key: key);

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {
  List<Color> sellerItemsBackgroundColor = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sellerItemsBackgroundColor.add(const Color(0xFFE6F3EC));
    sellerItemsBackgroundColor.add(const Color(0xFFE6E6F2));
    sellerItemsBackgroundColor.add(const Color(0xFFE4EDF4));
    sellerItemsBackgroundColor.add(const Color(0xFFE4DAD9));
  }

  @override
  Widget build(BuildContext context) {
    List<Seller> sellers =
        ModalRoute.of(context)!.settings.arguments as List<Seller>;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: sellers
                    .map((e) => SellerItem(
                        seller: e,
                        backgroundColor:
                            sellerItemsBackgroundColor[sellers.indexOf(e) % 4]))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
