import 'package:emart/controllers/productController.dart';
import 'package:emart/views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emart/size_config.dart';
import 'package:emart/widget/bezierContainer.dart';
import 'package:emart/views/drawerScreen.dart';
import 'package:emart/views/payment.dart';


class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  final ProductController productController = Get.put(ProductController());
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int amount=500;

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: 'C',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color:Color(0xFF146BAD),
          ),
          children: [
            TextSpan(
              text: 'art',
              style: TextStyle(color:Color(0xff2b98f7), fontSize: 35),
            ),
          ]),
    );
  }

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
              child: Icon(Icons.keyboard_arrow_left, color:Color(0xff2b98f7),size: 30,),
            ),
          ],
        ),
      ),
    );
  }

  Widget _totalPayment() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff2b98f7)),
      ),
      child: Column(
        children: [
          Text('Payment',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,
            color:Color(0xff2b98f7),),),
          SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                  color:Color(0xff2b98f7),),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Rs $amount',style: TextStyle(fontSize: 20,
                  color:Color(0xFFAD1421),),),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(arguments: amount),
                        ));
                  },
                  child:Text('Pay Now',style: TextStyle(fontSize: 20,
                    color:Colors.white,),),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _title(),
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blueGrey),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 130),
                  child: Image(
                    image: AssetImage('assets/logo/emart_logo.png'),
                    height: 30,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.category,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        print("your menu action here");
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Cart()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .25,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _headerWidget(),
                      SizedBox(height: height * .52),
                      Column(
                        children: [
                          _divider(),
                          _totalPayment(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}