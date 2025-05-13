<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${not empty title}"><h3>${title}</h3></c:if>
${createChildButton}
<c:if test="${fn:length(children)>0}">
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
	<div class="${child.selected?'selected':'unselected'} card">
	<c:url var="delUrl" value="${info.currentURL}">
		<c:param name="webaction" value="edit.deletePage" />
		<c:param name="page" value="${child.page.id}" />
	</c:url>
	<c:if test="${child.creator == info.userName && child.reactionSize == 0}"><a class="delete" href="${delUrl}"><i class="far fa-trash-alt" aria-hidden="true"></i></a></c:if>
	<c:if test="${not empty info.userName}">
   			<div class="creator">
   				<div class="row align-items-center">
   				<div class="col-1">
   				<div class="avatar">
   					<c:if test="${not empty child.creatorAvatarURL}">
   					<img src="${child.creatorAvatarURL}" alt="Avatar" />
   					</c:if><c:if test="${empty child.creatorAvatarURL}">
   					<i class="bi bi-person-fill"></i>
   					</c:if>
   				</div>
   				</div><div class="col">
	   					<div class="info">
		   					<div class="user">${child.creator} - <h4><a href="${child.url}">${child.fullLabel}</a></h4></div>
		   					<div class="creation-date">${child.creationDateString}, ${child.creationTimeString}</div>
	   					</div>
   				</div></div></div>
   				<div class="picto card-footer"><i class="fas fa-pencil-alt" aria-hidden="true"></i> ${child.modificationDateString}, ${child.modificationTimeString} <a href="${child.url}#reactions" title="${child.reactionSize} comments"><i class="fa fa-comment-o" aria-hidden="true"></i> ${child.reactionSize}</a></div>
   			
   			</c:if>
	</div>
</c:if></c:forEach>
</c:if> 