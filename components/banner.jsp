<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%><div class="thumbnail">	
		<figure><img src="${image.previewURL}" alt="${image.label}" /></figure>
		<div class="text-wrapper ${position.value} ${color.value} ${title.size}">
			<div class="text">
				<div class="number"><c:if test="${number.value > 0}"><span class="count-title count-number" data-to="${number.value}" data-speed="${number.value > 30?'5000':'1000'}"></span></c:if><span class="unity">${unity.value}</span></div>	
				<p class="title">${title.displayValue}</p>
			</div>
		</div>
	</div>
  	
