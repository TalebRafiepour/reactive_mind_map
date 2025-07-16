import 'package:flutter/material.dart';
import '../enums/mind_map_layout.dart';
import '../enums/node_shape.dart';
import '../enums/mind_map_type.dart';
import '../models/mind_map_node.dart';
import 'dart:math' as math;

/// 마인드맵의 전체적인 스타일을 정의하는 클래스 / Class that defines the overall style of the mind map
class MindMapStyle {
  /// 마인드맵 타입 / Mind map type
  final MindMapType mindMapType;

  /// 마인드맵 레이아웃 방향 / Mind map layout direction
  final MindMapLayout layout;

  /// 노드 모양 / Node shape
  final NodeShape nodeShape;

  /// 배경색 / Background color
  final Color backgroundColor;

  /// 노드 간 수평 간격 / Horizontal spacing between nodes
  final double levelSpacing;

  /// 노드 간 수직 여백 / Vertical margin between nodes
  final double nodeMargin;

  /// 연결선 색상 / Connection line color
  final Color connectionColor;

  /// 연결선 두께 / Connection line thickness
  final double connectionWidth;

  /// 연결선 스타일 (직선 또는 곡선) / Connection line style (straight or curved)
  final bool useCustomCurve;

  /// 기본 노드 색상들 (레벨별로 사용) / Default node colors (used by level)
  final List<Color> defaultNodeColors;

  /// 기본 텍스트 스타일 / Default text style
  final TextStyle defaultTextStyle;

  /// 루트 노드 크기 / Root node size
  final double rootNodeSize;

  /// 1차 자식 노드 크기 / Primary child node size
  final double primaryNodeSize;

  /// 리프 노드 크기 / Leaf node size
  final double leafNodeSize;

  /// 노드 선택 시 테두리 색상 / Border color when node is selected
  final Color selectionBorderColor;

  /// 노드 선택 시 테두리 두께 / Border thickness when node is selected
  final double selectionBorderWidth;

  /// 노드 애니메이션 지속 시간 / Node animation duration
  final Duration animationDuration;

  /// 노드 애니메이션 곡선 / Node animation curve
  final Curve animationCurve;

  /// 노드 그림자 활성화 여부 / Whether node shadow is enabled
  final bool enableNodeShadow;

  /// 노드 그림자 색상 / Node shadow color
  final Color nodeShadowColor;

  /// 노드 그림자 번짐 정도 / Node shadow blur radius
  final double nodeShadowBlurRadius;

  /// 노드 그림자 퍼짐 정도 / Node shadow spread radius
  final double nodeShadowSpreadRadius;

  /// 노드 그림자 오프셋 / Node shadow offset
  final Offset nodeShadowOffset;

  /// 노드 자동 크기 조절 여부 / Whether auto-sizing for nodes is enabled
  final bool enableAutoSizing;

  /// 최소 노드 너비 / Minimum node width
  final double minNodeWidth;

  /// 최대 노드 너비 / Maximum node width
  final double maxNodeWidth;

  /// 최소 노드 높이 / Minimum node height
  final double minNodeHeight;

  /// 텍스트 패딩 / Text padding
  final EdgeInsets textPadding;

  /// 커스텀 노드 최대 너비 / Maximum width for custom nodes
  final double maxCustomNodeWidth;

  /// 커스텀 노드 최대 높이 / Maximum height for custom nodes
  final double maxCustomNodeHeight;

  /// 커스텀 노드 최소 너비 / Minimum width for custom nodes
  final double minCustomNodeWidth;

  /// 커스텀 노드 최소 높이 / Minimum height for custom nodes
  final double minCustomNodeHeight;

  /// 커스텀 노드 크기 자동 조정 여부 / Whether to auto-adjust custom node size
  final bool enableCustomNodeAutoSizing;

  /// 노드 빌더 함수 / Node builder function
  final Widget Function(
    MindMapNode,
    bool,
    VoidCallback,
    VoidCallback,
    VoidCallback,
  )?
  nodeBuilder;

