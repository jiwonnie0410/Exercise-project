<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<script type="text/javascript" src="/data/201012/IJ12925149866705/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="/data/201012/IJ12925149866705/jquery.circlemenu.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
	<!--[if lt IE 9]>
		<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<style type="text/css">
body { height:1024px; text-align:center; background:#000 url(bg.png) center center no-repeat; overflow:hidden; color:#f0f; font-family:"trebuchet ms"; padding:0; margin:0 }

h1:hover {color:#a00 }
span { border:2px solid #f9f }
span:hover { border-color:#fff !important }

.orbital { background:#202; top:300px; width:55px; height:55px; left:300px; padding:0px;line-height:55px;
border:1px solid #a0a; 
border-radius:300px !important;
-moz-border-radius:300px !important;
-webkit-border-radius:300px !important; }

.orbit .orbit .orbit span { background:rgba(50,255,255,0.2); color:#4aa; border-color:#6ff }
.orbit .orbit .orbit .orbit span { background:rgba(255,185,40,0.2); color:#ca6; border-color:#fc5 }

.orbit { border:1px solid #d6d;
border-radius:200px;
background:url(ietrans.gif); 
-moz-border-radius:200px; 
-webkit-border-radius:200px;  }
.orbit span { display:block; background:rgba(255,0,255,0.25); width:32px; height:32px; line-height:32px;
border-radius:32px; 
-moz-border-radius:32px; 
-webkit-border-radius:32px; }

#examples { position:fixed; color:#bbd; padding:4px;}
#examples a { color:inherit; text-decoration:none }
#examples a.example {color:#fff; font-size:12px; font-weight:bold; background:#ccc; color:#222; padding:4px; text-shadow:0 -1px 2px #fff; border-top:1px solid #eee; border-radius:4px; -moz-border-radius:4px; -webkit-border-radius:4px; }
#examples h1 { color:#f0a; display:inline }	
#examples a.example:hover { background:#fff }

.orbital3, .orbital4, .orbital2 { border-style:dotted; }
</style>

<script type="text/javascript">
	$( function() {
		$(".orbital4").jOrbital({});
		$(".orbital3").jOrbital({});
		$(".orbital2").jOrbital({});
		$(".orbital").jOrbital({});
		
		
	});
</script>

</head>

<body>



<div class="orbital">MENU

<div class="orbit">
<span class="orbital">1</span>
<span class="orbital2">2
	<div class="orbit">
		<span>1</span>
		<span>2</span>
		<span>3</span>
		<span>4</span>
		<span>5</span>
		<span>6</span>
	</div>
</span>
<span class="orbital">3</span>
<span class="orbital">4</span>
<span class="orbital2">5
	<div class="orbit">
		<span>1</span>
		<span>2</span>
		<span>3</span>
		<span class="orbital3">4
			<div class="orbit">
				<span>1</span>
				<span>2</span>
					<span class="orbital4">4
						<div class="orbit">
							<span>1</span>
							<span>2</span>
							<span>3</span>
							<span>4</span>
							<span>5</span>
						</div>
				</span>
				<span>3</span>
				<span>4</span>						
			</div>
		</span>
		<span>5</span>
	</div>
</span>
</div>
</div>

</body>
</html>