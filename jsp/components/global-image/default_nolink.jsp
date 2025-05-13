<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%>
<c:set var="imageAlt" value="${not empty label?cleanLabel:cleanDescription}" />
<c:if test="${not empty file && not empty file.htmlTitle || not empty file.htmlDescription}">
	<c:if test="${not empty file.htmlTitle && not empty file.htmlDescription}">
		<c:set var="imageAlt" value="${file.htmlTitle} : ${file.htmlDescription}" />
	</c:if>
	<c:if test="${empty file.htmlTitle || empty file.htmlDescription}">
		<c:set var="imageAlt" value="${file.htmlTitle}${file.htmlDescription}" />
	</c:if>
</c:if>

<c:set var="imageWidthTag" value="" />
<c:if test="${not empty imageWidth && info.device.pdf}">
	<c:set var="imageWidthTag" value='width="${imageWidth}" ' />
</c:if>
<c:set var="useLoadImage" value="${info.area != 'header' && info.area != 'banner' && param._loadImage}" />
<c:set var="imageStyle" value="" />
<c:if test="${not empty componentWidth}">
	<c:set var="imageStyle" value=" style=\" width: ${componentWidth}\""/>
</c:if>
<div ${previewAttributes}>
	<div id="test" class="${cssClass}">

				<figure class="${type} img-${comp.id} ${svg?'svg':'not-svg'} ${not empty param.headerCaption?'balls-zone':''} ${manualCssClass}">
					<div class="nolink">
						<c:if test="${!info.device.pdf}">
							<picture class="img-fluid">
							<c:if test="${filter != 'raw'}"><source media="(max-width: 767px)" srcset="${smURL}" /></c:if>
						</c:if>
						<c:if test="${filter != 'raw'}">
							<img id="img-${compid}" data-compid="${compid}" class="img-fluid${info.device.pdf?' return-size':''}" src="${previewURL}" srcset="${smURL} (max-width: 640px), ${lgURL} 2x" alt="${imageAlt}" ${imageStyle} ${imageWidthTag} ${editPreview?"onload='editPreview.returnSize();'":""} />
						</c:if><c:if test="${filter == 'raw'}">
							<img id="img-${compid}" data-compid="${compid}" class="img-fluid${info.device.pdf?' return-size':''}" src="${previewURL}" alt="${imageAlt}" ${imageStyle} ${imageWidthTag} ${editPreview?"onload='editPreview.returnSize();'":""} />
						</c:if>
						<c:if test="${!info.device.pdf}">
							</picture>
						</c:if>
						<c:if test="${not empty param.headerCaption && info.device.code != 'pdf'}">
							<div class="caption-out-wrapper">
								<div class="caption">
									<h1>${info.title}</h1>
                  <c:set var="description" value="${info.pageDescription}" />
                  <c:if test="${not empty description}">
                    <p>${description}</p>
                  </c:if>
								</div>
							</div>
						</c:if>
					</div>
					<c:if test="${empty param.nolabel && not empty label || not empty description && empty param.headerCaption}">
						<figcaption>${not empty label?label:description}</figcaption>
					</c:if>
				</figure>
			
	</div>
</div>
