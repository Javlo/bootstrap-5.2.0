<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${empty param.pwtoken}">
	<div class="widgetbox edit-user-avatar mb-3">
		<h3>Avatar</h3>
		<div class="row">
			<div class="col">
				<input type="file" name="avatar" />
			</div>
			<div class="col-6">
				<img class="img-thumbnail" src="${info.currentUserAvatarUrl}" />
			</div>
		</div>
	</div>
</c:if>