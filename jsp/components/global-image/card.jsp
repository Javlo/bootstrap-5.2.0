<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>
<div ${previewAttributes}>
    
<c:if test="${comp.style == 'image-center'}">
<div class="card">
<div class="card-img-top"><div class="outer"><div class="inner"><img src="${previewURL}" srcset="${smURL} (max-width: 640px), ${lgURL} 2x" alt="${resourceLabel}" /></div></div></div>
<div class="card-body align-items-center">
<div class="half-container">${label}</div>
</div>
</div>
</c:if>

<c:if test="${comp.style == 'image-left'}">
    <div class="card mb-3">
        <div class="row no-gutters">
            <div class="col-md-4"><img src="${previewURL}" alt="${resourceLabel}" class="card-img"></div>
            <div class="col-md-8"><div class="card-body">${label}</div></div>
    </div>
    </div>
</c:if>              

<c:if test="${comp.style == 'image-right'}">
    <div class="card mb-3">
        <div class="row no-gutters">            
            <div class="col-md-8"><div class="card-body">${label}</div></div>
            <div class="col-md-4"><img src="${previewURL}" alt="${resourceLabel}" class="card-img"></div>
    </div>
    </div>
</c:if>              

</div>