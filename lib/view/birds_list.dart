import 'package:flutter/material.dart';

import '../providers/birds_provider.dart';

class BirdsList extends StatefulWidget {
  @override
  _BirdsListState createState() => _BirdsListState();
}

class _BirdsListState extends State<BirdsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        alignment: WrapAlignment.spaceAround,
        runSpacing: 10,
        children: Birds.birdsList.map((bird) {
          return bird.image.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                        child:
                            Image.asset(bird.image[0], fit: BoxFit.fitHeight),
                        footer: Container(
                          color: Colors.white.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              bird.name,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
        }).toList(),
      ),
    );
  }
}
