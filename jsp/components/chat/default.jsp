<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="card card-chat">
	<c:if test="${not empty fields.title}"><div class="card-header">${fields.title}</div></c:if>
	<div class="card-body">
		<div class="discution">
			
		</div>
	</div>
	<div class="card-footer">
		<form class="form-add-msg" action="${info.currentURL}" method="post">
			<input type="hidden" name="webaction" value="chat.addmessage" />
			<input type="hidden" name="comp-id" value="${compid}" />
			<input class="input-reply" type="text" placeholder="${fields.replyLabel}" />
		</form>
	</div>
</div>