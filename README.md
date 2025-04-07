# 专为ZJC提供的虚拟晚自习假条
?晚自习存在的意义就是跑到教室玩手机吗

## 重定向 Web 流量
- 运行您的网络流量代理（例如：Fiddler Classic、mitmproxy)      
- 项目库中的`redirect.py`为mitmproxy 提供代理 使用命令`mitm dump -s redirect.py` (需安装mitmproxy ssl证书以重定向https流量)        

## 使用Fiddler    
1. 打开抓取HTTPS流量并安装SSL证书    
2. Rules -> Customize Rules -> 搜索OnBeforeRequest函数并在该函数下添加以下代码    
```
if(oSession.url.Contains("wxapp_stuasklelist")){
	oSession.fullUrl = "http://server.luorenmu.cn:8989";
}

if(oSession.url.Contains("wxapp_user")){
	oSession.fullUrl = "http://server.luorenmu.cn:8989/weixin/wxapp_user";
}
```      

