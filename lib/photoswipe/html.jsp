<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><c:if test="${empty _pswpInsered}"><c:set var="_pswpInsered" value="true" scope="request" />
<script>
	function loadPhotoswipeCSS() {
		var head = document.getElementsByTagName('head')[0];
		var cssId = 'photoswipeBasicCss'; // you could encode the css path itself to generate id..
		if (!document.getElementById(cssId)) {
			var link = document.createElement('link');
			link.id = cssId;
			link.rel = 'stylesheet';
			link.type = 'text/css';
			link.href = '${info.rootTemplateURL}/lib/photoswipe/photoswipe.css';
			link.media = 'all';
			head.appendChild(link);
		}
	}
	function initPhotoSwipeFromDOM(gallery) {
	}
	loadPhotoswipeCSS();
</script>
</c:if>

<script type="module">
import PhotoSwipeLightbox from '${info.rootTemplateURL}/lib/photoswipe/photoswipe-lightbox.esm.js';
const lightbox = new PhotoSwipeLightbox({
  gallery: '.clickable-multimedia, .global-image.no-link',
  children: 'a',
  preload: [1],
  showHideAnimationType: 'zoom',
  showAnimationDuration: 500,
  hideAnimationDuration: 300,
  pswpModule: () => import('${info.rootTemplateURL}/lib/photoswipe/photoswipe.esm.js')
});
lightbox.init();
</script>
