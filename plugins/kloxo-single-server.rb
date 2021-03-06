##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kloxo-Single-Server" do # aka HyperVM aka LxAdmin
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-01 
version "0.1"
description "Kloxo (aka HyperVM aka LxAdmin) is a fully scriptable, distributed and a 100% object oriented hosting platform - Homepage: http://www.lxcenter.org/kloxo.htm"

# 70 results for "Use a valid username and password to gain access to the console" -lxcenter.org @ 2010-05-09

# Dorks #
dorks [
'"Use a valid username and password to gain access to the console" -lxcenter.org'
]

# Examples #
examples %w|
http://demo.kloxo.com:7778/login/
https://78.46.99.21:8887/login/
http://www.northstarhosting.ca:7778/login/
https://www.dedicadovirtual.com:8887/login/
https://www.wisdomcybernetics.com:7777/login/
https://vpscp.a2hosting.com:8887/login/
https://vps3.ionic.net.pl:8887/login/
http://marx.centicero.com:8888/login/
https://vps.thenynoc.com:8887/login/
http://vps6.bgwebart.com:7778/login/
https://88.86.110.6:8887/login/
http://74.95.64.75:7778/login/
http://breyn.be:7778/login/
http://zerghosting.hu:7778/login/
|

# Matches #
matches [

{ :text=>"<title> HyperVM 2.0 </title>" },

{ :text=>"<title> Kloxo </title>" },

# default lxadmin title",
{ :text=>"<title> Lxadmin </title>" },

# default logo html
{ :text=>'<img id=main_logo width=84 height=23 src="/img/hypervm-logo.gif">'
},

# login text # joomla and mambo use this string but without "</b>" 
{ :certainty=>75, :text=>"Use a valid username and password to gain access to the console</b>" },

# login css # fairly specific directory structure - no false positives on google
{ :text=>'@import url("/htmllib/lib/admin_login.css");' },

# fairly specific directory structure - no false positives on google 
{:name=>"login javascript",
:text=>'<script language=javascript src="/htmllib/js/preop.js"></script>'
},

# fairly specific HTML structure - no false positives on google
{:name=>"login form",
:text=>'<form name=loginform action="/htmllib/phplib/" onsubmit="encode_url(loginform) ; return fieldcheck(this);" method=post>'
}

]

end


