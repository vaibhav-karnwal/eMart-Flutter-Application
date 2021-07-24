import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart/models/product.dart';


class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails(this.product);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left, color: Color(0xFF146BAD), size: 30,),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height*.1,),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 350,
                                    width: double.infinity,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        boxShadow: [BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 5.0,
                                        ),
                                        ]
                                    ),
                                    child: Image.network(
                                      widget.product.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                               /* Positioned(
                                  right: 0,
                                  child: Obx(() =>
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          icon: widget.product.isFavorite.value
                                              ? Icon(Icons.favorite_rounded)
                                              : Icon(Icons.favorite_border),
                                          onPressed: () {
                                            widget.product.isFavorite.toggle();
                                          },
                                        ),
                                      )),
                                )*/
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 8),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.product.title,
                                        maxLines: 2,
                                        style:
                                        TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'avenir',
                                          fontWeight: FontWeight.w800,
                                          color: Colors.red,),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  /*       if (widget.product.rating != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                        ),
                                        ]
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          widget.product.rating.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),*/
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text('Price : ',
                                            style: TextStyle(
                                                fontSize: 18, fontFamily: 'avenir')),
                                        Text('Rs ${widget.product.price}',
                                            style: TextStyle(fontSize: 18,
                                                fontFamily: 'avenir',
                                                color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Description : ',
                                            style: TextStyle(
                                                fontSize: 18, fontFamily: 'avenir')),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('${widget.product.description}',
                                            style: TextStyle(fontSize: 18,
                                                fontFamily: 'avenir',
                                                color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                        ),
                                        child: Padding(padding: EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                          child: Text("Add to Cart",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 0.03 * height,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(top: 30, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}