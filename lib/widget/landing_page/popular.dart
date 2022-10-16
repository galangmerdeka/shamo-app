import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/domain/products/products_response.dart';
import 'package:shamo_app/presentation/product%20detail/product_page.dart';
import 'package:shamo_app/provider/products_provider.dart';
import 'package:shamo_app/theme.dart';

class LandingPagePopular extends StatelessWidget {
  const LandingPagePopular({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    // final ProductsResponse productModel;
    return Container(
      width: double.infinity,
      // color: Colors.red,
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Products',
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            // color: Colors.red,
            width: double.infinity,
            // width: 215,
            height: 278,
            // child: SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       ProductCard(),
            //     ],
            //   ),
            // ),
            child: GridView.count(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 30,
              children: List.generate(
                productsProvider.products.length,
                (index) {
                  return ProductCard(productsProvider.products, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final List<ProductsResponse> product;
  int index;
  // ProductCard({Key? key}) : super(key: key);
  ProductCard(this.product, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(ProductPage.routeName, arguments: index);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(product[index].galleries![0].url!),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.medium,
                scale: 1.0,
              ),
            ),
          ),
          Positioned(
            // height: 200,
            width: 200,
            // bottom: 200,
            top: 200,
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[index].category!.name!,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    product[index].name!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${product[index].price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LandingPagePopular extends StatefulWidget {
//   const LandingPagePopular({super.key});

//   @override
//   State<LandingPagePopular> createState() => _LandingPagePopularState();
// }

// class _LandingPagePopularState extends State<LandingPagePopular> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       // color: Colors.red,
//       padding: EdgeInsets.only(
//         left: 10,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Popular Products',
//             style: primaryTextStyle.copyWith(
//               fontSize: 24,
//               fontWeight: bold,
//             ),
//           ),
//           SizedBox(
//             height: 14,
//           ),
//           Container(
//             // color: Colors.red,
//             width: double.infinity,
//             // width: 215,
//             height: 278,
//             child: GridView.count(
//               crossAxisCount: 1,
//               scrollDirection: Axis.horizontal,
//               mainAxisSpacing: 30,
//               children: List.generate(
//                 5,
//                 (index) {
//                   return GestureDetector(
//                     onTap: () {
//                       print("clicked");
//                     },
//                     child: Stack(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             // color: Colors.red,
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage('assets/images/shoes.png'),
//                               fit: BoxFit.cover,
//                               filterQuality: FilterQuality.medium,
//                               scale: 1.0,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // height: 200,
//                           width: 200,
//                           // bottom: 200,
//                           top: 200,
//                           child: Container(
//                             padding: EdgeInsets.only(
//                               left: 20,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Running',
//                                   style: secondaryTextStyle.copyWith(
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Text(
//                                   'Court Vision',
//                                   style: primaryTextStyle.copyWith(
//                                     fontSize: 18,
//                                     fontWeight: semiBold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 2,
//                                 ),
//                                 Text(
//                                   'Rp 500.000',
//                                   style: priceTextStyle.copyWith(
//                                     fontSize: 14,
//                                     fontWeight: medium,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
