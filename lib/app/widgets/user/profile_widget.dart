import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  final String title;
  const UserProfileWidget({Key? key, this.title = "UserProfileWidget"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12.withOpacity(0.08)),
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl:
                        'https://logodownload.org/wp-content/uploads/2015/12/dhl-logo-2.png'),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nome",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Thiago",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Empresa",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          Text("DHL",
                              style: Theme.of(context).textTheme.displaySmall)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ID do usuario",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "1323232",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ]));
  }
}
