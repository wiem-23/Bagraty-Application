import 'package:bagraty_project/PopupCardConcentre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class AjoutFourragePopup extends StatelessWidget {
  const AjoutFourragePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo app',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Demo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String message;

  @override
  void initState() {
    super.initState();
    message =
        'Flutter popup card demo app. Click the account icon in the top right.';
  }

  Future<void> _fourrageClicked() async {
    final result = await showPopupCard<String>(
      context: context,
      builder: (context) {
        return PopupCard(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: const PopupCardConcentre(),
        );
      },
      offset: const Offset(-8, 60),
      alignment: Alignment.topRight,
      useSafeArea: true,
      dimBackground: true,
    );
    if (result == null) return;
    setState(() {
      message = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _fourrageClicked,
            icon: const Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            message = 'Reset.';
          });
        },
        child: const Icon(Icons.restore),
      ),
    );
  }
}
