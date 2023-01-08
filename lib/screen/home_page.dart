import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openaiapp/blocs/request/request_bloc.dart';
import 'package:openaiapp/constants/app_color.dart';
import 'package:openaiapp/extensions/text_style_extension.dart';
import 'package:openaiapp/model/request/openai_request_model.dart';
import 'package:openaiapp/model/response/openai_response_model.dart';
import 'package:openaiapp/network/api_response.dart';

import 'package:openaiapp/widgets/custom_textfield.dart';
import 'package:openaiapp/widgets/loading_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = RequestBloc();
  TextEditingController controller = TextEditingController();
  String? question;
  TextStyle style = const TextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0.w, 16.0.h, 16.0.w, 0.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question ?? '', style: style.font15.w5.tGreyShade3),
                // SizedBox(height: 4.0.h),
                StreamBuilder<ApiResponse<OpenaiResponseModel>>(
                    stream: _bloc.dataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data!.status) {
                          case Status.loading:
                            return Center(child: LoadingScreen());
                          case Status.completed:
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data?.data.choices?.length,
                              itemBuilder: (context, index) {
                                return Text(
                                    snapshot.data?.data.choices![0]?.text ?? '',
                                    textAlign: TextAlign.justify,
                                    style: style.font14.w4.tGrayShade2);
                              },
                            );
                          case Status.error:
                        }
                      }
                      return Text('');
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 295.w,
                height: 95.h,
                child: Customtextfield(
                  controller: controller,
                  hintText: "Ask question here...",
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 40.0.h), child: _sendButton())
          ],
        ),
      ),
    );
  }

  Widget _sendButton() {
    return IconButton(
      onPressed: () {
        OpenaiRequestModel request = OpenaiRequestModel(
            model: "text-davinci-002",
            prompt: controller.text,
            maxTokens: 3900,
            temperature: 0.5,
            topP: 1,
            frequencyPenalty: 1,
            presencePenalty: 1);
        _bloc.fetchData(request);
        setState(() {
          question = controller.text;
        });
        controller.clear();
      },
      icon: Icon(Icons.send, size: 30, color: kOrange_500),
    );
  }

  Widget _disabledButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.send, size: 30, color: kGrey400),
    );
  }
}
