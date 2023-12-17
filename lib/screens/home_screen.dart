import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;
  bool gameHasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              clearGame();
            },
            icon: Icon(Icons.refresh),
          )
        ],
        centerTitle: true,
        title: Text(
          
          'Tic Tac Toe',
        ),
        backgroundColor: Color.fromARGB(180, 22, 22, 22),
        elevation: 3,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            getScoreBorader(),
            SizedBox(height: 12),
            getGrid(),
            getResultButton(),
            SizedBox(height: 75),
            getTurn(),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () {
          setState(() {
            gameHasResult = false;
            clearGame();
          });
        },
        child: Text(
          '$winnerTitle, Play again!',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget getScoreBorader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreO',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$scoreX',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getGrid() {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                tapped(index);
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: Color.fromARGB(255, 190, 202, 16), width: 1.5),
                ),
                child: Center(
                  child: Text(xOrOList[index],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color:
                            xOrOList[index] == 'O' ? Colors.red : Colors.green,
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void checkWineer() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'Winner is ' + xOrOList[0]);
      return;
    }

    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      setResult(xOrOList[3], 'Winner is ' + xOrOList[3]);

      return;
    }

    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      setResult(xOrOList[6], 'Winner is ' + xOrOList[6]);

      return;
    }

    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'Winner is ' + xOrOList[0]);
      return;
    }

    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      setResult(xOrOList[1], 'Winner is ' + xOrOList[1]);
      return;
    }

    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'Winner is ' + xOrOList[2]);
      return;
    }

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'Winner is ' + xOrOList[0]);
      return;
    }

    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'Winner is ' + xOrOList[2]);
      return;
    }

    if (filledBoxes == 9) {
      setResult('', 'Draw');
    }
  }

  void tapped(int index) {
    if (gameHasResult) {
      return;
    }
    setState(() {
      if (xOrOList[index] != '') {
        return;
      }

      if (isTurnO) {
        xOrOList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOrOList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }

      isTurnO = !isTurnO;

      checkWineer();
    });
  }

  void setResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      winnerTitle = title;
      if (winner == 'X') {
        scoreX = scoreX + 1;
      } else if (winner == 'O') {
        scoreO = scoreO + 1;
      } else {
        scoreX = scoreX + 1;
        scoreO = scoreO + 1;
      }
    });
  }

  void clearGame() {
    setState(() {
      for (var i = 0; i < xOrOList.length; i++) {
        xOrOList[i] = '';
      }
    });
    filledBoxes = 0;
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
