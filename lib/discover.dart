import 'package:discover_kenya/discoverdetails.dart';
import 'package:discover_kenya/dummy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'discoverdetails.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    final discoverCategories = [
      {
        'id': 0,
        'title': ' wildlife',
        'imgUrl':
            'https://images.unsplash.com/photo-1610898404424-1439b7006e1c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80'
      },
      {
        'id': 1,
        'title': 'architecture',
        'imgUrl':
            'https://www.constructionkenya.com/wp-content/uploads/2020/09/Nairobi-Skyscrapers.jpg'
      },
      {
        'id': 2,
        'title': 'Beach',
        'imgUrl':
            'https://images.unsplash.com/photo-1565848725126-1592ea54de4b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80'
      },
      {
        'id': 3,
        'title': 'Culture',
        'imgUrl':
            'https://images.unsplash.com/photo-1533645782036-997947a9d529?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80'
      },
      {
        'id': 4,
        'title': 'Fashion',
        'imgUrl':
            'https://images.unsplash.com/photo-1536852900145-17fbc5115892?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1055&q=80'
      },
      {
        'id': 5,
        'title': 'Food',
        'imgUrl':
            'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'
      },
      {
        'id': 6,
        'title': 'Golden Hour',
        'imgUrl':
            'https://images.unsplash.com/photo-1610477048876-96084cb89af4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'
      },
      {
        'id': 7,
        'title': 'Landscape',
        'imgUrl':
            'https://images.unsplash.com/photo-1502088513349-3ff6482aa816?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1092&q=80'
      },
      {
        'id': 8,
        'title': 'Night',
        'imgUrl':
            'https://images.unsplash.com/photo-1543245883-b631737145f0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'
      },
      {
        'id': 9,
        'title': 'Sport',
        'imgUrl':
            'https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'
      },
      {
        'id': 10,
        'title': 'creative',
        'imgUrl':
            'https://www.designindaba.com/sites/default/files/node/news/8955/mboisa20.jpg'
      }
    ];

    final flag = Image.asset(
      "assets/flag.png",
      width: 38.0,
      height: 38.0,
      fit: BoxFit.fill,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .05,
                    bottom: MediaQuery.of(context).size.width * .02,
                    left: MediaQuery.of(context).size.width * .07),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Explore Categories",
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: .5),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: flag,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // insert items herehow to make images clickable how to make images clickable with information flutter to make images clickable with information flutterwith information flutter
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[0]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[0]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[1]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[1]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[2]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[2]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[3]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[3]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[4]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[4]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[5]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[5]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[6]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[6]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[7]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[7]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[8]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[8]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[9]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[9]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
                InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Discoverdetails()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700],
                      image: DecorationImage(
                        image:
                            NetworkImage("${discoverCategories[10]["imgUrl"]}"),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                      child: Text(
                    '${discoverCategories[10]["title"]}',
                    style: GoogleFonts.raleway(
                        letterSpacing: .3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
             
              
            ],
          ),
        ),
      ),
    );
  }
}
