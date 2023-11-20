import 'package:theboysapp/the_boys_model.dart';
import 'the_boys_detail_page.dart';
import 'package:flutter/material.dart';


class TheBoysCard extends StatefulWidget {
  final TheBoys the_boys;

  const TheBoysCard(this.the_boys, {super.key});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _TheBoysCardState createState() => _TheBoysCardState(the_boys);
}

class _TheBoysCardState extends State<TheBoysCard> {
  TheBoys the_boys;
  String? renderUrl;

  _TheBoysCardState(this.the_boys);

  @override
  void initState() {
    super.initState();
    renderTheBoysPic();
  }

  Widget get the_boysImage {
    var the_boysAvatar = Hero(
      tag: the_boys,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = Container(
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient:
              LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Colors.black54, Colors.black, Color.fromARGB(255, 84, 110, 122)])),
      alignment: Alignment.center,
      child: const Text(
        'BOYS',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: the_boysAvatar,
      // ignore: unnecessary_null_comparison
      crossFadeState: renderUrl == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderTheBoysPic() async {
    await the_boys.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = the_boys.imageUrl;
      });
    }
  }

  Widget get the_boysCard {
    return Positioned(
      right: 0.0,
      child: SizedBox(
        width: 290,
        height: 115,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: const Color(0xFFF8F8F8),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.the_boys.name,
                  style: const TextStyle(color: Color(0xFF000600), fontSize: 27.0),
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.star, color: Color(0xFF000600)),
                    Text(': ${widget.the_boys.rating}/10', style: const TextStyle(color: Color(0xFF000600), fontSize: 14.0))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showTheBoysDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return TheBoysDetailPage(the_boys);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showTheBoysDetailPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SizedBox(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              the_boysCard,
              Positioned(top: 7.5, child: the_boysImage),
            ],
          ),
        ),
      ),
    );
  }
}
