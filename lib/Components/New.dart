import 'package:agriculture/Model/MDNew.dart' as obj;
import 'package:agriculture/Service/APICaller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class New extends StatelessWidget {
  const New({
    super.key,
    required this.newObject,
    required this.onTap,
  });
  final VoidCallback onTap;
  final obj.MDNew newObject;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFE3EDF6), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: mediaQueryData.size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        child: Image.network(
                            '${APICaller.getInstance().BASE_URL}${newObject.image}',
                            fit: BoxFit.cover, errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                          return const Icon(
                            Icons.question_mark_rounded,
                            size: 70,
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: const BoxDecoration(
                                color: Color(0xffcceeff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              '${newObject.title}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFF0060AF)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${newObject.description}',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xff2F3643))),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    return int.tryParse(str) != null || double.tryParse(str) != null;
  }
}
