<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div ${previewAttributes}>
<div class="row">
	<div class="head col-md-12">
		<div class="wrapper">
			<div class="box">
				<a href="${info.currentURL}">${value}</a>
				<a href="${info.sectionUrl}">${info.sectionTitle}</a>
			</div>
		</div>
	</div>
</div>
</div>