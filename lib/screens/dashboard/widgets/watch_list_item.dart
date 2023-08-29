import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_flutter/widgets/small_text.dart';

class WatchListItem extends StatefulWidget {
  const WatchListItem({Key? key}) : super(key: key);

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: "",height: 50,width: 60,),
          SmallText(text: "Person",size: 20,)
        ],
      ),
    );
  }
}
