import 'package:flutter/material.dart';
import 'package:news_json/screens/newsScreen/provider/newsProvider.dart';
import 'package:provider/provider.dart';

class news_screen extends StatefulWidget {
  const news_screen({Key? key}) : super(key: key);

  @override
  State<news_screen> createState() => _news_screenState();
}

class _news_screenState extends State<news_screen> {
  newsProvider? ht, hf;

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<newsProvider>(context, listen: true);
    hf = Provider.of<newsProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Json Data",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.grey.shade700,
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  ht!.jsonFactory();
                },
                child: Text("Show News Json Data")),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: hf!.newsModal != null
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${ht!.newsModal!.articleList![index].s1!.name}"),
                          subtitle: Text("${ht!.newsModal!.articleList![index].url}"),
                          minVerticalPadding: 15,
                        );
                      },
                      itemCount: hf!.newsModal!.articleList!.length,
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
