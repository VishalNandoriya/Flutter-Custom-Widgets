import 'package:flutter/material.dart';

import 'TextWidget.dart';

class ExpandedSectionWidget extends StatefulWidget {
  final String title;
  final String? leadingIcon;
  final String? titleTrailing;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final Color? iconColor;
  final Color? tileColor;
  final Color? collapsedIconColor;
  final List<Widget> children;
  final bool shouldExpanded;
  final bool initiallyExpanded;
  final Function()? onSectionClick;
  final EdgeInsets? childrenPadding;

  const ExpandedSectionWidget({
    super.key,
    required this.title,
    required this.children,
    this.leadingIcon,
    this.titleTrailing,
    this.trailing,
    this.titleStyle,
    this.iconColor,
    this.collapsedIconColor,
    this.tileColor,
    this.shouldExpanded = true,
    this.initiallyExpanded = true,
    this.onSectionClick,
    this.childrenPadding,
  });

  @override
  State<ExpandedSectionWidget> createState() => _ExpandedSectionWidgetState();
}

class _ExpandedSectionWidgetState extends State<ExpandedSectionWidget> {
  late ValueNotifier<bool> shouldAnimation;

  @override
  void initState() {
    super.initState();
    shouldAnimation = ValueNotifier(widget.initiallyExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      tileColor: widget.tileColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      dense: true,
      horizontalTitleGap: 8.0,
      minLeadingWidth: 0,
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        controlAffinity: ListTileControlAffinity.leading,
        maintainState: true,
        collapsedIconColor: widget.collapsedIconColor,
        iconColor: widget.iconColor,
        shape: Border(top: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.5,
        )),
        collapsedShape: Border(top: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.5,
        )),
        initiallyExpanded: widget.initiallyExpanded,
        title: Row(
          children: [
            TextWidget(
              textAlign: TextAlign.start,
              txt: widget.title,
              styles: widget.titleStyle,
            ),
            if (widget.titleTrailing != null) ...[
              const SizedBox(width: 6),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4.0)),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: TextWidget(
                  txt: widget.titleTrailing ?? "",
                  styles: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ]
          ],
        ),
        trailing: widget.trailing,
        onExpansionChanged: (value) {
          if (widget.shouldExpanded) {
            shouldAnimation.value = !shouldAnimation.value;
          } else {
            widget.onSectionClick?.call();
          }
        },
        childrenPadding: widget.children.isNotEmpty
            ? widget.childrenPadding ?? const EdgeInsets.all(16.0)
            : null,
        leading: ValueListenableBuilder<bool>(
            valueListenable: shouldAnimation,
            builder: (context, value, child) => AnimatedRotation(
                  turns: value ? 0.25 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                )),
        children: widget.children,
      ),
    );
  }
}
