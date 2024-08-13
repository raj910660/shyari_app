import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:shayri/List.dart';
import 'package:shayri/four_page.dart';

class Third_page extends StatefulWidget with ShayariList {
  Third_page(
      {super.key,
      required this.data,
      required this.initialPage,
      required this.categoryIndex,
      required this.zero});

  final Map data;
  final int initialPage;
  final int categoryIndex;
  int zero;

  @override
  State<Third_page> createState() => _Third_pageState();
}

class _Third_pageState extends State<Third_page> {
  late final PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              widget.data['title'],
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
          PageView.builder(
            controller: controller,
            itemCount: widget.shayaries[widget.categoryIndex]['shayaries'].length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) => widget.zero = value,
            itemBuilder: (context, index) {
              return Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Card(
                    // margin: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 300),
                    color: Colors.white.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          widget.data['shayaries'][index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ]),
        bottomNavigationBar: Container(
          height: 50,
          margin: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 90,
                child: Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () async {
                      await FlutterClipboard.copy(
                          widget.data['shayaries'][widget.zero]);
                      Fluttertoast.showToast(
                        msg: "Copied ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: const Icon(Icons.copy_all_rounded),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  icon: const Icon(Icons.keyboard_double_arrow_left)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Four_page(
                            shayari: widget.data['shayaries'][widget.zero],
                            initialPage: widget.initialPage,
                            title: widget.data['title'],
                          ),
                        ));
                  },
                  icon: const Icon(Icons.edit_off)),
              IconButton(
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  icon: const Icon(Icons.keyboard_double_arrow_right)),
              IconButton(
                  onPressed: () async {
                    await Share.share(widget.data['shayaries'][widget.zero]);
                  },
                  icon: const Icon(Icons.share)),
            ],
          ),
        ));
  }
}
