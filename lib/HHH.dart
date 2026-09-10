import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int volume = 5;
  bool isMuted = false;

  void increaseVolume() {
    setState(() {
      if (volume < 10) {
        volume++;
      }

      isMuted = false;
    });
  }

  void decreaseVolume() {
    setState(() {
      if (volume > 0) {
        volume--;
      }

      if (volume == 0) {
        isMuted = true;
      }
    });
  }

  void muteVolume() {
    setState(() {
      volume = 0;
      isMuted = true;
    });
  }

  void unmuteVolume() {
    setState(() {
      volume = 5;
      isMuted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Volume Page'),

        leading: const Icon(
          Icons.volume_up,
        ),

        actions: [
          IconButton(
            onPressed: isMuted ? unmuteVolume : muteVolume,
            icon: Icon(
              isMuted
                  ? Icons.volume_off
                  : Icons.volume_mute,
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 300,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 2,
                ),
              ),

              child: IconButton(
                onPressed: increaseVolume,
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 2,
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    isMuted
                        ? Icons.volume_off
                        : Icons.volume_up,
                    size: 45,
                  ),

                  const SizedBox(width: 20),

                  Text(
                    '$volume',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Hint
            if (volume == 0)
              const Text(
                'Volume is muted',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

            if (volume == 10)
              const Text(
                'Maximum volume',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

            const SizedBox(height: 20),

            Container(
              width: 300,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 2,
                ),
              ),

              child: IconButton(
                onPressed: decreaseVolume,
                icon: const Icon(
                  Icons.remove,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}