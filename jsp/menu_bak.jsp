<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if test="${empty menuCurrentPage}">
	<c:set var="menuCurrentPage" value="${info.root}" scope="request" />
</c:if>
<c:if test="${not empty menuDepth}">
	<c:set var="menuDepth" value="${menuDepth+1}" scope="request" />
</c:if>
<c:if test="${empty menuDepth}">
	<c:set var="menuDepth" value="1" scope="request" />
</c:if>
	<c:if test="${param._menufix}"><div class="menu_back_block"></div></c:if>
	<nav id="main-nav" class="${param._menufix?'fixed-top':'notfixeed-top'} ${empty info.userName?'not-logged':'logged'}">
		<c:if test="${!param._menularge}"><div class="${not empty param._menucontainer?param._menucontainer:''} main-nav"></c:if>
		<div class="navbar navbar-javlo navbar-expand-lg ${param._menularge?'large-menu':'small-menu'}"><div class="container-fluid">
		<c:if test="${!param.nologo}"><jsp:include page="logo.jsp" /></c:if>
		<c:if test="${fn:length(menuCurrentPage.realChildren)>0}">
		<div class="navbar-mobile">
			<div class="btn-group" role="group">
				<nav class="navbar navbar-dark">
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavBar" aria-controls="mainNavBar" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</nav>
				<c:if test="${not empty info.searchPageUrl}">
					<a class="btn btn-search" href="${info.searchPageUrl}">
						<i class="bi bi-search"></i>
					</a>
				</c:if>
				<c:if test="${not empty info.newsPageUrl}">
					<a class="btn btn-register" href="${info.newsPageUrl}">
						<i class="bi bi-rss-fill"></i>
					</a>
				</c:if>
				<c:if test="${not empty info.registerPageUrl}">
					<a class="btn btn-register" href="${info.registerPageUrl}">
						<i class="bi bi-gear-fill"></i>
					</a>
				</c:if>
				<c:if test="${not empty info.loginPageUrl && !info.loginPageUrl == info.registerPageUrl}">
					<a class="btn btn-register" href="${info.loginPageUrl}">
						<i class="bi bi-box-arrow-in-right"></i>
					</a>
				</c:if>			
			</div>
		</div>
		</c:if>
		<div class="collapse navbar-collapse justify-content-${not empty param.menuposition?param.menuposition:'end'}" id="mainNavBar">
			<div class="navbar navbar-expand-lg justify-content-${not empty param.menuposition?param.menuposition:'end'}">				
				<ul class="justify-content-${not empty param.menuposition?param.menuposition:'end'} navbar-nav ${menuDepth>1?' dropdown-menu':''}">
					<c:set var="index" value="1" />					
					<c:forEach var="child" items="${menuCurrentPage.children}" varStatus="status">
						<c:if test="${child.visibleForContext && not empty child.link}">
							<c:set var="dropdown" value="${param._menudropdown && child.visibleChildren}" />
							<c:if test="${param.subchild && child.selected}"><c:set var="selectedSubChild" value="${child}" /></c:if>
							<li	class="nav-item read-${child.readAccess} ${dropdown?'dropdown ':''}page_${child.name} depth-${menuDepth} index-${status.index}${status.last?' last-item':''} ${child.realContentAuto?'real-content ':'not-real-content '}${child.selected?contentContext.currentTemplate.selectedClass:''}${fn:length(child.children)>0?' has-children':' no-children'}${child.lastSelected?' last-item':''} item-${index}">
								<a class="nav-link ${dropdown?'dropdown-toggle ':''}" ${dropdown?'data-toggle="dropdown"':''} ${!child.realContentAuto && info.openExternalLinkAsPopup && not empty child.linkOn?'target="_blank"':''} href="${child.link}" data-page="${child.name}" title="${child.info.title}">
									${child.info.label} <c:if test="${child.selected}"><span class="visually-hidden">(${i18n.view['global.current-page']})</span></c:if>
								</a>
								<c:if test="${dropdown}">
									<div class="dropdown-menu">
									<c:forEach var="subchild" items="${child.children}" varStatus="substatus">
										<a class="dropdown-item" href="${subchild.url}">${subchild.info.label}</a>
									</c:forEach>
									</div>
								</c:if>
							</li>
							<c:set var="index" value="${index+1}" />
						</c:if>
					</c:forEach>					
				</ul></div>
				<c:if test="${not empty selectedSubChild}">
					<div class="navbar navbar-expand-lg justify-content-${not empty param.menuposition?param.menuposition:'end'} subchild">
						<ul class="justify-content-end navbar-nav ${menuDepth>1?' dropdown-menu':''} nav-pills">
							<c:set var="index" value="1" />					
							<c:forEach var="child" items="${selectedSubChild.children}" varStatus="status">
								<c:if test="${child.visibleForContext && not empty child.link}">
									<c:set var="dropdown" value="${param._menudropdown && child.visibleChildren}" />
									<c:if test="${child.selected}"><c:set var="selectedSubChild" value="${child}" /></c:if>
									<li	class="nav-item read-${child.readAccess} ${dropdown?'dropdown ':''}page_${child.name} depth-${menuDepth} index-${status.index}${status.last?' last-item':''} ${child.realContentAuto?'real-content ':'not-real-content '}${child.selected?contentContext.currentTemplate.selectedClass:''}${fn:length(child.children)>0?' has-children':' no-children'}${child.lastSelected?' last-item':''} item-${index}">
										<a class="nav-link ${dropdown?'dropdown-toggle ':''}" ${dropdown?'data-toggle="dropdown"':''} ${!child.realContentAuto && info.openExternalLinkAsPopup && not empty child.linkOn?'target="_blank"':''} href="${child.link}" data-page="${child.name}" title="${child.info.title}">
											${child.info.label} <c:if test="${child.selected}"><span class="visually-hidden">(${i18n.view['global.current-page']})</span></c:if>
										</a>
										<c:if test="${dropdown}">
											<div class="dropdown-menu">
											<c:forEach var="subchild" items="${child.children}" varStatus="substatus">
												<a class="dropdown-item" href="${subchild.url}">${subchild.info.label}</a>
											</c:forEach>
											</div>
										</c:if>
									</li>
									<c:set var="index" value="${index+1}" />
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				
				</div>

				<c:if test="${param._menujssearch || param._menusearch || param._menulogin}">
					<div class="nav-action-block">
				</c:if>
				<c:if test="${param._menujssearch}">
				<div class="mb-2 search-bloc collapse-bloc">
					<a class="btn-search my-2 my-sm-0 btn-sm" data-toggle="collapse" data-bs-toggle="collapse" href="#searchForm" aria-expanded="false" aria-controls="searchForm" title="${i18n.view['global.open-search']}"><i class="bi bi-search"></i></a>
					<div id="searchForm" class="collapse">
						<div class="card card-body">
							<form id="search-form">
								<input name="webaction" value="search.search" type="hidden" />
								<div class="input-group">
				            	<input id="staticSearchButton" class="form-control" type="text" placeholder="${i18n.view['global.search']}" aria-label="${i18n.view['global.search']}" accesskey="4" name="keywords">
				            	<div class="input-group-append">
				            	<button class="btn-search btn btn-primary" type="submit"><i class="bi bi-chevron-double-right"></i><span class="visually-hidden">${i18n.view['global.send']}</span></button>
				            	</div>
				            	<div id="staticSearchResult"></div>
				            	<a href="${info.staticRootURL}/sitemap.json" style="display: none;" id="staticSearchData">staticSeach data</a>
				            	</div>
				            </form>
			            </div>
		            </div>
	         	</div></c:if><c:if test="${param._menusearch}">
				<div class="mb-2 search-bloc collapse-bloc">
					<a class="btn-search my-2 my-sm-0 btn-sm" data-toggle="collapse" data-bs-toggle="collapse" href="#searchForm" aria-expanded="false" aria-controls="searchForm" title="${i18n.view['global.open-search']}"><i class="bi bi-search"></i></a>
					<div id="searchForm" class="collapse">
						<div class="card card-body">
							<form id="search-form" action="${not empty info.searchPageUrl?info.searchPageUrl:info.currentPageURL}">
								<input name="webaction" value="search.search" type="hidden" />
								<div class="input-group">
				            	<input class="form-control" type="text" placeholder="${i18n.view['global.search']}" aria-label="${i18n.view['global.search']}" accesskey="4" name="keywords">
				            	<div class="input-group-append">
				            	<button class="btn-search btn btn-primary" type="submit"><i class="bi bi-chevron-double-right"></i><span class="visually-hidden">${i18n.view['global.send']}</span></button>
				            	</div>
				            	</div>
				            </form>
			            </div>
		            </div>
				</div></c:if>
				<c:if test="${param._menulogin}">
				<div class="mb-2 login-bloc collapse-bloc">
					<a class="btn-login my-2 my-sm-0 btn-sm btn-user d-none-logged" data-bs-toggle="collapse" data-toggle="collapse" href="#loginForm" aria-expanded="false" aria-controls="loginForm" title="${i18n.view['login.nologin']}"><i class="bi bi-person-fill"></i></a>
					<a class="btn-login my-2 my-sm-0 btn-sm btn-user d-logged" data-bs-toggle="collapse" data-toggle="collapse" href="#loginForm" aria-expanded="false" aria-controls="loginForm"><i class="bi bi-person-fill"></i></a>
					<div id="loginForm" class="collapse"><jsp:include page="menu_login.jsp?noAjaxMenuLogin=true" /></div>
				</div></c:if>
				<c:if test="${param._menujssearch || param._menusearch || param._menulogin}">
					</div>
				</c:if>
				<c:if test="${fn:length(info.languages)>1}">
				<div class="lang-bloc">
					<div class="btn-group" role="group" aria-label="${vi18n['global.change-language']}">
					<c:forEach var="lg" items="${info.languages}">
					<a class="btn-lang" href="${info.languageURLs[lg]}" title="${info.languageMap[lg]}" lang="${lg}">${lg}</a>
					</c:forEach>
					</div>
				</div></c:if>
	</div></div>
	<c:if test="${!param._menularge}"></div></c:if>
	</nav>	

<c:set var="menuDepth" value="${menuDepth-1}" scope="request" />