import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20),
      child: SizedBox(
          
        height: 130,
        width: 130,
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.JPG'),
            ),
            Positioned(
              right: -4,
              bottom: 5,
              child: SizedBox(
                height: 50,
                width: 50,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Color(0xFFF5F6F9),
                  onPressed: () {},
                  child: SvgPicture.asset("assets/camera2.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
