import 'package:flutter/material.dart';
import 'package:caf_homepage_concept/const/const.dart';
import 'package:caf_homepage_concept/model/players.dart';

class ShirtTeam extends StatefulWidget {
  final Players player;
  final bool isSenegal;
  final Function onEnter;
  final Function onExit;

  const ShirtTeam({
    Key? key,
    required this.player,
    required this.isSenegal,
    required this.onEnter,
    required this.onExit,
  }) : super(key: key);

  @override
  _ShirtTeamState createState() => _ShirtTeamState();
}

class _ShirtTeamState extends State<ShirtTeam> {
  double width = 40;
  double heigth = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (event) {
            setState(() {
              widget.onEnter();
              heigth = 50;
              width = 50;
            });
          },
          onExit: (event) {
            setState(() {
              widget.onExit();
              width = 40;
              heigth = 40;
            });
          },
          child: AnimatedContainer(
              width: width,
              height: heigth,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          widget.isSenegal ? imgShirtSenegal : imgShirtEgipt))),
              child: Center(
                child: Text(
                  widget.player.number.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: widget.isSenegal ? Colors.white : null,
                      fontSize: 12),
                ),
              )),
        ),
        Container(
          height: 10,
          width: 50,
          decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(
              widget.player.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 8),
            ),
          ),
        )
      ],
    );
  }
}
