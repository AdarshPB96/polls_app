import 'package:flutter/material.dart';
import 'package:poll_app/constants/constants.dart';
import 'package:poll_app/provider/main_provider.dart';
import 'package:poll_app/view/commen_widgets/buttons.dart';
import 'package:poll_app/view/commen_widgets/designed_widgets.dart';
import 'package:provider/provider.dart';

class AddPollScreen extends StatelessWidget {
  const AddPollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: GlobalVariables.appBar('Moderators Poll'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalVariables.height30,
                const Center(
                  child: Text(
                    "Create Poll",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                GlobalVariables.height30,
                const Text(
                  'TOPIC',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
                GlobalVariables.height20,
                DesignedContainerTile(
                  height: 90,
                  width: double.infinity,
                  widget: TextField(
                    controller: provider.topicController,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'write here...',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 63, 59, 59)),
                      border: InputBorder.none, 
                    ),
                  ),
                ),

                GlobalVariables.height30,
                const Text(
                  'Statement',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
                GlobalVariables.height20,
                DesignedContainerTile(
                  height: 90,
                  width: double.infinity,
                  widget: TextField(
                    controller: provider.statementController,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'Write here...',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 63, 59, 59)),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                GlobalVariables.height40,
                Consumer<MainProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DesignedContainerTile(
                          width: size.height * 0.1,
                          widget: Column(
                            children: [
                              GlobalVariables.height10,
                              const Text('MCQ'),
                              const Text('Poll'),
                              Radio(
                                value: 1, 
                                groupValue: provider.selectedValue,
                                onChanged: (value) {
                                  provider.setSelectedValue(
                                      value!);
                                },
                                activeColor: GlobalVariables.mainColor,
                              )
                            ],
                          ),
                        ),
                        DesignedContainerTile(
                          width: size.height * 0.1,
                          widget: Column(
                            children: [
                              GlobalVariables.height10,
                              const Text('Picture'),
                              const Text('Poll'),
                              Radio(
                                value: 2, 
                                groupValue: provider.selectedValue,
                                onChanged: (value) {
                                  provider.setSelectedValue(
                                      value!); 
                                },
                                activeColor: GlobalVariables.mainColor,
                              )
                            ],
                          ),
                        ),
                        DesignedContainerTile(
                          width: size.height * 0.1,
                          widget: Column(
                            children: [
                              GlobalVariables.height10,
                              const Text('Rate it'),
                              const Text('Poll'),
                              Radio(
                                value: 3,
                                groupValue: provider.selectedValue,
                                onChanged: (value) {
                                  provider.setSelectedValue(value!);
                                },
                                activeColor: GlobalVariables.mainColor,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                GlobalVariables.height30,
                DesignedContainerTile(
                  changeBorderColor: true,
                  height: size.height * 0.07,
                  width: size.width * 1,
                  widget: OptionTextfield(
                      optionsController: provider.options1Controller,
                      text: 'Option 1'),
                ),
                GlobalVariables.height20,
                DesignedContainerTile(
                  changeBorderColor: true,
                  height: size.height * 0.07,
                  width: size.width * 1,
                  widget: OptionTextfield(
                      optionsController: provider.options2Controller,
                      text: 'Option 2'),
                ),
                GlobalVariables.height20,
                DesignedContainerTile(
                  changeBorderColor: true,
                  height: size.height * 0.07,
                  width: size.width * 1,
                  widget: OptionTextfield(
                      optionsController: provider.options3Controller,
                      text: 'Option 3'),
                ),
                GlobalVariables.height20,
                DesignedContainerTile(
                  changeBorderColor: true,
                  height: size.height * 0.07,
                  width: size.width * 1,
                  widget: OptionTextfield(
                      optionsController: provider.options4Controller,
                      text: 'Option 4'),
                ),
                GlobalVariables.height30,
                Center(
                  child: CustomElevatedButton(
                    text: "Submit",
                    onPressed: () {
                      provider.createPoll(context);
                    },
                  ),
                ),
                GlobalVariables.height20,
              ]),
        ),
      ),
    );
  }
}


