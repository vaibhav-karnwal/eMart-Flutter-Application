import 'package:emart/controllers/productController.dart';
import 'package:emart/views/product_card.dart';
import 'package:emart/widget/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emart/size_config.dart';
import 'package:emart/widget/bezierContainer.dart';
import 'package:emart/size_config.dart';
import 'package:emart/views/cart.dart';
import 'package:emart/views/drawerScreen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ProductController productController = Get.put(ProductController());
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextEditingController nameTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'V',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color:Colors.pink[800],
          ),
          children: [
            TextSpan(
              text: 'K',
              style: TextStyle(color: Colors.pink[800], fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: nameTextEditingController,
                data: Icons.search,
                hintText: "Search",
                isObsecure: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _footerWidgett() {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: height * .02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => DrawerScreen()));
                  },
                ),
                Image(
                  image: AssetImage('assets/logo/emart_logo.png'),
                  height: 80,
                ),
              ],
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
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children:[
        Scaffold(
          key: _scaffoldKey,
          body: Container(child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: _emailPasswordWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:8,right:8),
                  child: Obx(() => StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    staggeredTileBuilder:(index)=>StaggeredTile.fit(1),
                  )),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => DrawerScreen()));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 130),
                          child: Image(
                            image: AssetImage('assets/logo/emart_logo.png'),
                            height: 30,
                          ),
                        ),
                      ],
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
              ),
            ],
          ),
          ),
        ),
      ],
    );
  }
}