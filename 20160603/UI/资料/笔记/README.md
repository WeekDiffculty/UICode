## storyboard文件的认识
- 用来描述软件界面
- 默认情况下，程序一启动就会加载Main.storyboard
- 加载storyboard时，会首先创建和显示箭头所指的控制器界面

## IBAction和IBOutlet
- IBAction：
    - 本质就是void
    - 能让方法具备连线的功能
- IBOutlet
    - 能让属性具备连线的功能

## storyboard连线容易出现的问题
- 连接的方法代码被删掉，但是连线没有去掉
    - 可能会出现方法找不到错误
    - unrecognized selector sent to instance
- 连接的属性代码被删掉，但是连线没有去掉
    - setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key

## UIViewController（控制器）的认识
- 一个控制器负责管理一个大界面
- 控制器负责界面的创建、事件处理等

## 类扩展
- 格式
```objc
@interface 类名()
/** 属性、方法的声明 */
@end
```
- 作用
    - 为某个类增加额外的属性和方法声明
    - 可以写在.h和.m文件中

## 项目属性
- Product Name
    - 软件名称、产品名称、项目名称
- Organization Name
    - 公司名称、组织名称
- Organization Identifier
    - 公司的唯一标识
    - 一般是公司域名的反写，比如com.520it
- Bundle Identifier
    - 软件的唯一标识
    - 一般是Organization Identifier + Product Name

