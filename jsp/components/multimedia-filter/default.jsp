<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%><form id="search-multimedia">
   <div class="form-group">
   <input type="hidden" name="filter" value="true" />
   <label class="sr-only" for="searchQuery">Search query</label>    
   </div><div class="form-group">
   <div class="form-check">
   	<div class="btn-group" data-toggle="buttons">
			<label class="btn btn-default disabled">tags</label>
   		<c:forEach var="tag" items="${info.tags}"> <label class="btn btn-default ${not empty multimediaFilter.tags[tag]?'active ':''}">
   		<input type="checkbox" autocomplete="off" name="mtg" ${not empty multimediaFilter.tags[tag]?'checked ':''}value="${tag}" /> ${tag}
 			</label></c:forEach>
     	</div>
   </div>
   </div>
   <c:if test="${not empty prop.firstYear}">
   <div class="form-group">
   <div class="form-inline">
   	<div class="btn-group" data-toggle="buttons">
			<label class="btn btn-secondary disabled">year</label>
   		<c:forEach var="year" begin="${prop.firstYear}" end="${not empty prop.lastYear?prop.lastYear:lastYear}"> <label class="btn btn-default">
   		<input type="radio" autocomplete="off" name="y" value="${year}" /> ${year}
 			</label></c:forEach>
     	</div>
   </div>
   </div>
   </c:if>
  
  <div class="form-group">
  <div class="row">
  <div class="col-5">
  <div class="input-group"><div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-search" aria-hidden="true"></i></span></div><input type="text" class="form-control" id="searchQuery" placeholder="Search" name="mqr" value="${multimediaFilter.query}" /></div>      
  </div><div class="col-5"><div class="input-group">
  <span class="input-group-prepend"><span class="input-group-text"><i class="fas fa-calendar" aria-hidden="true"></i></span></span><input class="daterange form-control" type="text" name="mrd" value="${multimediaFilter.rawRangeDate}" placeholder="Start date - end date" /></div>
  </div>
  <div class="col-2">
  <div class="btn-group pull-right">
  <button type="submit" name="enter" class="hidden"></button>
  <button type="submit" name="clear" class="btn btn-default">clear</button>
  <button type="submit" class="btn btn-primary">Start</button>  
  </div></div></div></div>
</form>