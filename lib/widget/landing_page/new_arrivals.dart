import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/domain/products/products_response.dart';
import 'package:shamo_app/provider/products_provider.dart';
import 'package:shamo_app/theme.dart';

Widget NewArrival(BuildContext context) {
  ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
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
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: bold,
          ),
        ),
        SizedBox(
          height: 14,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productsProvider.products.length,
          itemBuilder: (context, index) {
            return ProductTile(productsProvider.products, index);
          },
        ),
      ],
    ),
  );
}

class ProductTile extends StatelessWidget {
  // const ProductTile({super.key});
  final List<ProductsResponse> productModel;
  int index;
  ProductTile(this.productModel, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tap ${index}");
      },
      child: Container(
        // color: Colors.red,
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                productModel[index].galleries![0].url!,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel[index].category!.name!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  productModel[index].name!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                  maxLines: 2,
                ),
                Text(
                  "\$${productModel[index].price}",
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
