# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.1] - 2025-06-20

### Fixed
- Fixed homepage URL in pubspec.yaml to point to correct repository
- Updated CHANGELOG.md to use English as primary language for pub.dev compliance

## [1.1.0] - 2025-06-20

### 🎯 New Features
- **NodeExpandCameraBehavior**: Added camera behavior control when nodes are expanded/collapsed
  - `none`: No camera movement (default)
  - `focusClickedNode`: Focus on the clicked node
  - `fitExpandedChildren`: Fit newly expanded children nodes to view
  - `fitExpandedSubtree`: Fit entire expanded subtree to view

### 🐛 Bug Fixes
- **Fixed camera drift on node toggle**: Resolved issue where mind map would gradually move down when toggling nodes
- **Improved root node position stability**: Root node position is now fixed during node toggle operations

### 🔧 Technical Improvements
- Optimized camera control logic
- Enhanced node toggle state management

## [1.0.5] - 2025-06-20

### 🎯 New Features
- **Smart Camera Focus System**: Added intelligent camera focus system
  - `CameraFocus.rootNode`: Focus on root node (default)
  - `CameraFocus.center`: Focus on canvas center
  - `CameraFocus.fitAll`: Auto-fit all nodes to view
  - `CameraFocus.firstLeaf`: Focus on first leaf node
  - `CameraFocus.custom`: Focus on specific node using `focusNodeId`

### 🔧 Camera Control Options
- `cameraFocus`: Set camera focus option
- `focusNodeId`: Specify target node ID for custom focus
- `focusAnimation`: Set focus transition animation duration (default: 300ms)
- `focusMargin`: Set margin around focused content (default: 20px)

### 🎨 Enhanced User Experience
- Perfect mind map display in small containers
- Smooth camera transition animations
- Pixel-perfect focus calculations for accurate centering

### 📖 Documentation
- Added Camera Focus Control usage guide to README
- Provided 4 practical usage examples
- Added focus options reference table

## [1.0.4] - 2024-06-19

### Added
- 🎯 **Auto-centering feature**: Root node automatically centers on initial load
- 📏 **Initial zoom scale**: `initialScale` property for default zoom level control
- 📂 **Default node expansion state**: `isNodesCollapsed` property for initial node state control
- 📸 **Image capture feature**: `captureKey` property for saving mind map as image
- 🔄 **TransformationController support**: Programmatic viewport and zoom control

### Improved
- 🔧 **Text rendering quality**: Applied `softWrap: true` to prevent text overflow
- ⚡ **Initial loading performance**: Auto-centering improves user experience
- 🎨 **InteractiveViewer optimization**: Smoother pan/zoom interactions
- 📱 **Responsive improvements**: Better adaptation to various screen sizes

### Fixed
- ❌ **Initial viewport issue**: Fixed root node appearing outside viewport
- 🔤 **Text clipping issue**: Fixed display errors with long text
- 🎯 **Node focus issue**: Fixed difficulty finding mind map content

### Usage Examples
```dart
MindMapWidget(
  data: yourMindMapData,
  initialScale: 0.8,           // Initial 80% zoom level
  isNodesCollapsed: false,     // Expand all nodes by default
  captureKey: GlobalKey(),     // Key for image capture
  style: MindMapStyle(
    // ... existing style settings
  ),
)
```

## [1.0.3] - 2025-06-13

### Added
- Enhanced documentation with comprehensive examples
- Improved error handling in layout calculations
- Better performance for large mind maps

### Fixed
- Fixed animation glitches in certain scenarios
- Resolved layout calculation edge cases

## [1.0.2] - 2025-06-11

### Added
- Dynamic node sizing based on content
- Improved connection line rendering
- Better memory management for animations

### Fixed
- Fixed overflow issues in small containers
- Resolved animation controller disposal issues

## [1.0.1] - 2025-06-11

### Added
- Initial release with basic mind map functionality
- Multiple layout options (right, left, top, bottom, radial, horizontal, vertical)
- Customizable node shapes and colors
- Interactive expand/collapse animations
- Touch interactions (tap, long press, double tap)
- Pan and zoom capabilities

### Features
- **Layouts**: 7 different layout options
- **Node Shapes**: 6 different shape options
- **Animations**: Smooth expand/collapse with customizable curves
- **Interactions**: Full touch interaction support
- **Styling**: Comprehensive styling options

## [1.0.0] - 2025-06-11

### Added
- Initial release of Reactive Mind Map package
- Multiple layout options (right, left, top, bottom, radial, horizontal, vertical)
- Six node shapes (rounded rectangle, circle, rectangle, diamond, hexagon, ellipse)
- Comprehensive styling system with MindMapStyle
- Interactive features (tap, long press, double tap, expand/collapse)
- Smooth animations with customizable curves and duration
- Pan and zoom functionality
- Rich customization options for colors, fonts, and effects
- Shadow effects for nodes
- Connection line customization
- Comprehensive test suite
- Example application demonstrating all features
- MIT License
- Complete documentation

### 기술적 특징
- Flutter 3.0+ 지원
- 반응형 디자인
- 접근성 고려
- 타입 안전성

### 지원 플랫폼
- Android
- iOS  
- Web
- Windows
- macOS
- Linux 