import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DayTile extends StatelessWidget {
  const DayTile({
    super.key,
    required this.nextDays,
    required this.index,
  });
  final index;
  final List nextDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 55,
            child:
                StyledText(nextDays[index].day, 'grillmaster', 24, 'normal')),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(nextDays[index].icon),
                Positioned(
                    bottom: 10,
                    child: StyledText(
                        nextDays[index].condition, 'grillmaster', 10, 'normal'))
              ],
            )
          ],
        ),
        SizedBox(
          width: 123,
          child: Row(children: [
            StyledText(
                '${nextDays[index].maxTemp}°', 'PublicSans', 45, 'normal'),
            const StyledText('/', 'PublicSans', 25, 'normal'),
            StyledText(
                '${nextDays[index].minTemp}°', 'PublicSans', 20, 'normal'),
          ]),
        )
      ],
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    this.style,
    required this.gradient,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.iconPath,
    required this.infoTitle,
    required this.infoValue,
  });
  final infoTitle;
  final iconPath;
  final infoValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: Row(
        children: [
          Lottie.asset(iconPath, height: 50, width: 50),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledText(infoTitle, 'grillmaster', 14, 'normal'),
              StyledText(infoValue, 'PublicSans', 20, 'bold'),
            ],
          )
        ],
      ),
    );
  }
}

class NextDaysList extends StatelessWidget {
  final nextDays;

  const NextDaysList({super.key, required this.nextDays});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var i = 0; i < 7; i++) ...[
          DayTile(
            index: i,
            nextDays: nextDays,
          ),
          const Divider(),
        ],
      ],
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.family, this.size, this.weight, {super.key});
  final String text, family;
  final double size;
  final String weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontFamily: family,
          fontSize: size,
          fontWeight: weight == 'bold' ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class Shimmer extends StatefulWidget {
  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  const Shimmer({
    super.key,
    required this.linearGradient,
    this.child,
  });

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -1, max: 1.5, period: const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // Update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}
