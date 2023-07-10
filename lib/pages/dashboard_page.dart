import 'package:banking_clone_app/data_json/balance_json.dart';
import 'package:banking_clone_app/theme/color.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bWFuJTIwZmFjZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
          )),
      actions: [
        IconButton(
            onPressed: () {}, icon: FaIcon(FontAwesomeIcons.magnifyingGlass))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.25,
          decoration: BoxDecoration(
            color: primary,
          ),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(balanceLists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    balanceLists[index]['currency'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? white
                                            : white.withOpacity(0.5)),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    balanceLists[index]['amount'],
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? white
                                            : white.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                balanceLists[index]['description'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: white.withOpacity(0.5)),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                width: size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          "Add money",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                          "Exchange",
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25, bottom: 40, left: 20, right: 20),
                      child: getAccontSection(),
                    ))))
      ],
    );
  }

  Widget getAccontSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Accounts",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 10)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: secondary.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.wallet,
                                color: primary,
                                size: 20,
                              ),
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "40832-810-5-7000-012345",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: primary,
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.euroSign,
                            color: primary,
                            size: 20,
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "18 199.24 EUR",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Icon(
                          CommunityMaterialIcons.currency_gbp,
                          color: primary,
                          size: 20,
                        ))),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "36.67 GBP",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cards",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 90,
                height: 22,
                decoration: BoxDecoration(
                    color: secondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 16,
                      color: primary,
                    ),
                    Text(
                      "ADD CART",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: primary),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 10)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.creditCard,
                                  size: 25,
                                  color: primary,
                                ),
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "EUR *2330",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Text(
                        "8 199.24 EUR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Divider(
                      thickness: 0.2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: secondary.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.creditCard,
                                  size: 25,
                                  color: primary,
                                ),
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "GBP *2330",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Text(
                        "36.67 GBP",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Divider(
                      thickness: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
