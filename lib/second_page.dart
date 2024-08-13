import 'package:flutter/material.dart';
import 'package:shayri/List.dart';
import 'package:shayri/third_page.dart';

class Second_page extends StatelessWidget with ShayariList {
  Second_page({super.key, required this.categoryIndex});

  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            shayaries[categoryIndex]['title'],
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
      body: Stack(
        children: [
          Image.asset(
            'asset/back.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          ListView.separated(
            itemCount: shayaries[categoryIndex]['shayaries'].length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Third_page(
                          data: shayaries[categoryIndex],
                          initialPage: index, categoryIndex: index, zero: index,
                        ),
                      ));
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Row(children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              shayaries[categoryIndex]['shayaries'][index],
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_double_arrow_right,
                              size: 40, color: Colors.black87),
                        ),
                      ]),
                    )),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 15,
              color: Colors.white,
              indent: 20,
              endIndent: 20,
            ),
          ),
        ],
      ),
    );
  }
}