  const MindMapStyle({
    this.mindMapType = MindMapType.default_,
    this.layout = MindMapLayout.right,
    this.nodeShape = NodeShape.roundedRectangle,
    this.backgroundColor = const Color(0xFFF8FAFC),
    this.levelSpacing = 240.0,
    this.nodeMargin = 40.0,
    this.connectionColor = Colors.grey,
    this.connectionWidth = 2.5,
    this.useCustomCurve = true,
    this.defaultNodeColors = const [
      Color(0xFF2563EB),
      Color(0xFF7C3AED),
      Color(0xFF059669),
      Color(0xFFDC2626),
      Color(0xFFF59E0B),
      Color(0xFF7C2D12),
      Color(0xFF6B21A8),
      Color(0xFF0EA5E9),
      Color(0xFF10B981),
      Color(0xFF8B5CF6),
      Color(0xFF06B6D4),
      Color(0xFFF97316),
    ],
    this.defaultTextStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      height: 1.1,
    ),
    this.rootNodeSize = 80.0,
    this.primaryNodeSize = 60.0,
    this.leafNodeSize = 45.0,
    this.selectionBorderColor = Colors.yellow,
    this.selectionBorderWidth = 3.0,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeOutCubic,
    this.enableNodeShadow = true,
    this.nodeShadowColor = Colors.black26,
    this.nodeShadowBlurRadius = 8.0,
    this.nodeShadowSpreadRadius = 2.0,
    this.nodeShadowOffset = const Offset(0, 4),
    this.enableAutoSizing = true,
    this.minNodeWidth = 80.0,
    this.maxNodeWidth = 200.0,
    this.minNodeHeight = 40.0,
    this.textPadding = const EdgeInsets.all(12.0),
    this.maxCustomNodeWidth = 200.0,
    this.maxCustomNodeHeight = 150.0,
    this.minCustomNodeWidth = 60.0,
    this.minCustomNodeHeight = 40.0,
    this.enableCustomNodeAutoSizing = true,
    this.nodeBuilder,
  });

  /// 스타일 복사를 위한 copyWith 메소드 / copyWith method for style copying
  MindMapStyle copyWith({
    MindMapType? mindMapType,
    MindMapLayout? layout,
    NodeShape? nodeShape,
    Color? backgroundColor,
    double? levelSpacing,
    double? nodeMargin,
    Color? connectionColor,
    double? connectionWidth,
    bool? useCustomCurve,
    List<Color>? defaultNodeColors,
    TextStyle? defaultTextStyle,
    double? rootNodeSize,
    double? primaryNodeSize,
    double? leafNodeSize,
    Color? selectionBorderColor,
    double? selectionBorderWidth,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? enableNodeShadow,
    Color? nodeShadowColor,
    double? nodeShadowBlurRadius,
    double? nodeShadowSpreadRadius,
    Offset? nodeShadowOffset,
    bool? enableAutoSizing,
    double? minNodeWidth,
    double? maxNodeWidth,
    double? minNodeHeight,
    EdgeInsets? textPadding,
    double? maxCustomNodeWidth,
    double? maxCustomNodeHeight,
    double? minCustomNodeWidth,
    double? minCustomNodeHeight,
    bool? enableCustomNodeAutoSizing,
    Widget Function(
      MindMapNode,
      bool,
      VoidCallback,
      VoidCallback,
      VoidCallback,
    )?
    nodeBuilder,
  }) {
    return MindMapStyle(
      mindMapType: mindMapType ?? this.mindMapType,
      layout: layout ?? this.layout,
      nodeShape: nodeShape ?? this.nodeShape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      levelSpacing: levelSpacing ?? this.levelSpacing,
      nodeMargin: nodeMargin ?? this.nodeMargin,
      connectionColor: connectionColor ?? this.connectionColor,
      connectionWidth: connectionWidth ?? this.connectionWidth,
      useCustomCurve: useCustomCurve ?? this.useCustomCurve,
      defaultNodeColors: defaultNodeColors ?? this.defaultNodeColors,
      defaultTextStyle: defaultTextStyle ?? this.defaultTextStyle,
      rootNodeSize: rootNodeSize ?? this.rootNodeSize,
      primaryNodeSize: primaryNodeSize ?? this.primaryNodeSize,
      leafNodeSize: leafNodeSize ?? this.leafNodeSize,
      selectionBorderColor: selectionBorderColor ?? this.selectionBorderColor,
      selectionBorderWidth: selectionBorderWidth ?? this.selectionBorderWidth,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      enableNodeShadow: enableNodeShadow ?? this.enableNodeShadow,
      nodeShadowColor: nodeShadowColor ?? this.nodeShadowColor,
      nodeShadowBlurRadius: nodeShadowBlurRadius ?? this.nodeShadowBlurRadius,
      nodeShadowSpreadRadius:
          nodeShadowSpreadRadius ?? this.nodeShadowSpreadRadius,
      nodeShadowOffset: nodeShadowOffset ?? this.nodeShadowOffset,
      enableAutoSizing: enableAutoSizing ?? this.enableAutoSizing,
      minNodeWidth: minNodeWidth ?? this.minNodeWidth,
      maxNodeWidth: maxNodeWidth ?? this.maxNodeWidth,
      minNodeHeight: minNodeHeight ?? this.minNodeHeight,
      textPadding: textPadding ?? this.textPadding,
      maxCustomNodeWidth: maxCustomNodeWidth ?? this.maxCustomNodeWidth,
      maxCustomNodeHeight: maxCustomNodeHeight ?? this.maxCustomNodeHeight,
      minCustomNodeWidth: minCustomNodeWidth ?? this.minCustomNodeWidth,
      minCustomNodeHeight: minCustomNodeHeight ?? this.minCustomNodeHeight,
      enableCustomNodeAutoSizing:
          enableCustomNodeAutoSizing ?? this.enableCustomNodeAutoSizing,
      nodeBuilder: nodeBuilder ?? this.nodeBuilder,
    );
  }

  /// 노드 레벨에 따른 크기를 반환 / Returns size based on node level
  double getNodeSize(int level) {
    if (level == 0) return rootNodeSize;
    if (level == 1) return primaryNodeSize;
    return leafNodeSize;
  }

  /// 커스텀 노드 크기를 제한 범위 내로 조정 / Adjust custom node size within limits
  Size adjustCustomNodeSize(Size originalSize, {String? title, int? level}) {
    if (!enableCustomNodeAutoSizing) {
      return originalSize;
    }

    double adjustedWidth = originalSize.width;
    double adjustedHeight = originalSize.height;

    // 최소/최대 크기 제한 적용
    adjustedWidth = adjustedWidth.clamp(minCustomNodeWidth, maxCustomNodeWidth);
    adjustedHeight = adjustedHeight.clamp(
      minCustomNodeHeight,
      maxCustomNodeHeight,
    );

    // 텍스트 길이에 따른 동적 조정
    if (title != null) {
      final textLength = title.length;
      final fontSize =
          level == 0
              ? 18.0
              : level == 1
              ? 15.0
              : 12.0;
      final estimatedTextWidth = textLength * fontSize * 0.6;
      final minWidthForText = estimatedTextWidth + 20; // 패딩 포함

      if (adjustedWidth < minWidthForText) {
        adjustedWidth = minWidthForText.clamp(
          minCustomNodeWidth,
          maxCustomNodeWidth,
        );
      }
    }

    return Size(adjustedWidth, adjustedHeight);
  }

  // /// 마크맵 스타일 마인드맵을 위한 전용 스타일 생성 / Create dedicated style for markmap type mind map
  // MindMapStyle getMarkmapStyle() {
  //   return copyWith(
  //     mindMapType: MindMapType.markmap,
  //     connectionWidth: 2.0,
  //     connectionColor: Colors.grey[600]!,
  //     useCustomCurve: true,
  //     backgroundColor: const Color(0xFFF8FAFC), // 연한 회색 배경
  //     animationDuration: const Duration(milliseconds: 800),
  //     animationCurve: Curves.easeOutCubic,
  //   );
  // }

  /// 노드 레벨에 따른 기본 색상을 반환 / Returns default color based on node level
  Color getDefaultNodeColor(int level) {
    return defaultNodeColors[level % defaultNodeColors.length];
  }

  /// 노드 레벨에 따른 텍스트 크기를 반환 / Returns text size based on node level
  double getTextSize(int level) {
    if (level == 0) return 14.0;
    if (level == 1) return 12.0;
    return 10.0;
  }

  /// 텍스트 내용에 따른 동적 노드 크기 계산 / Calculate dynamic node size based on text content
  Size calculateNodeSize(String text, int level, {TextStyle? customTextStyle}) {
    if (!enableAutoSizing) {
      final size = getNodeSize(level);
      return Size(size, size);
    }

    final textStyle =
        customTextStyle ??
        defaultTextStyle.copyWith(fontSize: getTextSize(level));

    // TextPainter를 사용해서 실제 텍스트 크기 측정 / Measure actual text size using TextPainter

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );
    textPainter.layout(maxWidth: maxNodeWidth - textPadding.horizontal);

    final textWidth = textPainter.width + 30;
    final textHeight = textPainter.height + 30;

    // 패딩을 포함한 최종 크기 계산 / Calculate final size including padding
    double nodeWidth = textWidth + textPadding.horizontal;
    double nodeHeight = textHeight + textPadding.vertical;

    // 최소/최대 크기 제약 적용 / Apply min/max size constraints
    nodeWidth = nodeWidth.clamp(minNodeWidth, maxNodeWidth);
    nodeHeight = nodeHeight.clamp(minNodeHeight, double.infinity);

    // 레벨별 최소 크기 보장 / Ensure minimum size per level
    final minSize = getNodeSize(level);
    nodeWidth = nodeWidth.clamp(minSize * 0.8, double.infinity);
    nodeHeight = nodeHeight.clamp(minSize * 0.6, double.infinity);

    return Size(nodeWidth, nodeHeight);
  }

  /// 노드의 실제 크기를 반환 (Size가 있으면 그것을 사용, 없으면 동적 계산) / Returns actual node size (use custom size if available, otherwise calculate dynamically)
  Size getActualNodeSize(
    String text,
    int level, {
    Size? customSize,
    TextStyle? customTextStyle,
  }) {
    // 기본 텍스트 스타일 결정
    final baseTextStyle =
        customTextStyle ??
        defaultTextStyle.copyWith(fontSize: getTextSize(level));

    // 텍스트 크기 정확히 계산
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: baseTextStyle),
      textDirection: TextDirection.ltr,
      maxLines: 3, // 최대 3줄로 제한
    );

    // 최대 너비 제약 설정
    final maxTextWidth = maxNodeWidth - textPadding.horizontal;
    textPainter.layout(maxWidth: maxTextWidth);

    // 텍스트 크기 + 패딩 계산
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    // 최소 크기 계산 (텍스트 + 패딩)
    final minWidth = textWidth + textPadding.horizontal;
    final minHeight = textHeight + textPadding.vertical;

    // 커스텀 크기가 있는 경우
    if (customSize != null) {
      if (!enableAutoSizing) {
        // 자동 크기 조정이 비활성화된 경우 커스텀 크기 사용
        return Size(
          customSize.width.clamp(minCustomNodeWidth, maxCustomNodeWidth),
          customSize.height.clamp(minCustomNodeHeight, maxCustomNodeHeight),
        );
      } else {
        // 자동 크기 조정이 활성화된 경우 더 큰 값 사용
        final adjustedWidth = math.max(customSize.width, minWidth);
        final adjustedHeight = math.max(customSize.height, minHeight);

        return Size(
          adjustedWidth.clamp(minCustomNodeWidth, maxCustomNodeWidth),
          adjustedHeight.clamp(minCustomNodeHeight, maxCustomNodeHeight),
        );
      }
    }

    // 커스텀 크기가 없는 경우 동적 계산
    final calculatedSize = calculateNodeSize(
      text,
      level,
      customTextStyle: customTextStyle,
    );

    // 레벨별 최소 크기 보장
    final levelMinSize = getNodeSize(level);
    final finalWidth = math.max(calculatedSize.width, levelMinSize * 0.8);
    final finalHeight = math.max(calculatedSize.height, levelMinSize * 0.6);

    return Size(
      finalWidth.clamp(minNodeWidth, maxNodeWidth),
      finalHeight.clamp(minNodeHeight, double.infinity),
    );
  }
}
