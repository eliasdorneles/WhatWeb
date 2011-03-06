##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "crossdomain.xml" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-01-09
version "0.1"
description "This plugin extracts allowed domain from crossdomain.xml"

# 61 results for ext:xml "allow-access-from domain" inurl:"crossdomain.xml"

# Examples #
examples %w|
video.google.com/crossdomain.xml
youtube.com/crossdomain.xml
lwbcmn.org/crossdomain.xml
www.davidstephenson.com/crossdomain.xml
deviantart.com/crossdomain.xml
|

# Matches #
matches [

	# Default text
	{ :text=>'<cross-domain-policy>', :path=>"crossdomain.xml" },

	{ :text=>'<site-control permitted-cross-domain-policies="none"/>', :string=>"none", :module=>"Permit", :path=>"crossdomain.xml" },

	# Extract allowed domains
	{ :string=>/<allow-access-from domain="([^"]+)"/, :offset=>0, :path=>"crossdomain.xml", :module=>"Allow" },

]

end
