import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shayri/List.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

List<String> emoji = [
  '😘❤💋😘❤🌹',
  '❤✨🥰🦋❤🌹',
  '♥❤♥❤♥❣‍',
  '💏❤‍🔥💋❤‍🩹💍🙏',
  '❤‍🔥🥵💔🔛❤‍🩹',
  '🧸❤✨⌛❤‍🩹♾',
  '❤🔒🍀😊🌈❤',
  '📝💌❤‍🔥🕊🥀❤',
  '💓😘💋💕😉😘',
  '😜😘👅😗+❤=😘',
  '🤗😘💐😘🥰😍',
  '💋😊😲👩‍❤‍💋‍👨😘🕊',
  '❤´艸｀❤',
  '(｡◕‿◕｡)➜❤｡◕‿◕｡',
  '🥺🥀❤‍🩹😭😔💔',
  '😡😭💔🚫❤😮‍💨',
  '👩‍👧‍👦❤🌍😇👸🏻🤱',
  '💌🧚‍♀💗🌨🥡🍥',
  '👨🏻‍💼💎🫧💗✨👨‍👧‍👦',
  '💝🌎🌹🕊𓆩♡𓆪',
  '🎯💖🧿🦋🕊🏆',
  '💔🥀😭🖤🤕💔🪽',
  '🥀💔.....🥺🩹',
  '❤‍🩹🫠🩹❤‍🔥❌',
  '🪖🫡🎖⚔🥷🏿👮',
  '⌖👩🏻‍✈🔰⚚★★★',
];

List<String> font = [
  'f1',
  'f2',
  'f3',
  'f4',
  'f5',
  'f6',
  'f7',
  'f8',
  'f9',
  'f10',
  'f11',
  'f12',
  'f13',
  'f14',
  'f15',
];

class Four_page extends StatefulWidget with ShayariList {
  Four_page(
      {super.key,
      required this.shayari,
      required this.initialPage,
      required this.title});

  final String shayari;
  final int initialPage;
  final String title;

  @override
  State<Four_page> createState() => _Four_pageState();
}

class _Four_pageState extends State<Four_page> {
  final controller = PageController();
  var bgcolor = Colors.yellow.shade200;
  var fontcolor = Colors.black;
  var fontFamily = 'f1';
  var emojies = ' ';
  var fontsize = 18.0;

  final WidgetsToImageController _widgetsToImageController =
      WidgetsToImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black12,
      ),
      body: Stack(children: [
        Image.asset(
          'asset/back.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: WidgetsToImage(
              controller: _widgetsToImageController,
              child: Card(
                color: bgcolor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      '$emojies\n${widget.shayari}\n$emojies',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontsize,
                          color: fontcolor,
                          fontFamily: fontFamily),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        height: 230,
        margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.white.withOpacity(0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh_sharp),
                    iconSize: 25,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.fullscreen_sharp),
                    iconSize: 25,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  mainAxisSpacing: 7,
                                  crossAxisSpacing: 7),
                          itemBuilder: (context, index) {
                            Color color = Color.fromARGB(
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255));
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  bgcolor = color;
                                });
                              },
                              child: Container(color: color),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(150, 126, 118, 10)),
                    child: const Center(
                      child: Text(
                        "Background",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  mainAxisSpacing: 7,
                                  crossAxisSpacing: 7),
                          itemBuilder: (context, index) {
                            Color font = Color.fromARGB(
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255),
                                Random().nextInt(255));
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  fontcolor = font;
                                });
                              },
                              child: Container(color: font),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsetsDirectional.all(20),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(150, 126, 118, 10)),
                    child: const Center(
                      child: Text(
                        "Text Color",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: _shareImage,
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(150, 126, 118, 10)),
                    child: const Center(
                      child: Text(
                        "Share",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 10),
                          itemCount: font.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  fontFamily = font[index];
                                });
                              },
                              child: Container(
                                margin: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: Center(
                                  child: Text(
                                    font[index],
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    //  color: Colors.yellowAccent.shade100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(150, 126, 118, 10)),
                    child: const Center(
                      child: Text(
                        "Font",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 10),
                          itemCount: emoji.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  emojies = emoji[index];
                                });
                              },
                              child: Container(
                                margin: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: Center(
                                  child: Text(
                                    emoji[index],
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsetsDirectional.all(20),
                    width: 100,
                    height: 50,
                    //  color: Colors.yellowAccent.shade100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(150, 126, 118, 10)),
                    child: const Center(
                      child: Text(
                        "Emoji",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState1) => SizedBox(
                            height: 100,
                            child: Slider(
                              value: fontsize,
                              max: 40,
                              min: 10,
                              onChanged: (double value) {
                                setState(() {
                                  setState1(() {
                                    fontsize = value;
                                  });
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    //  color: Colors.yellowAccent.shade100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(150, 126, 118, 10)),
                    child: const Center(
                      child: Text(
                        "Text Size",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareImage() async {
    print('1. _VK_ Share button Tapped');
    File file = await _createFile();
    print('1. _VK_ Sharing File');
    await _shareImageFile(file);
  }

  Future<File> _createFile() async {
    print('1. _VK_ Creating File');

    Uint8List? unit8List = await _widgetsToImageController.capture();
    String filePath = await _createEmptyFile();
    print('1. _VK_ File Created');

    File imageFile = File(filePath);
    imageFile.writeAsBytesSync(unit8List as List<int>);
    await imageFile.create();
    return imageFile;
  }

  Future<String> _createEmptyFile() async {
    print('1. _VK_ Creating Folder');
    String folderPath = await _createFolder();
    String fileName = "Test.jpg";
    return '$folderPath/$fileName';
  }

  Future<String> _createFolder() async {
    const folderName = "Shayari Image";
    final path = Directory("storage/emulated/0/Download/$folderName");
    if (!(await path.exists())) {
      await path.create();
      print('1. _VK_ Path created');
    }
    return path.path;
  }

  Future<void> _shareImageFile(File file) async {
    final result = await Share.shareFiles([file.path], text: 'Great picture');
    print('1. _VK_ File Shared successfully');
  }
}
//https://pub.dev/packages/permission_handler