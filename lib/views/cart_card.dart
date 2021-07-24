import 'package:emart/views/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart/models/product.dart';

class CartTile extends StatelessWidget {
  final Product product;
  const CartTile(this.product);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductDetails(product)));
    },child:Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        product.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
             /*   Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: product.isFavorite.value
                          ? Icon(Icons.favorite_rounded)
                          : Icon(Icons.favorite_border),
                      onPressed: () {
                        product.isFavorite.toggle();
                      },
                    ),
                  )),
                )*/
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 2,
              style:
              TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
         //   if (product.rating != null)
      /*        Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),*/
            SizedBox(height: 8),
            Text('Rs ${product.price}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    ),
    );
  }
}
