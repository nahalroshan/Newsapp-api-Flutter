import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertechnews/backend/functions.dart';
import 'package:fluttertechnews/components/appbar.dart';
import 'package:fluttertechnews/components/newsbox.dart';
import 'package:fluttertechnews/components/searchbar.dart';
import 'package:fluttertechnews/utils/colors.dart';
import 'package:fluttertechnews/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news; //late result
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        actions: [],
        backgroundColor: AppColors.black,
        elevation: 0,
        title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tech News',
                style:
                    GoogleFonts.kanit(fontSize: 25, color: AppColors.primary),
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Searchbar(),
        Expanded(
            child: Container(
          width: w,
          child: FutureBuilder<List>(
            future: fetchnews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return NewsBox(
                          imageurl: snapshot.data![index]['urlToImage'] != null
                              ? snapshot.data![index]['urlToImage']
                              : ConsRtants.imageUrl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description:
                              snapshot.data![index]['description'].toString(),
                          url: snapshot.data![index]['url']);
                    });
              } else if (snapshot.hasError) {
                return Text('Error');
              }
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            },
          ),
        ))
      ]),
    );
  }
}
