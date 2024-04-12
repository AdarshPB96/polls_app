import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poll_app/constants/constants.dart';
import 'package:poll_app/models/poll_model.dart';
import 'package:poll_app/provider/main_provider.dart';
import 'package:poll_app/view/commen_widgets/designed_widgets.dart';
import 'package:provider/provider.dart';

class AllPollScreen extends StatelessWidget {
  const AllPollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<MainProvider>(context);
    return Scaffold(
      appBar: GlobalVariables.appBar('All Polls'),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Poll>>(
                future: provider.fetchPolls(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final polls = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final poll = polls[index];

                      return Column(
                        children: [
                          GlobalVariables.height20,
                          DesignedContainerTile(
                            changeBorderColor: true,
                            width: size.width * 0.94,
                            widget: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                children: [
                                  GlobalVariables.height10,
                                  Center(
                                      child: Text(
                                    poll.topic,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )),
                                  Text(
                                    poll.statement,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  GlobalVariables.height10,
                                  const Text(
                                    'US Intel Aids Canada in Nijjar Case ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  GlobalVariables.height10,
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Follow ',
                                          style: TextStyle(
                                              color: GlobalVariables.mainColor),
                                        ),
                                        const TextSpan(
                                          text: '@ TOI| Today',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GlobalVariables.height20,
                                  DesignedContainerTile(
                                    changeBorderColor: true,
                                    height: size.height * 0.07,
                                    width: size.width * 1,
                                    widget: OptionContainStack(
                                      text: poll.textOptions.isNotEmpty
                                          ? poll.textOptions[0]
                                          : '',
                                    ),
                                  ),
                                  GlobalVariables.height10,
                                  DesignedContainerTile(
                                    changeBorderColor: true,
                                    height: size.height * 0.07,
                                    width: size.width * 1,
                                    widget: OptionContainStack(
                                      text: poll.textOptions.length > 1
                                          ? poll.textOptions[1]
                                          : '',
                                    ),
                                  ),
                                  GlobalVariables.height10,
                                  DesignedContainerTile(
                                    changeBorderColor: true,
                                    height: size.height * 0.07,
                                    width: size.width * 1,
                                    widget: OptionContainStack(
                                      text: poll.textOptions.length > 2
                                          ? poll.textOptions[2]
                                          : '',
                                    ),
                                  ),
                                  GlobalVariables.height10,
                                  DesignedContainerTile(
                                    changeBorderColor: true,
                                    height: size.height * 0.07,
                                    width: size.width * 1,
                                    widget: OptionContainStack(
                                      text: poll.textOptions.length > 3
                                          ? poll.textOptions[3]
                                          : '',
                                    ),
                                  ),
                                  GlobalVariables.height20,
                                  Row(
                                    children: [
                                      GlobalVariables.width10,
                                      SvgPicture.asset(
                                        GlobalVariables.svgMessage,
                                        width: 24,
                                        height: 24,
                                      ),
                                      GlobalVariables.width10,
                                      Text(
                                        '4.5k comments',
                                        style: TextStyle(
                                            color: GlobalVariables.mainColor),
                                      ),
                                      GlobalVariables.width40,
                                      SvgPicture.asset(
                                        GlobalVariables.svgSent,
                                        width: 24,
                                        height: 24,
                                      ),
                                      GlobalVariables.width10,
                                      Text(
                                        'Share',
                                        style: TextStyle(
                                            color: GlobalVariables.mainColor),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: GlobalVariables.mainColor,
                                    thickness: 0.8,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  GlobalVariables.height20,
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 13,
                                        child: SvgPicture.asset(
                                          GlobalVariables.svgProfile,
                                        ),
                                      ),
                                      GlobalVariables.width10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Times of India (TOI)'),
                                          const Text(
                                            'Us intel ... comments...',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              ),
                                              GlobalVariables.width10,
                                              const Text(
                                                '2.1K',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w200),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: polls.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
