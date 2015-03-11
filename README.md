# 中小企业网站模版

这是中小企业网站模版，可以快速搭建一个中小企业网站。

网站前端使用 [YAML CSS Framework](http://www.yaml.de/)，后端使用 [bootswatch](https://bootswatch.com/)(bootstrap3)。

网站功能尚不完善，仍在开发中……

## 教程

1. clone 本代码。
2. 然后执行：

  ```
  rake db:create
  rake db:migrate
  rake db:seed
  ```
3. 运行网站
  ```
  rails s
  ```
  访问 http://localhost:3000/sessions/new
  ```
  用户名：demo
  密码：123123
  ```
4. 进入后台，自由配置。

## TODO
- 集成百度统计JS和百度搜索
- 各页面 SEO
- 多层嵌套页面结构
- 缓存
- bootswatch IE bug
- ……
