/ KDB作两个client. 一个client用来接收数据, 另一个用来发送数据给TP. 具有重连机制.
tp:`:127.0.0.1:5010
h:0i
/ 异步连接TP
/ h:neg hopen  tp

/ .z.ws:{0N!x;}
/ .z.ws:{show x}
/ .z.ws:{feed[.j.k x]; show x}

/ feed handler:
feed:{h(".u.upd";`trade;x);}
//解析 json, 插入dictionary的值
.z.ws:{ feed [value "Sfi"$flip .j.k x] }

/ 连接websocket server
ip:"127.0.0.1:5001"
/ r:(`$":ws://", ip)"GET / HTTP/1.1\r\nHost: ", ip, "\r\n\r\n"
hws:0i
/ hws: first r /websocket session句柄

/客户端异步发送数据到websocket server
/ neg[hws]"message"

/ watchdog
.z.pc:{h::0i;}
.z.wc:{hws::0i;}
/ 如果连接不上TP，timer里会发生异常退出，也不会去连接websocket server
.z.ts:{if[0i = h; h::neg hopen tp;];if[0i = hws; hws::first r::(`$":ws://", ip)"GET / HTTP/1.1\r\nHost: ", ip, "\r\n\r\n";];}
/ 10秒检查一次，服务端关掉会重连
\t 10000

