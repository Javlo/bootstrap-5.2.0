<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"
%>
<%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv" %>
<c:set var="contentZone" value="${fn:contains(contentContext.area,'content')}"/><c:if test="${fn:length(files)>0}">
  <jsp:include page="title.jsp"/>
  <div class="row">
    <c:forEach var="file" items="${files}" varStatus="status">
      <div class="${contentZone?'col-md-3':'col-md-6'} mb-3">
        <a href="${file.URL}" title="${file.title}">
          <figure class="thumbnail">
            <jv:changeFilter var="newURL" url="${file.thumbURL}" filter="list" newFilter="width-4"/>
            <img src="${newURL}" alt="preview of ${file.name}" />
            <c:if test="${not empty file.title}">
              <figcaption>
                <c:if test="${not empty file.date}">
                  <div class="file-date">${file.date}</div>
                </c:if>
                <c:if test="${fn:length(file.taxonomy) > 0}">
                <div class="taxonomies">
                  <c:forEach var="taxo" items="${file.taxonomyBean}">
                    <div class="text-muted taxonomy badge">
                      <span class="text">${empty taxo.labels[info.language]?taxo.name:taxo.labels[info.language]}</span>
                    </div>
                  </c:forEach>
                </div>
                  </c:if>
                <c:if test="${not empty file.title}"><p>${file.title}</p></c:if>
              </figcaption>
            </c:if>
          </figure>
        </a>
        <c:if test="${not empty file.translation && fn:length(file.translation)>=1}">
          <div class="btn-group translation" role="group" aria-label="translation">
            <c:forEach var="translation" items="${file.translation}" varStatus="status">
              <a class="btn btn-default btn-xs" href="${translation.URL}"
                 title="${translation.title}">${translation.beanLanguage}</a>
            </c:forEach>
          </div>
        </c:if>
      </div>
    </c:forEach>
  </div>
</c:if>
