<%@ taglib uri="jakarta.tags.core" prefix="c"%><%@
  taglib prefix="fn" uri="jakarta.tags.functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${empty menuCurrentPage}">
  <c:set var="menuCurrentPage" value="${info.root}" scope="request" />
</c:if>
<c:if test="${not empty menuDepth}">
  <c:set var="menuDepth" value="${menuDepth+1}" scope="request" />
</c:if>
<c:if test="${empty menuDepth}">
  <c:set var="menuDepth" value="1" scope="request" />
</c:if>
<nav class="navbar navbar-expand-md ${param._menufix?'fixed-top':''}">
  <div class="${param._menularge?'container-fluid':'container'} nav-container">
    <jsp:include page="logo.jsp" />
    <button id="navbarCollapseCommand" class="navbar-toggler hamburger hamburger--elastic collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation" lang="en">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
    </button>

    <div class="navbar-collapse collapse d-sm-flex justify-content-between" id="navbarCollapse" style="">
      <ul class="navbar-nav mb-2 mb-md-0 flex-fill justify-content-${globalContext.templateData.menuAlign}">
        <c:forEach var="child" items="${info.page.section}" varStatus="status">
          <li class="nav-item index-${status.index}${status.last?' last-item':''}">
            <a class="nav-link" href="#${child.sectionId}"> <span>${child.title}</span></a>
          </li>
          <c:set var="index" value="${index+1}" />
        </c:forEach>
      </ul>

      <div class="nav-actions d-flex justify-content-end">

        <c:if test="${param._menulogin}">
          <div class="login-bloc collapse-bloc me-3">
            <a class="btn-login btn btn-sm btn-user d-none-logged btn-outline-secondary" data-bs-toggle="modal" href="#loginForm" aria-expanded="false" aria-controls="loginForm" title="${i18n.view['login.nologin']}"> <i class="bi bi-person-fill"></i>
            </a> <a class="btn-login btn btn-sm btn-user d-logged" data-bs-toggle="modal" href="#loginForm" aria-expanded="false" aria-controls="loginForm"> <i class="bi bi-person-fill"></i>
          </a>
          </div>
        </c:if>

        <c:if test="${param._menujssearch}">
          <div class="search-bloc collapse-bloc">
            <a class="btn-search btn btn-outline-secondary btn-sm me-3" onclick="document.getElementById('staticSearchButton').focus();" data-bs-toggle="modal" href="#searchForm" aria-expanded="false" aria-controls="searchForm" title="${i18n.view['global.open-search']}">
              <i class="bi bi-search"></i>
            </a>
          </div>

        </c:if>

        <c:if test="${fn:length(info.languages)>1}">
          <form method="get" action="${info.currentURL}">
            <div class="lang-bloc">
              <input type="hidden" name="webaction" value="view.language" />
              <select name="lg" class="form-select" onchange="this.form.submit();" aria-label="${vi18nAttribute['global.change-language']}">
                <c:forEach var="lg" items="${info.languages}">
                  <option ${info.language==lg?' selected':''} value="${lg}">${lg}</option>
                </c:forEach>
              </select>
            </div>
          </form>
        </c:if>
      </div>
    </div>

  </div>
</nav>

<div id="loginForm" class="modal" tabindex="-1"><jsp:include page="menu_login.jsp?noAjaxMenuLogin=true" /></div>

<div id="searchForm" class="modal" tabindex="-1">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">${i18n.view['global.search']}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="search-form">
          <input name="webaction" value="search.search" type="hidden" />
          <div class="input-group">
            <input id="staticSearchButton" class="form-control" type="text" placeholder="${i18n.view['global.query']}" aria-label="${i18n.view['global.search']}" accesskey="4" name="keywords">
            <button class="btn-search btn btn-outline-primary" type="submit">
              <i class="bi bi-chevron-double-right"></i><span class="visually-hidden">${i18n.view['global.send']}</span>
            </button>
          </div>
        </form>
        <div id="staticSearchResult"></div>
        <a href="${info.jsonSiteMapUrl}" style="display: none;" id="staticSearchData">staticSeach data</a>
      </div>
    </div>
  </div>
</div>

<c:set var="menuDepth" value="${menuDepth-1}" scope="request" />
