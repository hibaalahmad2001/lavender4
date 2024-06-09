import 'package:flutter/cupertino.dart';
import 'package:lavender4/core/theme/typography.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
        required this.text,
        required this.style,
        this.textDirection = TextDirection.ltr,
        this.textAlign,
        this.maxLines,
        this.overflow});

  final String text;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textDirection: textDirection,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style,
    );
  }

  AppText.displayLarge(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.displayLarge
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.displayMedium(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.displayMedium
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.displaySmall(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.displaySmall
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.headlineLarge(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.headlineLarge
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.headlineMedium(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.headlineMedium
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.headlineSmall(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.headlineSmall
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.bodyLarge(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.bodyLarge
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);
  AppText.bodyMedium(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.bodyMedium
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);
  AppText.bodySmall(
      this.text, {
        super.key,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
      }) : style = textTheme.bodySmall
      ?.merge(style)
      .copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize);

  AppText.titleLarge(
      this.text, {super.key,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
      }) : style = textTheme.titleLarge!
      .merge(style)
      .copyWith(fontWeight: fontWeight, fontSize: fontSize, color: color);
  AppText.titleMedium(
      this.text, {super.key,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
      }) : style = textTheme.titleMedium!
      .merge(style)
      .copyWith(fontWeight: fontWeight, fontSize: fontSize, color: color);
  AppText.titleSmall(
      this.text, {super.key,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
      }) : style = textTheme.titleSmall!
      .merge(style)
      .copyWith(fontWeight: fontWeight, fontSize: fontSize, color: color);
  AppText.textTitle(
      this.text, {super.key,
        this.textDirection,
        this.textAlign,
        this.maxLines,
        this.overflow,
        TextStyle? style,
        FontWeight? fontWeight,
        double? fontSize,
        Color? color,
      }) : style = textTheme.textTitle!
      .merge(style)
      .copyWith(fontWeight: fontWeight, fontSize: fontSize, color: color);
}
