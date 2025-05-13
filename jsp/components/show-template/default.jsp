<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="row">
	<c:forEach var="template" items="${templates}">
		<div class="col-6 col-md-4 col-lg-2">
			<div class="card border-secondary">
				<div class="card-header">${template.name}</div>
	  			<img class="card-img-top" src="${template.imageURL}" alt="${template.name}">
	   			<ul class="list-group list-group-flush">
	   				<c:if test="${not empty template.version}"><li class="list-group-item"><i class="fas fa-tag" aria-hidden="true"></i> ${template.version}</li></c:if>
	   				<c:if test="${not empty template.parent}"><li class="list-group-item"><i class="fas fa-level-up-alt"></i> ${template.parent}</li></c:if>
	   				<c:if test="${not empty template.authors}"><li class="list-group-item"><i class="fas fa-user" aria-hidden="true"></i> ${template.authors}</li></c:if>
 				</ul>  				    			
	  			<a href="${template.downloadURL}" class="card-footer text-center">
      				${i18n.view['global.download']}
    			</a>	
	  		</div>  		
		</div>
	</c:forEach>
</div>