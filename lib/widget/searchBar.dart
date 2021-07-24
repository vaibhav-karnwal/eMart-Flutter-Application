import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:emart/views/homepage.dart';

class SearchBar extends StatelessWidget {

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'e',
          style: GoogleFonts.portLligatSans(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color(0xffffa96a),
          ),
          children: [
            TextSpan(
              text: 'M',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            TextSpan(
              text: 'art',
              style: TextStyle(color: Color(0xffffa96a), fontSize: 40),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          height: 120.0,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: Center(
                  child: _title(),
                ),
              ),
              Positioned(
                top: 80.0,
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.7), width: 1.0),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            print("your menu action here");
                          },
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
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
                            print("your menu action here");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }