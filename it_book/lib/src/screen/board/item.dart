import 'package:flutter/material.dart';
import 'package:it_book/src/screen/board/board_show.dart';
import 'package:it_book/src/widget/book_prof.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BoardShow()),
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookProf(),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Doit! 알고리즘 입문',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('저자 : 김종관'),
                SizedBox(
                  height: 5,
                ),
                Text('출판 : 이지스퍼블리싱'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
