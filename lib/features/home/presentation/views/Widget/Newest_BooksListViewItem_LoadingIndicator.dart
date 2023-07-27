import 'package:flutter/material.dart';

class NewestBooks_ListViewItem_LoadingIndicator extends StatelessWidget {
  const NewestBooks_ListViewItem_LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 10),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.6 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[100],
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width * .5,
                      color: Colors.grey[100],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 8,
                      width: MediaQuery.of(context).size.width * .4,
                      color: Colors.grey[100],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 6,
                      width: MediaQuery.of(context).size.width * .3,
                      color: Colors.grey[100],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
