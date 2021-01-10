import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectRepositories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int i) {
        return _handlerRenderShimmerEffect();
      },
    );
  }

  Widget _handlerRenderShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.white,
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
              ),
              width: 60,
              height: 60,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
