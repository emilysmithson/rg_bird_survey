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
        body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: Birds.birds.length - 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        width: 80,
                        height: 80,
                        child: ClipOval(
                            child: Image.asset(
                          Birds.birds[index].image[0],
                          fit: BoxFit.fill,
                        ))),
                  ),
                  Expanded(
                      child: Center(child: Text(Birds.birds[index].name, style: TextStyle(fontSize: 24),)))
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
