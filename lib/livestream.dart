import 'package:crime_detection/register.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

import 'const.dart';

class MyLive extends StatelessWidget {
  final String liveID;
  final bool isHost;
  const MyLive({Key? key,required this.liveID, required this.isHost}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: Constants.appId,
        appSign: Constants.appSign,
        userID: MyRegister.userId,
        userName: MyRegister.name,
        liveID: liveID,
        config: isHost? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            :ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      )
    );
  }
}
