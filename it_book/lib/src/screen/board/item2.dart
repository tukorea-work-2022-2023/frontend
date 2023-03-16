import 'package:flutter/material.dart';
import 'package:it_book/src/widget/book_prof.dart';

class FeedItem2 extends StatelessWidget {
  const FeedItem2({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const FeedShow()),
      //   );
      // },
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/swift.png')),
              ),
            ),
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
                      'Swift스위프트로 시작하는 iOS개발',
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
                const Text('저자 : 야곰'),
                SizedBox(
                  height: 5,
                ),
                Text('출판 : 한빛미디어'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
