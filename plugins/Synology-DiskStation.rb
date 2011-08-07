##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Synology-DiskStation" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-07
version "0.1"
description "Synology DiskStation provides a full-featured Network Attached Storage (NAS) solution which offers RAID storage, backup, and network surveillance (NVR). - Homepage: http://www.synology.com/"

# ShodanHQ results as at 2011-08-07 #
# 545 for webman
# 534 for webman/index.cgi

# Google results as at 2011-08-07 #
# 60 for intitle:"Synology DiskStation" inurl:"webman/index.cgi"

# Dorks #
dorks [
'intitle:"Synology DiskStation" inurl:"webman/index.cgi"'
]

# Examples #
examples %w|
114.32.160.208:5000
178.192.156.74
77.251.129.204:5000
lss.lawsonsupportservices.com:5000
www.thegpf.com:5000
evergreenstables.com:5000
jutten.homeip.net:5000
|

# Matches #
matches [

# Extract Device Name # Title
{ :string=>/<title>Synology DiskStation - ([^\s]+)<\/title>/ },

# HTML Comment
{ :text=>"<!-- Don't contain any text node to avoid IE insertBefore bug -->" },

# JavaScript
{ :text=>'<script type="text/javascript">SYNO.SDS.Session = {' },

# div id="sds-login-dialog-form"
{ :text=>'<div id="sds-login-dialog-form" style="position: absolute; top: -10000px; left: -10000px;"><form id="login-form" class="x-plain-body" method="POST" action="login.cgi" target="login_iframe"' },

# Version Detection
{ :url=>"/webman/index.cgi", :version=>/<script type="text\/javascript" src="synodefs\.cgi\?v=([\d]+)"><\/script>/ },

]

end
