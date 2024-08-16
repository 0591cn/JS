# 1、软件收藏

1.1洛雪音乐助手 音源  lx-music-1.2.0.js <br>
[https://raw.githubusercontent.com/0591cn/JS/main/lx-music-1.2.0.js](https://raw.githubusercontent.com/0591cn/JS/main/sixyin-music-source-v1.2.0-encrypt.js)
<br>
1.2李跳跳规则脚本:<br>
&nbsp;&nbsp;&nbsp;&nbsp;李跳跳2024年2月新2964规则.txt  <br>
&nbsp;&nbsp;&nbsp;&nbsp;李跳跳2024年新879规则.txt<br>

---
# 2、常用工具和链接
CFip测速参数：CloudflareST.exe -tp 443 -url https://自己的测速地址 -sl 10 -tl 250 -dn 10 -f ip.txt <br>
反代IP每天更新：https://zip.baipiao.eu.org <br>
ip反查域名：https://ipchaxun.com/ <br>
域名解析查询：https://www.itdog.cn/ping <br>
FOFA白帽汇   https://en.fofa.info/          <br>
IPv6连接测试 https://test-ipv6.com/  <br>
IP端口连通性   https://tcp.ping.pe/     <br>
查Ip属性           https://ipinfo.io/  <br>

 <br> <br> <br>
free.hr免费域名注册地址：https://subreg.cz/  <br>
Discord地址：https://discord.com/  <br>

---
# 3、直播源
YanG-1989：<br>
### 订阅地址「懒人必备」 
* [Gather.m3u](https://raw.githubusercontent.com/YanG-1989/m3u/main/Gather.m3u)  
* [Adult.m3u](https://raw.githubusercontent.com/YanG-1989/m3u/main/Adult.m3u)

### 直播集合「一切随缘」   
* [live.m3u](https://raw.githubusercontent.com/YanG-1989/m3u/main/live.m3u)  
>多平台集合「未创建」
* [XX.m3u](https://tv.iill.top/xx)  
>直接使用此地址,过滤 XX.m3u 中的无效直播.

 
---
 <br>
# 4、CF优选IP和反代IP的方法总结
HTTP支持端口：80，8080，8880，2052，2082，2086，2095； <br>
HTTPS支持端口：443，2053，2083，2087，2096，8443。
 <br>
Cloudflare的workers和pages搭建的免费vpn节点简单好用，但要保证速度我们必须优化CF的IP和反代CF的IP。现把内容总结如下：

1.寻找优选IP的方法：
网站直接获取法：简单、方便，但使用的人太多，可能质量较一般。
https://stock.hostmonit.com/CloudFlareYes

https://monitor.gacjie.cn/page/cloudflare/ipv4.html

http://ip.flares.cloud/

https://github.com/ymyuuu/IPDB（这个可不但有CF的IP，还有反代CF的IP）
 <br>
2.寻找反向代理了CF的IP方法： <br>
从白嫖哥获得：https://zip.baipiao.eu.org <br>
电报群组获得： https://t.me/cf_push <br>
从某项目获得：https://github.com/ymyuuu/IPDB <br>
cf.090227.xyz#三网自适应分流官方优选 <br>
ct.090227.xyz#电信官方优选 <br>
cmcc.090227.xyz#移动官方优选 <br>

常用的优选官方域名 <br>
shopify.com
time.is
icook.hk
icook.tw
ip.sb
japan.com
malaysia.com
russia.com
singapore.com
skk.moe
www.visa.com.sg
www.visa.com.hk
www.visa.com.tw
www.visa.co.jp
www.visakorea.com
www.gco.gov.qa
www.gov.se
www.gov.ua <br>
第三方维护的优选官方域名（未备注出处的为未知） <br>
cfip.xxxxxxxx.tk#OTC提供维护官方优选
bestcf.onecf.eu.org#Mingyu提供维护官方优选
cf.zhetengsha.eu.org#小一提供维护官方优选
acjp2.cloudflarest.link#KJKKK维护官方优选
achk.cloudflarest.link#KJKKK维护官方优选
xn--b6gac.eu.org
yx.887141.xyz
8.889288.xyz
cfip.1323123.xyz
cf.515188.xyz
cf-st.annoy.eu.org
cf.0sm.com
cf.877771.xyz
cf.345673.xyz <br>
第三方维护的优选反代域名 <br>
bestproxy.onecf.eu.org#Mingyu提供维护反代优选
proxy.xxxxxxxx.tk#OTC提供维护反代优选 <br>
第三方维护的优选官方IP的API <br>
https://ipdb.api.030101.xyz/?type=bestcf&country=true
https://addressesapi.090227.xyz/CloudFlareYes
https://addressesapi.090227.xyz/ip.164746.xyz <br>
第三方维护的优选反代IP的API <br>
https://ipdb.api.030101.xyz/?type=bestproxy&country=true <br>
更多优选内容可自行查看 <br>
https://cf.090227.xyz
https://ipdb.api.030101.xyz
https://monitor.gacjie.cn/page/cloudflare/cname.html
https://ip.164746.xyz
https://stock.hostmonit.com/CloudFlareYes
 <br>
3.fofa寻找个性化的CF的IP或反代IP：
这是一种非常好用的方法，利用它能够寻找自己想要的任何IP，方便准确。对小白也不算难。完全可以根据自己的要求，设置筛选条件，比如服务器、端口、国家、地区、城市、IP段等。

3.1筛选CF的IP或CDN例子：
server="cloudflare" && port="443" && country="SG" && (asn="13335" || asn="209242")
server=="cloudflare" &&          # 查找使用 Cloudflare 作为服务器的 IP 地址
port=="443" &&                   # 查找开放端口 443（HTTPS）的服务器
country=="SG" &&                 # 查找位于新加坡（SG）的服务器
(asn=="13335" ||                 # ASN 编号为 13335 或
 asn=="209242")                 # ASN 编号为 209242
3.2筛选反向代理CF的IP例子：
server=="cloudflare" && port=="80" && header="Forbidden" && country=="SG" && asn!="13335" && asn!="209242" 
上方语法的详细说明：
server=="cloudflare" &&          # 使用 Cloudflare 作为服务器
port=="80" &&                    # 端口号为 80（HTTP）
header="Forbidden" &&            # 返回 HTTP 头信息中包含 "Forbidden"
country=="SG" &&                 # 位于新加坡（SG）
asn!="13335" &&                  # 排除 ASN 编号为 13335 的 IP 地址（Cloudflare 官方 IP）
asn!="209242"                    # 排除 ASN 编号为 209242 的 IP 地址（Cloudflare 官方 IP）
关于经常使用的ASN号：
Cloudflare常用到的ASN号：AS13335 AS209242
Cloudflare其它ASN号：AS394536  AS14789 AS139242 AS133877	AS132892 AS395747 AS203898 AS202623 
阿里云常用的：ASN45102 
甲骨文主要的：ASN31898 
搬瓦工常用的：ASN25820
注意：以上语法不是固定不变的，如country可换成city或region，相应的对象也要改变。如region=”California”，region=”Tokyo”，但不能region=”JP”。

server=="cloudflare" && port=="80" && header="Forbidden" && country=="SG" && asn=="31898"
比如添加上asn="31898",可以筛选新加坡甲骨文反代CF的服务器。
 <br>
4.本地优选和测速工具 <br>
Github：https://github.com/XIU2/CloudflareSpeedTest/ 这个工具自带Cloudflare官方IP库，大约有5955个CF的ip,只要一运行就会自动扫出前10个优选IP。但它没有反代IP库哈，另外它还是一个好用的测速工具。
 <br>
其它可能用到的工具
IP批量查询：https://reallyfreegeoip.org/bulk
IP归属地查询：https://ipdata.co/
临时邮箱：https://temp-mail.org/；https://tempmail.plus






 <br>
9、MTProxyTLS一键安装绿色脚本
执行如下代码进行安装

```bash
rm -rf /home/mtproxy && mkdir /home/mtproxy && cd /home/mtproxy
curl -fsSL -o mtproxy.sh https://github.com/ellermister/mtproxy/raw/master/mtproxy.sh
bash mtproxy.sh
```
 使用方式

配置文件 `mtp_config`，如果你想手动修改密钥或者参数请注意格式。


运行服务

```bash
bash mtproxy.sh start
```

调试运行

```bash
bash mtproxy.sh debug
```

停止服务

```bash
bash mtproxy.sh stop
```

重启服务

```bash
bash mtproxy.sh restart
```

重新安装/重新配置

```bash
bash mtproxy.sh reinstall
```

## 卸载安装

因为是绿色版卸载极其简单，直接删除所在目录即可。

```bash
rm -rf /home/mtproxy
```

## 开机启动

> 该脚本没有配置为系统服务的方式，你可以将其添加到开机启动脚本中。

开机启动脚本，如果你的 rc.local 文件不存在请检查开机自启服务。

通过编辑文件`/etc/rc.local`将如下代码加入到开机自启脚本中：

```bash
cd /home/mtproxy && bash mtproxy.sh start > /dev/null 2>&1 &
```


## 计划任务守护

因为默认官方的 mtproxy 程序存在BUG，pid 大于 65535 时处理存在问题。进程容易坏死和异常退出。

建议通过计划任务去守护进程，编辑方式 `crontab -e` ：

每分钟检测进程并启动

```bash
* * * * * cd /home/mtproxy && bash mtproxy.sh start > /dev/null 2>&1 &
```
 
 <br> <br>
---
---
---
##版权声明：  
①根据二〇〇二年一月一日《计算机软件保护条例》规定：为了学习和研究软件内含的设计思想和原理，通过安装、显示、传输或者存储软件等方式使用软件的，可以不经软件著作权人许可，不向其支付报酬！

②本项目尊重各网络文件的版权问题，所有资源均出自网络，所有提供下载的资源均为资源作者提供和网络收集整理而来，仅供学习和研究使用。访问本项目的用户必须明白，本项目对提供下载的资源等不拥有任何权利，其版权归该资源的合法拥有者所有。

③本项目保证项目内提供的所有可下载资源（软件等等）都是按“原样”提供，本项目未做过任何改动；但本项目不保证本项目提供的下载资源的准确性、安全性和完整性；同时本项目也不承担用户因使用这些下载资源对自己和他人造成任何形式的损失或伤害。不论何种情形本项目都不对任何由于使用或无法使用本项目提供的资源所造成的直接的、间接的、附带的、特殊的或余波所及的损失、灵失、债务或中断负任何责任﹝不论是可预见或是不可预见的，即使本项目已被告知这种可能性﹞。

④如有侵犯您的版权，请电邮至邮箱：github@0591cn.com，本项目将立即改正。本项目对互联网版权绝对支持。

⑤感谢“老殁”（ https://www.mpyit.com ）的《本站声明》提供的声明文本支持（本项目版权声明多数取自修改于此）。
