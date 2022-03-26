# MethodCollection
Some useful methods

## 1. 事件传递
- 在`touchBegin`中使用
   ```
   // 获取相对于主视图的触摸位置
   let point = ((touches as NSSet).anyObject() as AnyObject).location(in: self.view)
   // 获取触摸layer
   let layer = redView.layer.hitTest(point)
   ```

- 超出父视图处理
  ```
  // 1. 计算btn相对于 from 中 的point
  let coverPoint = btn.convert(, from: )
  
  // 2. 判断点击位置是否在 计算的point中
  let isIn = btn.point(inside: coverPoint, with: event)
  
  // 如果在则返回 btn
  ```
