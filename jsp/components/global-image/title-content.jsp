<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>
<div ${previewAttributes}>
<div class="image-title-content">
<div class="border-image-title">
	<div class="bloc bloc-top">&nbsp;</div>
	<div class="bloc bloc-bottom">&nbsp;</div>
</div>
<div class="bloc-image">
	<img src="${previewURL}" srcset="${smURL} (max-width: 640px), ${lgURL} 2x" alt="${file.title}" />
</div>
<div class="border-image-title">
	<div class="bloc bloc-top">&nbsp;</div>
	<div class="bloc bloc-bottom">&nbsp;</div>
</div>
</div>
</div>
