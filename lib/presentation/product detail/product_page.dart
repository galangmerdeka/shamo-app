import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/domain/products/products_response.dart';
import 'package:shamo_app/model/galleries.dart';
// import 'package:shamo_app/model/galleries.dart';
import 'package:shamo_app/provider/products_provider.dart';
import 'package:shamo_app/theme.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});
  static const routeName = '/product-page';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List image = [
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List<ProductsResponse> products;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);
    // print(products.toJson());
    return Scaffold(
      backgroundColor: bgColor4,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              HeaderPage(
                  context, index, productsProvider.products[index].galleries!),
              ContentProduct(productsProvider.products, index),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContentProduct(List<ProductsResponse> productsResponse, int index) {
    return Container(
      // height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 17,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            24,
          ),
        ),
        color: bgColor1,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${productsResponse[index].name}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '${productsResponse[index].category!.name}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/icon_love_button.png',
                  width: 46,
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightMargin,
          ),
          Container(
            width: 405,
            height: 30,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            color: bgColor2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price Starts From',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  '\$${productsResponse[index].price}',
                  style: priceTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightMargin,
          ),
          Container(
            // color: Colors.red,
            width: 405,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '${productsResponse[index].description}',
                  style: descTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: heightMargin,
          ),
          Container(
            // color: Colors.blue,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Familiar Shoes',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 54,
            child: GridView.count(
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 30,
              children: List.generate(10, (index) {
                return FamiliarShoes();
              }),
            ),
          ),
          SizedBox(
            height: heightMargin,
          ),
          Container(
            // color: Colors.blue,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print('clicked message');
                  },
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 23,
                        height: 22,
                        child: ImageIcon(
                          AssetImage('assets/images/icon_chat.png'),
                          color: primaryColor,
                          // size: 10,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 54,
                  width: 245,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          // side: BorderSide
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add To Chart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget FamiliarShoes() {
    return GestureDetector(
      onTap: () {
        print('clicked');
      },
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            // image: NetworkImage(product[index].galleries![0].url!),
            image: AssetImage('assets/images/shoes.png'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
            scale: 1.0,
          ),
        ),
      ),
    );
  }

  Widget Indicator(int index) {
    return Container(
      width: currentIndex == index ? 20 : 4,
      height: 4,
      margin: EdgeInsets.symmetric(
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? primaryColor : Color(0xffC4C4C4),
      ),
    );
  }

  Widget HeaderPage(
      BuildContext context, int indexList, List<Galleries> galleries) {
    // final List<Galleries> productGalleries;

    int index = indexList;
    return Column(
      children: [
        Container(
          // color: Colors.red,
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // print('click');
                  Get.back();
                },
                child: Icon(Icons.chevron_left),
              ),
              GestureDetector(
                onTap: () {
                  print('click');
                },
                child: ImageIcon(
                  AssetImage('assets/images/icon_cart_product.png'),
                ),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.red,
          height: 305,
          width: double.infinity,
          child: CarouselSlider(
            items: galleries
                .map(
                  (Galleries) => Image.network(
                    galleries[index].url!,
                    filterQuality: FilterQuality.medium,
                    width: MediaQuery.of(context).size.width,
                    // height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: galleries.map((e) {
            index++;
            return Indicator(index);
          }).toList(),
        ),
      ],
    );
  }
}
