import 'package:flutter/material.dart';
import 'package:discover_kenya/components/card_item.dart';

class HomeGrid extends StatelessWidget {
  // pictures' url list
  // final List pics = [
  //   'https://cdn.britannica.com/61/153461-050-3C2B54D7/Acacia-trees-Taita-Hills-Kenya.jpg',
  //   'https://www.planetware.com/wpimages/2020/02/kenya-in-pictures-beautiful-places-to-photograph-maasai-mara-national-reserve.jpg',
  //   'https://lh3.googleusercontent.com/proxy/IwLH6w2Ew36LZkdxFAAawCnD_3hZqLlkrZoeInHuFPM0M9vaPddinRFpkxENhF9dXyZQE7aVdpUfJahfPUeFROIiLObhz14KIWNI-wQVz-bIwdj1zC8yz0JLbkwEwMPrrC1zj4jyBQ434nwC',
  //   'https://media.istockphoto.com/photos/three-giraffe-in-national-park-of-kenya-picture-id697689066?k=6&m=697689066&s=612x612&w=0&h=H5YoAu3xfXfxvDs0PNatusDk73PH3G2f3sT-YN2a0dU=',
  //   'https://i1.wp.com/www.kenyawildlifetrust.org/wp-content/uploads/2019/09/Cover-Image-of-cheetah.jpg?resize=1030%2C685&ssl=1',
  //   'https://images.unsplash.com/photo-1523805009345-7448845a9e53?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80',
  //   'https://images.unsplash.com/photo-1565319074344-8759099f3502?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
  //   'https://images.unsplash.com/photo-1535338881181-3646e5ab2ee2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1097&q=80'
  // ];

  final List pics;

  HomeGrid({Key key, this.pics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 1.4,
          children: pics
              .map((pic) => ItemCard(
                    imageURL: pic,
                  ))
              .toList()),
    );
  }
}
