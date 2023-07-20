class SignalSignalListModel {
  final int userIdx, signalIdx, checkSigWrite;
  final String nickName, userIntroduce;
  final String taste, hateFood, interest, avgSpeed, preferArea, mbti, updateAt;
  final String? sigPromiseArea, sigPromiseTime;

  SignalSignalListModel.fromJson(Map<String, dynamic> json)
      : userIdx = json['userIdx'],
        taste = json['taste'],
        hateFood = json['hateFood'],
        interest = json['interest'],
        avgSpeed = json['avgSpeed'],
        preferArea = json['preferArea'],
        mbti = json['mbti'],
        userIntroduce = json['userIntroduce'],
        updateAt = json['updateAt'],
        nickName = json['nickName'],
        signalIdx = json['signalIdx'],
        sigPromiseArea = json['sigPromiseArea'],
        sigPromiseTime = json['sigPromiseTime'],
        checkSigWrite = json['checkSigWrite'];
}