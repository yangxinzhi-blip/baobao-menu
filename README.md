# 宝宝想吃什么

无需登录的手机点餐 PWA。所有选择只保存在当前浏览器中，不上传到服务器。

## 本地预览

在 PowerShell 中运行：

```powershell
python -m http.server 8766 --directory "E:\Codex\projects\baobao-menu"
```

然后打开 `http://localhost:8766`。Service Worker 需要通过 HTTP/HTTPS 工作，不能直接双击 HTML 验证离线安装能力。

## 手机直接打开

将本文件夹完整上传到 GitHub Pages、Cloudflare Pages、Netlify、Vercel 或其他静态网站托管服务，即可获得公开 HTTPS 链接。对方无需登录，点击链接即可选择；浏览器支持时还能“添加到主屏幕”。

## 功能

- 吃、喝、水果多选与取消选择
- 自由备注，最多 200 字
- 自动保存在手机浏览器
- 分类汇总、复制、手机分享
- 清空重新选择
- PWA 安装和访问后的离线打开

## 文件

- `index.html` 页面结构
- `styles.css` 手机端视觉样式
- `app.js` 菜单、选择、汇总和持久化逻辑
- `manifest.webmanifest` 安装信息
- `sw.js` 离线缓存
- `icons/` 原创抽象图标
