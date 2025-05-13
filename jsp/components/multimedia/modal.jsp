<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:set var="resourceDescription" value="" /><c:if test="${not empty resource.title}"><c:set var="resourceDescription" value="${resource.title}" /></c:if>
<div class="modal picture-modal" id="md${resource.id}"><div class="modal-dialog ${info.device.mobileDevice?'modal-full':'modal-lg'}"><div class="modal-content"><div class="modal-header">
<div class="row"><div class="col-sm-2 col-xs-0"><div class="commands hidden-xs">
<a href="${resource.absoluteURL}" target="_blanck" class="btn btn-default btn-download" role="button" title="${i18n.view['global.download']}"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a>
<c:if test="${not empty param.share}">
<jv:changeFilter var="sharingURL" url="${resource.absolutePreviewURL}" filter="preview" newFilter="sharing" />
<c:url var="facebookSharing" value="http://www.facebook.com/share.php">
	<c:param name="u" value="${sharingURL}" />	
</c:url>
<a href="${facebookSharing}" target="_blanck" class="btn btn-default btn-share" role="button" title="Share on Facebook" lang="en"><span class="fa fa-facebook" aria-hidden="true"></span></a>
<c:if test="${resource.freeAccess}">
<c:url var="twitterSharing" value="http://twitter.com/share">
	<c:param name="url" value="${sharingURL}" />
	<c:param name="text" value="${resourceDescription}" />
</c:url>
<a href="${twitterSharing}" target="_blanck" class="btn btn-default btn-share" role="button" title="Share on Twitter" lang="en"><span class="fa fa-twitter" aria-hidden="true"></span></a>
</c:if>
<c:url var="pinterestSharing" value="http://pinterest.com/pin/create/button/">
	<c:param name="media" value="${sharingURL}" />
	<c:param name="description" value="${resourceDescription}" />
</c:url>
<a href="${pinterestSharing}" target="_blanck" class="btn btn-default btn-share" role="button" title="Share on Pinterest" lang="en"><span class="fa fa-pinterest" aria-hidden="true"></span></a>
</c:if>
</div></div>
<div class="col-sm-8 col-xs-6"><h3 class="modal-title">${not empty resourceDescription?resourceDescription:resource.name}</h3></div>
<div class="col-sm-2 col-xs-6">
<div class="pull-right btn-group">
<a href="#" class="btn btn-primary btn-previous disabled" role="button" data-lnk="lnk${resource.id}" id="previous${resource.id}"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>
<button type="button" class="btn btn-default btn-play" data-dismiss="modal" aria-label="Play" lang="en"><span class="glyphicon glyphicon-play" aria-hidden="true"></span></button>
<button type="button" class="btn btn-default btn-pause btn-success" data-dismiss="modal" aria-label="Pause" lang="en"><span class="glyphicon glyphicon-pause" aria-hidden="true"></span></button>
<button type="button" class="btn btn-default btn-full" data-dismiss="modal" aria-label="Full" lang="en"><span class="glyphicon glyphicon-resize-full" aria-hidden="true"></span></button>
<button type="button" class="btn btn-default btn-small" data-dismiss="modal" aria-label="Small" lang="en"><span class="glyphicon glyphicon-resize-small" aria-hidden="true"></span></button>
<button type="button" class="btn btn-default btn-close" data-dismiss="modal" aria-label="Close" lang="en"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
<a href="#" class="btn btn-primary btn-next disabled" role="button" data-lnk="lnk${resource.id}" id="next${resource.id}"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></a>
</div>
</div>
</div></div>     
<jv:changeFilter var="resourceURL" url="${resource.previewURL}" filter="preview" newFilter="large" />
<c:url var="resourceURL" value="${resourceURL}" context="/" /> 
<div class="modal-body"><div class="thumbnail"><div class="vertical"></div><img src="${info.viewAjaxLoaderURL}" data-src="${resourceURL}" alt="${resourceDescription}" />
<div class="caption"><c:if test="${not empty resource.shortDate}"><span class="date"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> ${resource.shortDate}</span></c:if>	        
<c:if test="${not empty resource.location}"><p class="position">
<c:if test="${not empty resource.location}"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> ${resource.location}</c:if></p></c:if>
<c:if test="${not empty resource.copyright}"><p class="copyright">${resource.copyright}</p></c:if>
<c:if test="${not empty resource.description}"><p class="description">${resource.description}</p></c:if>        
</div></div></div></div></div></div><script type="text/javascript">
var thumb = document.getElementById('md${resource.id}');
thumb.addEventListener("mousewheel", function(e) {
	if (e.wheelDelta < 0) {
		$('#md${resource.id} .btn-next').trigger('click');
	} else {
		$('#md${resource.id} .btn-previous').trigger('click');
	}
}, false);
var mc = new Hammer(thumb);
mc.on("panleft", function(ev) {
	$('#md${resource.id} .btn-next').trigger('click');
});
mc.on("panright", function(ev) {
	$('#md${resource.id} .btn-previous').trigger('click');
});
mc.on("pinchout", function(ev) {
	$('#md${resource.id} .btn-close').trigger('click');
	return false;
});
var image = $('#md${resource.id} img');
$(thumb).on('shown.bs.modal', function(e) {
	if ($('#md${resource.id} .modal-full').length > 0) {
		askFullscreen();
		modalImageHeightItem($('#md${resource.id} img'));	
		//$('#md${resource.id} img').css('max-height', $(window).height()-8);
	}
});
</script>