if [ $1 -eq "1" ]
then
    refer=$(curl -s www.baidu.com | grep "NextURL" | cut -d "<" -f 2 |cut -d ">" -f 2)
    echo $refer
    if [ -n $refer ]
    then
        wlanserip=$(echo $refer | cut -d "=" -f 2 | cut -d "&" -f 1)
        echo $wlanserip
        basip=$(echo $refer | cut -d "=" -f 4)
        echo $basip
        curl 'http://114.247.41.52:808/protalAction!portalAuth.action?' -H 'Pragma: no-cache' -H 'Origin: http://114.247.41.52:808' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.9,zh-TW;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: application/json, text/javascript, */*' -H 'Cache-Control: no-cache' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' -H "Referer: $refer" -H 'DNT: 1' --data "wlanuserip=$wlanserip&localIp=&basip=$basip&lpsUserName={用户名}&lpsPwd={密码}" --compressed
    fi
fi
