import 'package:banking_clone_app/data_json/card_json.dart';
import 'package:banking_clone_app/theme/color.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
            size: 22,
          )),
      title: Text(
        "Card",
        style: TextStyle(fontSize: 18, color: black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: black,
              size: 25,
            ))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 240,
          child: PageView(
              controller: controller,
              children: List.generate(cardLists.length, (index) {
                return getCards(
                  cardLists[index]['amount'],
                  cardLists[index]['currency'],
                  cardLists[index]['card_number'],
                  cardLists[index]['valid_date'],
                  cardLists[index]['bg_color'],
                );
              })),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 10)
              ]),
        )
      ],
    );
  }

  Widget getCards(
      var ammount, var currency, var cardNumber, var validDate, var bgColor) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: white),
            ),
            SizedBox(width: 5),
            Text(
              ammount,
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: black),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width * 0.85,
          height: 170,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: 30,
                      color: white.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      cardNumber,
                      style: TextStyle(
                          color: white.withOpacity(0.8),
                          fontSize: 20,
                          wordSpacing: 15),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VALID DATE",
                          style: TextStyle(
                            color: white.withOpacity(0.3),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          validDate,
                          style: TextStyle(
                            color: white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assests/images/master_card_logo.png",
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}