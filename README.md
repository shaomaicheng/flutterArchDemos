# demos

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# build runner 命令

```
flutter pub run build_runner build
```

# flutter mobx
需要依赖：
* flutter_mobx
* build_runner
* mobx_codegen

编译命令：
```
flutter pub run build_runner build
```

# 横向对比

### redux
前端有对应框架，比较繁琐，胶水代码过多。不考虑

### Mobx
前端有相同对应框架

*优点*
* 简单，API少

*缺点*
* 用 build_runner 生成代码，比较麻烦

### Flutter hooks
前端有相同的对应框架（react hooks）
*优点*
* 代码少，写起来很清晰，代码复用程度高

*缺点*
* 编程思想需要切换。
* hooks函数如果想自定义的话需要深入研究下，不算很好掌握

### Riverpod
Provider、hooks的同一个作者开发的新框架

*优点*
* 比 Provider 简单
* 可以单独再dart使用。也可以再flutter中和 hooks搭配使用

*缺点*
* 每个 Provider 只能绑定一个类型。逻辑层可能要拆的很碎。。
* Provider的类型有点多，消化各种用法也需要一点时间

