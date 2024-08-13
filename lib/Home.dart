import 'package:flutter/material.dart';
import 'package:shayri/List.dart';
import 'package:shayri/second_page.dart';

class Home_page extends StatelessWidget with ShayariList {
  Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SHAYRI',
            style: TextStyle(
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
            itemCount: shayaries.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Second_page(categoryIndex: index),
                          ));
                    },
                    leading: Image.asset(shayaries[index]['image']),
                    title: Center(
                      child: Text(
                        shayaries[index]['title'],
                        style: const TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                    trailing: Icon(Icons.arrow_circle_right_outlined, size: 40),
                  ),
                ),
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
