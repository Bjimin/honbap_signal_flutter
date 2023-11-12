import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:honbap_signal_flutter/constants/gaps.dart';
import 'package:honbap_signal_flutter/constants/sizes.dart';
import 'package:honbap_signal_flutter/models/signal/signal_info_model.dart';

class SignalEditCard extends StatefulWidget {
  final Function(SignalInfoModel)? onChange;
  final SignalInfoModel? initSignal;
  final bool isBorder;

  const SignalEditCard({
    super.key,
    this.onChange,
    this.initSignal,
    this.isBorder = true,
  });

  @override
  State<SignalEditCard> createState() => _SignalEditCardState();
}

class _SignalEditCardState extends State<SignalEditCard> {
  late SignalInfoModel _currentSignalInfo;

  @override
  void initState() {
    super.initState();
    _currentSignalInfo = widget.initSignal ?? const SignalInfoModel();
  }

  @override
  void didUpdateWidget(covariant SignalEditCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initSignal != widget.initSignal) {
      _currentSignalInfo = widget.initSignal ?? const SignalInfoModel();
    }
  }

  void _onDateTimeChange(DateTime datetime) {
    setState(() {
      _currentSignalInfo = _currentSignalInfo.copyWith(
        sigPromiseTime: datetime.toString(),
      );
    });

    if (widget.onChange != null) {
      widget.onChange!(_currentSignalInfo);
    }
  }

  void _onLocationChange(String location) {
    setState(() {
      _currentSignalInfo = _currentSignalInfo.copyWith(
        sigPromiseArea: location,
      );
    });

    if (widget.onChange != null) {
      widget.onChange!(_currentSignalInfo);
    }
  }

  void _onMenuChange(String menu) {
    setState(() {
      _currentSignalInfo = _currentSignalInfo.copyWith(
        sigPromiseMenu: menu,
      );
    });

    if (widget.onChange != null) {
      widget.onChange!(_currentSignalInfo);
    }
  }

  void _onTimeTap() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            initialDateTime: _currentSignalInfo.sigPromiseTime != null
                ? DateTime.parse(_currentSignalInfo.sigPromiseTime!)
                : null,
            onDateTimeChanged: _onDateTimeChange,
          ),
        ),
      ),
    );
  }

  String _hm(String? dateTimeStr) {
    if (dateTimeStr == null) return '시간을 정해주세요';
    var datetime = DateTime.parse(dateTimeStr);
    return '${datetime.hour.toString().padLeft(2, "0")} : ${datetime.minute.toString().padLeft(2, "0")}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.isBorder
            ? Border.all(
                color: Colors.grey.shade900,
              )
            : null,
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      padding: const EdgeInsets.all(Sizes.size10),
      child: Column(
        children: [
          GestureDetector(
            onTap: _onTimeTap,
            behavior: HitTestBehavior.translucent,
            child: Row(
              children: [
                const SizedBox(
                  width: Sizes.size60,
                  child: Text('약속시간'),
                ),
                const Icon(
                  Icons.access_time,
                  color: Color(0xff737373),
                  size: Sizes.size20,
                ),
                Gaps.h10,
                SizedBox(
                  height: Sizes.size32,
                  child: Center(
                    child: Text(_hm(_currentSignalInfo.sigPromiseTime)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: Sizes.size60,
                child: Text('만날위치'),
              ),
              const Icon(
                Icons.place,
                color: Color(0xff737373),
                size: Sizes.size20,
              ),
              Gaps.h10,
              Flexible(
                child: SizedBox(
                  height: Sizes.size32,
                  child: TextFormField(
                    initialValue: _currentSignalInfo.sigPromiseTime,
                    onChanged: _onLocationChange,
                    decoration: const InputDecoration(
                      hintText: '장소를 정해주세요',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: Sizes.size60,
                child: Text('메뉴'),
              ),
              const Icon(
                Icons.restaurant_menu,
                color: Color(0xff737373),
                size: Sizes.size20,
              ),
              Gaps.h10,
              Flexible(
                child: SizedBox(
                  height: Sizes.size32,
                  child: TextFormField(
                    initialValue: _currentSignalInfo.sigPromiseTime,
                    onChanged: _onMenuChange,
                    decoration: const InputDecoration(
                      hintText: '메뉴를 정해주세요',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}