import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard(
      {super.key,
      required this.image,
      required this.singtitle,
      required this.desc,
      required this.index,
      required this.type});
  final image, singtitle, desc, index, type;

  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 4,
      margin: EdgeInsets.all(8),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  height: 150,
                  width: 250,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ))),
          // Background image

          // Gradient shade
          Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  // Color.fromARGB(255, 17, 17, 17).withOpacity(0.7),
                  Color.fromARGB(255, 17, 17, 17).withOpacity(0.7)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // height: 10,
                        // width: 30,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 1),
                          child: Text(
                            type.toString(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        // height: 10,
                        // width: 30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '#' + (index + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        singtitle.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 8),
                      if (desc != '')
                        Text(
                          desc.toString(),
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Song details
        ],
      ),
    );
  }
}
