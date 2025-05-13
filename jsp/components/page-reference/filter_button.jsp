<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%>
<div id="page-reference-filter">
  <div class="card mb-3 mt-3 card-search">
    <div class="card-body">
      <form action="${info.currentURL}" method="get">
        <div class="row justify-content-center">
          <div class="col-12 col-sm-10 col-lg-8 col-xl-6">
            <div class="input-group input-group-search">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
              <input id="freetext-${compid}" type="text" name="query" class="form-control"
                     aria-label="${i18n.view['global.search']}"
                     placeholder="${i18n.view['global.placeholder.search']}" value="${param.query}"/>
              <button type="submit" class="btn btn-primary btn-md">${i18n.view['global.search']}</button>
            </div>


      <c:if test="${not empty taxonomySelected}">
        <div class="taxonomy-filter row justify-content-between mt-3">
        <c:forEach var="taxoChild" items="${taxonomySelected}" varStatus="status">
          <c:if test="${fn:length(taxoChild.children)>0}">

            <div class="col select">
              <label for="st-${status.index}">${taxoChild.label}</label>
              <select name="taxonomy-${status.index}" class="form-select" id="st-${status.index}" onchange="this.form.submit()">
                <option></option>
                <c:set var="paramName" value="taxonomy-${status.index}" />
              <c:forEach var="tsc" items="${taxoChild.children}" varStatus="status">
                <option value="${tsc.id}" <c:if test="${param[paramName] == tsc.id}">selected="selected"</c:if>>${tsc.label}</option>
              </c:forEach>
              </select>
            </div>

          </c:if>
        </c:forEach>
        </div>
      </c:if>

          </div>
        </div>

      </form>


    </div>
</div>
</div>

