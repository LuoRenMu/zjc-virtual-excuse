# 专为ZJC提供的虚拟晚自习假条
?晚自习存在的意义就是跑到教室玩手机吗

## 使用教程
1. 安装python >=3.9
2. 使用命令`pip install mitmproxy`
3. 安装ssl证书[mitmproxy-ca-cert.p12](mitmproxy-ca-cert.p12) 或 前往[mitm官網下載](http://mitm.it/)
4. 并以管理员安装ca-cert
5. 在redirect.py目录下 启用shell 使用命令`mitmdump -s redirect.py`
6. 设置系统代理为127.0.0.1 端口号8080
7. 使用pc微信打开zjc520学务通小程序
8. 打开'我的'随后切回主页面再打开'我要请假'-'我的假条' 将为你自动生成今天的晚自习虚拟假条
9. 视频录制-自定义界面录制 -班迪
10. 手机随时随刻可申请需要解除微信的证书绑定
11. 模拟器或许可行

