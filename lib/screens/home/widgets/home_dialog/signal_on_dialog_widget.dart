import 'package:flutter/material.dart';
import 'package:honbap_signal_flutter/screens/home/widgets/home_dialog/signal_on_dialog_second_widget.dart';

class SignalOnDialog extends StatefulWidget {
  const SignalOnDialog({Key? key}) : super(key: key);

  @override
  State<SignalOnDialog> createState() => _SignalOnDialogState();
}

class _SignalOnDialogState extends State<SignalOnDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffF2F2F2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
      ),
      contentPadding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 35),
            const Text(
              '시그널을 켜시겠습니까?',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 19),
            const Text(
              textAlign: TextAlign.center,
              '시그널을 켜시면 내 프로필이 반경 10km에 있는 상대방에게 보이며, DM 요청과 시그널 요청이 올 수 있습니다.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff737373),
              ),
            ),
            const SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 46,
                      width: double.maxFinite,
                      child: const Text(
                        '아니오',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffC4C4C4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (_) => const SignalSecondDialog(),
                          barrierDismissible: false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 46,
                      width: double.maxFinite,
                      child: const Text(
                        '네',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffF35928),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
