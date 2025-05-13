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
          </div>
        </div>

      <c:if test="${not empty taxonomySelected}">
        <c:forEach var="taxoChild" items="${taxonomySelected}">
          <c:if test="${fn:length(taxoChild.children)>0}">
            <div class="row align-items-center taxonomy-select mt-3">
              <div class="col">
                <div class="btn-container" role="group">
                  <c:set var="selected" value="false"/>
                  <c:forEach var="taxonomy" items="${taxoChild.children}" varStatus="status">
                    <c:if test="${fn:contains(taxonomySelectedIdString, taxonomy.id)}">
                      <c:set var="selected" value="true"/>
                    </c:if>
                  </c:forEach>
                  <button class="btn btn-outline-primary"
                          onclick="resetRadio('taxonomy');" ${!selected?'disabled="disabled"':''}>
                    <i class="bi bi-x-octagon"></i></button>
                  <c:forEach var="taxonomy" items="${taxoChild.children}" varStatus="status">
                    <input onchange="this.form.submit()" type="radio" name="taxonomy"
                           class="btn-check btn-sm" id="btnTaxo${taxonomy.id}" value="${taxonomy.id}"
                           autocomplete="off" ${fn:contains(taxonomySelectedIdString, taxonomy.id)?'checked="checked"':''}>
                    <label class="btn btn-outline-primary" for="btnTaxo${taxonomy.id}"
                           title="${taxonomy.pathLabel}">${taxonomy.label}</label>
                  </c:forEach>
                </div>
              </div>
            </div>
          </c:if>
        </c:forEach>
      </c:if>

      </form>


    </div>
</div>
</div>

