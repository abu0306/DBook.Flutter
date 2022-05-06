import 'package:dbook/common/widgets/appBar.dart';
import 'package:dbook/common/widgets/base_container_view.dart';
import 'package:dbook/common/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'import_private_key_logic.dart';

class ImportPrivateKeyPage extends StatelessWidget {
  final logic = Get.put(ImportPrivateKeyLogic());
  final state = Get.find<ImportPrivateKeyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(title: ''),
      body: _body(),
    );
  }

  Widget _body() => BaseContainer(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [_input(), Expanded(child: SizedBox()), ButtonX('下一步'), SizedBox(height: 36.h)],
        ),
      );

  Widget _input() {
    return TextField(
      maxLines: 10,
      maxLength: 300,
      focusNode: state.memoriesFocus,
      textAlignVertical: TextAlignVertical.bottom,
      textAlign: TextAlign.start,
      onChanged: logic.onMemoriesInput,
      controller: state.memoriesInputController,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.fromLTRB(32.w, 30.h, 32.w, 30.h),
        fillColor: Color(0xFFF6F6F6),
        filled: true,
        hintText: '请输入12位助记词，按照备份时的顺序填写，每个单次用空格隔开。',
        hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 36.sp),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          /*边角*/
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
        border: OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
      ),
    );
  }
}
