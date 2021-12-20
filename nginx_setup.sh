#! /bin/bash -x
##Добавление репозиторие Nginx(для Debian)

echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" > /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/debian `lsb_release -cs` nginx" >> /etc/apt/sources.list.d/nginx.list

##Добавление ключа Nginx и обновление репозитория

apt install curl gnupg2 ca-certificates -y
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
apt update
apt upgrade

## Установка Nginx

apt install nginx
systemctl stop nginx

## Замена стартовой страницы

echo ' 
<!doctype html>
<html>
<head>
	
<meta charset="utf-8">
<title>Nginx Welcome page</title>
<style type="text/css">
body {background-color: palegreen; font-weight: bold}

h1 {color:red;text-align: center}

table {border-collapse: collapse;}

td {width: 50px; height: 50px}
.r1 {background-color: orange}
.r2 {background-color: blue}
.r3 {background-color: green}
.r4 {background-color: pink}
</style>
</head>

<body>

<script>
	var n=10; 
	var s;
	
	document.write("<table>");
	
	for (i=1;i<=n;i++)
	{
		document.write("<tr>");
	 
	  for (j=1;j<=n;j++)
	   {
		if (j<=i) s="class='r1'";
		else s="class='r2'";
		document.write ("<td "+s+"></td>");	   
	   }
		
		
	  document.write("</tr>");
	} 
		
	 
	
	document.write("</table>");
</script>

<br/>	
<h1> Wow!!! Amazing!!!</h1>	
<script>
	
	var n=10; 
	var s;
	
	document.write("<table>");
	
	for (i=1;i<=n;i++)
	{
		document.write("<tr>");
	 
	  for (j=1;j<=n;j++)
	   {
		st=(i+j)%3   
		if (st==0) s="class='r4'";
		else s="class='r3'";
		document.write ("<td "+s+"></td>");
	   }
				
	  document.write("</tr>");
	} 
	
	document.write("</table>");
</script>


</body>
</html>
' > /usr/share/nginx/html/index.html

systemctl start nginx
systemctl enable nginx
