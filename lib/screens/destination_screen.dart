import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  static const routeName = '/destinationScreen';
  final Destination destination;

  const DestinationScreen({Key key, this.destination}) : super(key: key);
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        actionsForegroundColor: CupertinoColors.black,
        backgroundColor: CupertinoColors.tertiarySystemFill,
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.search,
              color: CupertinoColors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.filter_list,
              color: CupertinoColors.black,
            ),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage('${widget.destination.imageUrl}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
