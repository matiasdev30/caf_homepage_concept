import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:caf_homepage_concept/const/const.dart';
import 'package:caf_homepage_concept/model/players.dart';
import 'package:caf_homepage_concept/widget/animated_toggle.dart';
import 'package:caf_homepage_concept/widget/shirt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, SingleTickerProviderStateMixin {
  //Animations variables
  late AnimationController _controller;
  late Animation _fieldAnimation;
  late Animation _playerPictureAnimation;
  late Animation _contentAnimation;
  late Animation _fabAnimation;

  //variable for verify, time select
  String timeSelect = 'Senegal';

  Players actualPlayer = senegalListPlayers[9];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _fieldAnimation = Tween(begin: 0.0, end: 500.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));
    _contentAnimation = Tween(begin: 0.0, end: 50.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.20, 0.40, curve: Curves.easeOut)));
    _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 0.70, curve: Curves.easeOut)));
    _playerPictureAnimation = Tween(begin: 0.0, end: 600.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.40, curve: Curves.easeOut)));
    _controller.forward();
    // ignore: avoid_single_cascade_in_expression_statements
    _controller
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    //Initialize global const varible of screen size
    widthScreen = MediaQuery.of(context).size.width;
    heigthScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              child: Row(
                children: [
                  /***********************************************************/
                  leftBar(timeSelect == 'Senegal' ? imgManeBack : imgSalahBack),
                  /***********************************************************/
                  Container(
                    padding:
                        const EdgeInsets.only(right: 30, top: 10, bottom: 20),
                    height: heigthScreen,
                    width: widthScreen! - widthScreen! * .35,
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedToggle(
                              values: const ['Senegal', 'Egipt'],
                              onToggle: () {
                                setState(() {
                                  timeSelect = timeSelect == 'Senegal'
                                      ? 'Egipt'
                                      : 'Senegal';

                                  actualPlayer = timeSelect == 'Senegal'
                                      ? senegalListPlayers[9]
                                      : egiptListPlayers[9];
                                });
                                _controller.forward(from: 0);
                              },
                            ),
                            /***********************************************************/
                            scoreBoard(),
                            /***********************************************************/
                            const Spacer(),
                            /***********************************************************/
                            playerData(actualPlayer),
                            /***********************************************************/
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        /***********************************************************/
                        detailsGameCard(),
                        /***********************************************************/
                      ],
                    ),
                  )
                ],
              ),
            ),
            /***********************************************************/
            playerCard(timeSelect == 'Senegal' ? imgMane : imgSalah)
            /***********************************************************/
          ],
        ));
  }

  detailsGameCard() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          width: widthScreen! * .23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 35,
                width: widthScreen! * .23 - 80,
                decoration: const BoxDecoration(
                  color: Color(0xffF1F3F0),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Player',
                      style: TextStyle(color: greenCAF, fontSize: 14),
                    ),
                    const Spacer(),
                    Container(
                      width: 50,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: yelowCAF,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: greenCAF,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(imgCAF),
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: widthScreen! * .23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TATICAL SCHEMA',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(timeSelect == 'Senegal' ? '4-2-3-1' : '4-3-3'),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'COACH',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(timeSelect == 'Senegal'
                          ? 'Aliou Cisse'
                          : 'Carlos Queiroz'),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(timeSelect == 'Senegal'
                        ? imgCoachSenegal
                        : imgCoachEgipt),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        /***********************************************************/
        field(),
        /***********************************************************/
      ],
    );
  }

  scoreBoard() {
    return SizedBox(
      width: 280,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage(imgFlagSenegal),
              ),
              Text('0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('-',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text('0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              CircleAvatar(
                backgroundImage: AssetImage(imgFlagEgipt),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('4',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text('-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text('2',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          const Text('Big penalties'),
        ],
      ),
    );
  }

  field() {
    return Container(
        height: _fieldAnimation.value,
        width: widthScreen! * .23,
        decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage(imgField), fit: BoxFit.cover)),
        child: timeSelect == 'Senegal' ? schemaSenegal() : schemaEgipt());
  }

  playerData(Players player) {
    return Transform.scale(
      scale: _fabAnimation.value,
      child: SizedBox(
        height: 400,
        width: 300,
        child: Row(
          children: [
            SizedBox(
              height: 400,
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      player.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 80),
                    ),
                  ),
                  Text(
                    player.number.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 75),
                  ),
                  /**/
                ],
              ),
            ),
            SizedBox(
              height: 400,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clube',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(player.clube),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Position',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(player.position),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Heigth',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${player.heigth} M'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Foot',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(player.foot),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Debugt',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(player.debugt),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Market Value',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(player.marketValeu),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Birth Day',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(player.birthDay),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //I had a problem with setState, it was better to use GetX, but I had already
  //built 80% of the code so it gave this ugly thing, sorry
  schemaEgipt() {
    return Transform.scale(
      scale: _fabAnimation.value,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[10],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[10];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[9],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[9];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[8],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[8];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[7],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[7];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[6],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[6];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[5],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[5];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[4],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[4];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[3],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[3];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[2],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[2];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
              ShirtTeam(
                isSenegal: false,
                player: egiptListPlayers[1],
                onEnter: () {
                  setState(() {
                    actualPlayer = egiptListPlayers[1];
                  });
                },
                onExit: () {
                  setState(() {
                    actualPlayer = timeSelect == 'Senegal'
                        ? senegalListPlayers[9]
                        : egiptListPlayers[9];
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          ShirtTeam(
            isSenegal: false,
            player: egiptListPlayers[0],
            onEnter: () {
              setState(() {
                actualPlayer = egiptListPlayers[0];
              });
            },
            onExit: () {
              setState(() {
                actualPlayer = timeSelect == 'Senegal'
                    ? senegalListPlayers[9]
                    : egiptListPlayers[9];
              });
            },
          ),
        ],
      ),
    );
  }

  //I had a problem with setState, it was better to use GetX, but I had already
  //built 80% of the code so it gave this ugly thing, sorry
  schemaSenegal() {
    return Transform.scale(
        scale: _fabAnimation.value,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ShirtTeam(
              isSenegal: true,
              player: senegalListPlayers[10],
              onEnter: () {
                setState(() {
                  actualPlayer = senegalListPlayers[10];
                });
              },
              onExit: () {
                setState(() {
                  actualPlayer = timeSelect == 'Senegal'
                      ? senegalListPlayers[9]
                      : egiptListPlayers[9];
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[9],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[9];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[8],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[8];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[7],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[7];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[6],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[6];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[5],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[5];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[4],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[4];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[3],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[3];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[2],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[2];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
                ShirtTeam(
                  isSenegal: true,
                  player: senegalListPlayers[1],
                  onEnter: () {
                    setState(() {
                      actualPlayer = senegalListPlayers[1];
                    });
                  },
                  onExit: () {
                    setState(() {
                      actualPlayer = timeSelect == 'Senegal'
                          ? senegalListPlayers[9]
                          : egiptListPlayers[9];
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ShirtTeam(
              isSenegal: false,
              player: senegalListPlayers[0],
              onEnter: () {
                setState(() {
                  actualPlayer = senegalListPlayers[0];
                });
              },
              onExit: () {
                setState(() {
                  actualPlayer = timeSelect == 'Senegal'
                      ? senegalListPlayers[9]
                      : egiptListPlayers[9];
                });
              },
            ),
          ],
        ));
  }

  leftBar(String img) {
    return Container(
      height: heigthScreen,
      width: widthScreen! * .35,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img)),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(30),
        height: heigthScreen,
        width: widthScreen! * .35,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.green.withOpacity(0.8),
          Colors.yellow,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: const [
              Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'About',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Project',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: heigthScreen! - 98,
              width: widthScreen! * .15,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: heigthScreen! - 150,
                        width: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: heigthScreen! - 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            const Text('PERFOMANCE\nDATA 07/02',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            const SizedBox(
                              height: 60,
                            ),
                            const Text('GOALS',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text('20',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _contentAnimation.value,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                                'Lorem ipsum dolor sit amet\nsadipscing elitr.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10)),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('ASSIST',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text('4.0',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _contentAnimation.value,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                                'Lorem ipsum dolor sit amet\nsadipscing elitr.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10)),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('DISTANCE',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text('50',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: _contentAnimation.value,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                                'Lorem ipsum dolor sit amet\nsadipscing elitr.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        midiaBtn(title: 'Fb'),
                        midiaBtn(title: 'in'),
                        midiaBtn(title: 'Tw')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  midiaBtn({required String title}) {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // this widget show the picture player
  playerCard(String img) {
    return Positioned(
        top: 90,
        left: widthScreen! * .21,
        child: SizedBox(
          height: 580,
          width: 400,
          child: Stack(
            children: [
              Container(
                height: _playerPictureAnimation.value,
                width: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.contain),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 80,
                  width: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgRelva), fit: BoxFit.fill),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
