<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<p>${value}</p>
<form id="converter-form" action="${info.currentURL}" method="post" enctype="multipart/form-data">
	<input type="hidden" name="webaction" value="epub-converter-component.convert" />
	<input class="form-control" type="file" name="source" />
	<button class="btn btn-primary mt-3">convert</button>
</form>

<div class="list-group mt-3">
<c:forEach var="file" items="${latestConvertion}">
	<div class="list-group-item list-group-item-action">
		<div class="d-flex w-100 justify-content-between">
			<a href="${file.url2}"><h5 class="mb-1">${file.file2.name}</h5></a>
			<small>${file.modificationTime}</small>
		</div>
		<p class="mb-1"><a href="${file.url1}">${file.file1.name}</a></p>
	</div>
</c:forEach>
</div>