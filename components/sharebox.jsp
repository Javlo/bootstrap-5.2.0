<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>	
<ul>
<li>${compPage.name}</li>			
<c:if test="${print.value eq 'true'}">
<li class="print"><div>
		<a target="_blank" href="#" lang="en" onclick="window.print(); return false;">print</a>
	</div></li></c:if>
<c:if test="${pdf.value eq 'true'}">
<li class="pdf"><div>
		<a target="_blank" href="${compPage.pdfAbsoluteUrl}">PDF</a>
	</div></li></c:if>						
<c:if test="${facebook.value eq 'true'}">
	<li class="facebook">
		<div>
			<a href="https://www.facebook.com/sharer.php?u=${compPage.absoluteUrlEncoded}" lang="en" rel="nofollow" target="_blank" title="Share on Facebook" lang="en">facebook</a>
		</div>
	</li></c:if><c:if test="${twitter.value eq 'true'}">
	<li class="twitter">
		<div>
			<a
				href="http://twitter.com/home?status=${compPage.titleOrSubtitle} ${compPage.absoluteUrl}"
				lang="en" rel="nofollow" target="_blank" title="Share on Twitter" lang="en">Twitter</a>
		</div>
	</li></c:if>		
	<c:if test="${url.value eq 'true'}">
	<li class="short-url"><div>
			<a type="text" href="${compPage.shortURL}" title="Get short URL" lang="en">short url</a>
		</div></li></c:if>
</ul>												