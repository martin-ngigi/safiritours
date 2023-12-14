import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

class ProgressLoader{
  show({bool dismissOnTap = true}){
    ///show loading progress indicator
    // EasyLoading.instance..loadingStyle = EasyLoadingStyle.light;
    EasyLoading.instance..indicatorType = EasyLoadingIndicatorType.fadingCircle;

    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: dismissOnTap
    );
  }

  dismiss(){
    /// dismiss the progress indicator
    EasyLoading.dismiss();
  }
}