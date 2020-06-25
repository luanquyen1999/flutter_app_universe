import 'package:flutter/material.dart';
import 'package:flutter_app_universe/constants.dart';
import 'package:flutter_app_universe/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children:<Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        SizedBox(height: 360,),
                        Text(
                            planetInfo.name,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w900,
                          fontSize: 56,
                          color: primaryTextColor,
                        ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Solar System",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w300,
                            fontSize: 31,
                            color: primaryTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38,),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff47455f),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 32),
                    height: 250,
                    child: ListView.builder(
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                            child: Image.network(
                                planetInfo.images[index],
                            fit: BoxFit.cover,
                            ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -64,
                child: Hero(
                  tag:planetInfo.position,
                  child: Image.asset(
                      planetInfo.iconImage,
                  ),
                ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
