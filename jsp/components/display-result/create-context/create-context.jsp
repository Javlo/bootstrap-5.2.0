<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="create-context">
	<form action="${info.currentURL}" method="post">
		<div class="form-group">
			<input type="hidden" name="webaction" value="createContext.create" />
			<input class="form-control" type="hidden" name="comp_id" value="${comp.id}" />
		</div>
		<div class="form-group">
			<label for="name">nom du site : </label>
			<input class="form-control" type="text" id="name" name="name" value="${param.name}" />
		</div>
		<div class="form-group">
			<label for="url">URL : </label>
			<div class="input-group">
      			 <div class="input-group-prepend"><div class="input-group-text">javlo.io/</div></div>
      			<input type="text" class="form-control" id="url" name="url">
    		</div>
		</div>
		<div class="form-group">
			<label for="email">email de contact : </label>
			<input class="form-control" type="text" id="email" name="email" value="${param.email}" />
		</div>
		<div class="form-group">
			<label for="pwd">mot de passe : </label>
			<input class="form-control" type="password" id="pwd" name="pwd" value="" />
		</div>
		<div class="form-group">
			<label for="pwd2">confirmation mot de passe : </label>
			<input class="form-control" type="password" id="pwd2" name="pwd2" value="" />
		</div>
		<div class="form-group text-right">
			<input type="submit" value="ok" class="btn btn-primary" />
		</div>
	</form>
</div>