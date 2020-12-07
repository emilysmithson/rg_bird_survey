import 'package:flutter/material.dart';
import 'package:rg_bird_survey/providers/birdboxes_provider.dart';
import '../providers/birds_provider.dart';

class BirdBoxList extends StatefulWidget {
  @override
  _BirdBoxListState createState() => _BirdBoxListState();
}

class _BirdBoxListState extends State<BirdBoxList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: BirdBoxes.birdBoxesList.length,
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
                                  BirdBoxes.birdBoxesList[index].boxType.image,
                                  fit: BoxFit.fill,
                                ))),
                      ),
                      Expanded(
                          child: Center(child: Text(BirdBoxes.birdBoxesList[index].id.toString(), style: TextStyle(fontSize: 24),)))
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
