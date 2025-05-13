<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(pages)>0}"><div class="page-reference">
	<c:if test="${not empty param.shortList}">
		<div class="short">
	</c:if>	
	<c:if test="${not empty field.title}">
		<h2>${field.title}</h2>
	</c:if>
	<ul class="products">
		<c:forEach items="${pages}" var="page" varStatus="status">
			<c:set var="image" value="${null}" />
			<c:if test="${fn:length(page.images)>0 && param.image}">
				<c:set var="image" value="${page.images[0]}" />
			</c:if>
			<c:set var="style" value="" />
			<c:set var="cssClass" value="" />
			<c:if test="${page.color.filled}">
				<c:set var="style" value='style="background-color: ${page.color.HTMLCode}; color: ${page.color.text.HTMLCode};"' />
				<c:set var="cssClass" value=" page-color color-${page.color.dark?'dark':'ligth'}" />	
			</c:if>
			<li class="item item-${status.index+1} ${status.index%2==0?'odd':'even'} ${page.toTheTopLevel>0?'top':''}${cssClass}" ${style}>				
				<div class="thumbnail"><div class="row"><c:if test="${not empty image}"><div class="col-md-3 col-img">
					<figure>
						<a ${not empty field.popup?'class="popup" ':''}title="${page.titleForAttribute}" href="${page.linkOn}">
							<img class="img-responsive" src="${image.url}" class="frame" alt="${image.description}" />
						</a>
					</figure>
					</div>
				</c:if>
				<div class="col-md-${param.image?'9':'12'} col-caption">
				<div class="caption">
					<c:if test="${globalContext.collaborativeMode && not empty page.creator}">
						<div class="authors">${page.creator}</div>
					</c:if>					
					<h3><a ${not empty field.popup?'class="popup" ':''}title="${page.titleForAttribute}" href="${page.linkOn}">${page.title}</a></h3>
					<div class="meta date"><i class="far fa-calendar-alt"></i> ${page.startDate} - ${page.endDate}</div>
					<c:if test="${not empty page.location}"><div class="meta location"><i class="fas fa-map-marker-alt"></i> ${page.location}</div></c:if>
					<c:if test="${not empty page.description && empty param.shortList}">
						<p class="description">${page.description}</p>
					</c:if>
				</div>
				</div>
			</div>
				<c:if test="${fn:length(page.userData)>0}">
					<h4>${field['list-title']}</h4>
					<table class="userData table">
						<thead>
							<tr>
							<c:if test="${page.userData[0]['firstName'] != null}"><th>${i18n.view['field.firstname']}</th></c:if>
							<c:if test="${page.userData[0]['lastName'] != null}"><th>${i18n.view['field.lastname']}</th></c:if>
							<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${page.userData}" varStatus="status">
							<tr>
							<c:if test="${page.userData[0]['firstName'] != null}"><td>${data.firstName}</td></c:if>
							<c:if test="${page.userData[0]['lastName'] != null}"><td>${data.lastName}</td></c:if>
							<c:url var="editUrl" value="${page.linkOn}" context="/">
								<c:param name="line" value="${status.index}" />
							</c:url>
							<td><a href="${editUrl}" class="btn btn-secondary btn-sm btn-block${not empty field.popup?' popup':''}">${i18n.view['global.change']}</a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				</div></li>
		</c:forEach>
	</ul>
	<c:if test="${not empty param.shortList}">
		</div>
	</c:if>
	</div>
</c:if>