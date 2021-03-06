import 'package:flutter/material.dart';

import '../providers/birds_provider.dart';

class BirdsList extends StatefulWidget {
  @override
  _BirdsListState createState() => _BirdsListState();
}

class _BirdsListState extends State<BirdsList> {
  int _currentBird = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 10,
            children: Birds.birdsList.map((bird) {
              return bird.image.isEmpty
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentBird = bird.birdNumber;
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width:
                                      bird.birdNumber == _currentBird ? 3 : 0,
                                  color: bird.birdNumber == _currentBird
                                      ? Colors.black
                                      : Colors.white.withOpacity(1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              clipBehavior: Clip.hardEdge,
                              child: GridTile(
                                child: Image.asset(bird.image[0],
                                    fit: BoxFit.fitHeight),
                                footer: Container(
                                  color: Colors.white.withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      bird.name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    );
            }).toList(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(Birds.birdsList[_currentBird].image[0],
                        fit: BoxFit.fitHeight),
                  ),
                  Text(Birds.birdsList[_currentBird].name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4),
                  Text(Birds.birdsList[_currentBird].description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
