import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vscode_app/screens/constants.dart';
import 'package:vscode_app/screens/home/components/my_desc_profile.dart';

import 'card_item.dart';

class Body extends StatelessWidget {
  const Body({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => CardItem(
        avatarImage: AssetImage("assets/images/image2.png"),
        image: AssetImage("assets/images/$image"),
        country: 'Viet Nam',
        name: 'Tri Huynh',
        desc:
            'Trong buổi gặp mặt, cha nói “Con gái tôi vừa xinh đẹp, lại biết nấu ăn.” Cô sờ sờ vết sẹo trên mặt, nghĩ rằng mình làm gì biết nấu ăn? Dần dần thường xuyên gặp mặt, Cô hỏi hắn, trước kia có người trong lòng không? “Có, cô ấy xinh đẹp, biết nấu ăn.” Cô bắt đầu học nấu ăn, mỗi lần hắn ăn, sẽ luôn nói, “Hương vị thực giống.” Về sau, cô rốt cục tức giận. “Anh yêu em hay yêu cô ấy!” Hắn cười, “Ngốc quá, sau khi em bị tai nạn mất trí nhớ, anh vẫn luôn luôn chờ em.” (Nếu tôi mất trí nhớ, bạn có thể chờ tôi hay không?) https://flutter.dev',
      ),
    );
  }
}
