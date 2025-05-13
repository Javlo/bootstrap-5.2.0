<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${empty menuCurrentPage}">
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

		<script>
		document.addEventListener('DOMContentLoaded', function() {
		    document.getElementById('navbarCollapseCommand').onclick = function() {
		    	if (this.classList.contains("is-active")) {
		    		this.classList.remove("is-active")
		  		} else {
		  			this.classList.add("is-active")
		  		}
			}
		});
		</script>

		<div class="navbar-collapse collapse d-sm-flex justify-content-between" id="navbarCollapse" style="">
			<ul class="navbar-nav mb-2 mb-md-0 flex-fill justify-content-${globalContext.templateData.menuAlign}">
				<c:forEach var="child" items="${menuCurrentPage.children}" varStatus="status">
					<c:if test="${child.visibleForContext && not empty child.link}">
						<c:set var="dropdown" value="${param._menudropdown && child.visibleChildren}" />
						<c:if test="${param.subchild && child.selected}">
							<c:set var="selectedSubChild" value="${child}" />
						</c:if>
						<li class="nav-item read-${child.readAccess} ${dropdown?'dropdown ':''}page_${child.name} depth-${menuDepth} index-${status.index}${status.last?' last-item':''} ${child.realContentAuto?'real-content ':'not-real-content '}${child.selected?contentContext.currentTemplate.selectedClass:''}${fn:length(child.children)>0?' has-children':' no-children'}${child.lastSelected?' last-item':''} item-${index}">
						<a ${child.selected?'aria-current="true"':''} class="nav-link ${dropdown?'dropdown-toggle ':''} ${child.selected?contentContext.currentTemplate.selectedClass:''}" ${dropdown?'data-bs-toggle="dropdown"':''} ${!child.realContentAuto && info.openExternalLinkAsPopup && not empty child.linkOn?'target="_blank"':''} href="${child.link}" data-page="${child.name}" title="${child.info.title}"> <span>${child.info.label}</span> <c:if test="${child.selected}">
									<span class="visually-hidden">(${i18n.view['global.current-page']})</span>
								</c:if>
						</a><c:if test="${dropdown}">
								<div class="dropdown-menu ${param._extendsub?'extendsub':'not-extendsub'}">
									<div class="dropdown-menu-inwrapper">
										<c:forEach var="subchild" items="${child.children}" varStatus="substatus">
											<a class="dropdown-item" href="${subchild.url}" ${subchild.selected?'aria-current="page"':''}>
											<div class="image">
											<c:if test="${param._extendsub && not empty subchild.font}"><div class="font">${subchild.font}</div></c:if>
											<c:if test="${param._extendsub && not empty subchild.image && empty subchild.font}"><jv:changeFilter var="newURL" url="${subchild.image.previewURL}" filter="standard" newFilter="extendsub" /><img src="${newURL}" alt="${subchild.image.description}" /></c:if>
											</div>
											<span class="text">
											<span class="label">${subchild.info.label}</span>
											<c:if test="${param._extendsub && not empty subchild.description}"><span class="description">${subchild.description}</span></c:if>
											</span>
											</a>
										</c:forEach>
									</div>
								</div>
							</c:if></li>
						<c:set var="index" value="${index+1}" />
					</c:if>
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
								<c:forEach var="lg" items="${info.languagesLocale}">
									<option ${info.languageOnly==lg.language && info.country==fn:toLowerCase(lg.country)?' selected':''}
                    value="${lg.language}-${fn:toLowerCase(lg.country)}">
                      ${lg.displayName}
                  </option>
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
