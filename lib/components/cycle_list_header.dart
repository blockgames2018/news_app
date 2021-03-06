import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../util/color_util.dart';

class CycleListHeader extends StatelessWidget implements PreferredSizeWidget {
  CycleListHeader({this.count, this.tail, this.onTap});
  final int count;
  final Widget tail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenUtil().setWidth(30))),
      child: Container(
        color: getTopListBGColor(context),
        child: InkWell(
          onTap: onTap,
          child: SizedBox.fromSize(
            size: preferredSize,
            child: Row(
              children: [
                Container(width: 10,),
                Icon(
                  Icons.play_circle_outline,
                  size:  ScreenUtil().setWidth(50),
                  color: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text("  全部",style: TextStyle(fontWeight: FontWeight.w800)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: count == null
                      ? Container() : Text( " (共$count首)",),
                ),
                Spacer(),
                tail ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(100));
}