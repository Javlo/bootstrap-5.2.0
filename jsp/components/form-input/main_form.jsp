<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>

<input type="hidden" name="${name}-comp" value="${compid}" />
<jsp:include page="${field.type}.jsp" />
