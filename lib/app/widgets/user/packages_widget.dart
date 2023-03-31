import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PackagesWidget extends StatelessWidget {
  final String title;
  const PackagesWidget({Key? key, this.title = "PackagesWidget"})
      : super(key: key);

  Widget renderItemBlock(context, data) {
    return GestureDetector(
        onTap: () =>
            Modular.to.pushNamed('/package', arguments: {'id': 123456}),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12),
              color: Colors.lightBlueAccent.withOpacity(0.03)),
          padding:
              const EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Pacote nº",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).highlightColor,
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        "123456",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2),
                      ),
                    )
                  ],
                ),
                Row()
              ],
            ),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 35,
                  color: Colors.black54,
                )
              ],
            )
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            flex: 6,
            child: Divider(
              endIndent: 15,
              thickness: 1,
              height: 1,
              color: Colors.black38,
            ),
          ),
          // ignore: prefer_const_constructors
          Expanded(
              flex: 5,
              child: const Center(
                child: Text(
                  "Meus Pacotes",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
              )),
          // ignore: prefer_const_constructors
          Expanded(
            flex: 6,
            child: const Divider(
              indent: 15,
              thickness: 1,
              height: 1,
              color: Colors.black38,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) => renderItemBlock(context, {})),
          separatorBuilder: ((context, index) => Divider()),
          itemCount: 2)
    ]);
  }
}
