import 'package:emart/DialogBox/errorDialog.dart';
import 'package:emart/views/cart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emart/size_config.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  final int arguments;
  const PaymentPage({Key key, @required this.arguments})
      : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay _razorpay;

  TextEditingController _nameTextEditingController = new TextEditingController();
  TextEditingController _emailTextEditingController = new TextEditingController();
  TextEditingController _phoneTextEditingController = new TextEditingController();
  TextEditingController _addressTextEditingController = new TextEditingController();

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: 'Pay',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color:Color(0xff2b98f7),
          ),
          children: [
            TextSpan(
              text: 'ment',
              style: TextStyle(color:Color(0xff2b98f7), fontSize: 35,),
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
              child: Icon(Icons.keyboard_arrow_left, color:Color(0xFF146BAD),size: 30,),
            ),
          ],
        ),
      ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: _title(),
                 ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left:10,top:10),
                    child: Text(
                      "Purpose of Payment",
                      style: TextStyle(
                        fontSize: 2 * SizeConfig.heightMultiplier,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10,top:5),
                    child: Text(
                      "Online Shopping on eMart",
                      style: TextStyle(
                        fontSize: 2.2 * SizeConfig.heightMultiplier,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text(
                      "Your Details",
                      style: TextStyle(
                        fontSize: 2 * SizeConfig.heightMultiplier,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 2 * SizeConfig.heightMultiplier,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _nameTextEditingController,
                      decoration: InputDecoration(
                        border:new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        border:new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _phoneTextEditingController,
                      decoration: InputDecoration(
                        border:new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 2 * SizeConfig.heightMultiplier,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _addressTextEditingController,
                      decoration: InputDecoration(
                        border:new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 2.2 * SizeConfig.heightMultiplier,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/rupee_black.png"),
                        height: 2.2 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          "${widget.arguments}",
                          style: TextStyle(
                            fontSize: 2.2 * SizeConfig.heightMultiplier,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      _emailTextEditingController.text.isNotEmpty &&
                          _nameTextEditingController.text.isNotEmpty &&
                          _phoneTextEditingController.text.isNotEmpty &&
                            _addressTextEditingController.text.isNotEmpty

                          ? openCheckout()
                          : displayDialog("Please fill the detail completely");
                    },
                    child:Text('Pay Now',style: TextStyle(fontSize: 20,
                      color:Colors.white,),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(message: msg,);
        }
    );
  }
  var subscription;

  @override
  void initState() {

    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_uPiOFLGAY2cKi0',
      'amount': widget.arguments * 100,
      'theme.color': '0xFF5ABF60',
      'name': 'eMart Online Shopping',
      'image': 'assets/logo/emart_logo.png',
      'description': 'Shopping Charges',
      'prefill': {'contact': _phoneTextEditingController.text, 'email': _emailTextEditingController.text,'name': _nameTextEditingController.text},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 5);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Cart(),
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 1);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
}
