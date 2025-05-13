<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"
%><%@taglib uri="/WEB-INF/javlo.tld" prefix="jv" %>
<jsp:include page="title.jsp" />
<div class="card mb-3 mt-3 card-search">
  <div class="card-body">
    <div class="row justify-content-center">
      <div class="col-12 col-sm-10 col-lg-8 col-xl-6">
        <form id="file-finder-form-${compid}" method="post" action="${info.currentURL}">
          <div class="file-finder-form ">

            <script>
              function resetRadio(name) {
                document.querySelectorAll("[name='" + name + "']").forEach(i => {
                  i.checked = false;
                });
              }

              function isRadioSelected(name) {
                document.querySelectorAll("[name='" + name + "']").forEach(i => {
                  if (i.checked) {
                    return true;
                  }
                });
                return false;
              }
            </script>


            <div class="input-group mb-3 input-group-search">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
              <input id="freetext-${compid}" type="text" name="text" class="form-control" value="${param.text}"
                     aria-label="${i18n.view['global.search']}"
                     placeholder="${i18n.view['global.placeholder.search']}"/>
              <button type="submit" class="btn btn-primary btn-md">${i18n.view['global.search']}</button>
            </div>

            <c:if test="${not empty taxonomies}">

              <c:if test="${!param.buttons}">
                <c:forEach var="taxoChild" items="${taxonomies}" varStatus="status">
                  <c:if test="${fn:length(taxoChild.children)>0}">

                    <div class="col select">
                      <label for="st-${status.index}">${taxoChild.label}</label>
                      <select name="taxonomy-${status.index}" class="form-select" id="st-${status.index}"
                              onchange="this.form.submit()">
                        <option></option>
                        <c:set var="paramName" value="taxonomy-${status.index}"/>
                        <c:forEach var="tsc" items="${taxoChild.children}" varStatus="status">
                          <option value="${tsc.id}" <c:if
                            test="${param[paramName] == tsc.id}">selected="selected"</c:if>>${tsc.label}</option>
                        </c:forEach>
                      </select>
                    </div>

                  </c:if>
                </c:forEach>
              </c:if>


              <c:if test="${param.buttons}">

                <c:set var="selected" value="false"/>
                <c:forEach var="taxonomy" items="${taxonomies}" varStatus="status">
                  <c:if test="${fn:contains(taxonomySelectedIdString, taxonomy.id)}">
                    <c:set var="selected" value="true"/>
                  </c:if>
                </c:forEach>
                <c:if test="${fn:length(taxonomies)>1}">
                  <div class="form-group row align-items-center taxonomy">
                    <div class="col">
                      <div class="btn-group" role="group">
                        <button class="btn btn-outline-primary"
                                onclick="resetRadio('taxonomy');" ${!selected?'disabled="disabled"':''}><i
                          class="bi bi-x-octagon"></i></button>
                        <c:forEach var="taxonomy" items="${taxonomies}" varStatus="status">
                          <input onchange="this.form.submit()" type="radio" name="taxonomy" class="btn-check"
                                 id="btnTaxo${taxonomy.id}" value="${taxonomy.id}"
                                 autocomplete="off" ${fn:contains(taxonomySelectedIdString, taxonomy.id)?'checked="checked"':''}>
                          <label class="btn btn-outline-primary" for="btnTaxo${taxonomy.id}"
                                 title="${taxonomy.pathLabel}">${taxonomy.label}</label>
                        </c:forEach>
                      </div>
                    </div>
                  </div>
                </c:if>

              </c:if>

            </c:if>

            <c:if test="${param.optiondisplay100}">
              <div class="form-group row">
                <div class="col-sm-2">&nbsp;</div>
                <div class="col-sm-8">
                  <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="max" name="max"
                           value="100" ${param.max=="100"?'checked="checked"':''} />
                    <label class="form-check-label" id="max">${vi18n['component.file-finder.display.100']}</label>
                  </div>
                </div>
              </div>
            </c:if>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<c:if test="${param.both}">
  <div class="d-flex justify-content-end view-command mb-1">
    <a id="btn-table" class="me-2" href="javascript:show('table');"><i class="bi bi-table"></i></a>
    <a id="btn-thumb" href="javascript:show('thumb');"><i class="bi bi-grid-3x3-gap"></i></a>
    <script>
      function show(view) {
        document.querySelectorAll(".file-view").forEach(i => {
          i.classList.add("hidden-block")
        });
        document.querySelectorAll(".view-command a").forEach(i => {
          i.classList.remove("disabled")
        });
        let id = view + "-file-view";
        let block = document.getElementById(id);
        block.classList.remove("hidden-block");
        setCookie("selectedView", view, 1);
        document.getElementById("btn-" + view).classList.add("disabled");
      }

      document.addEventListener("DOMContentLoaded", function (event) {
        let selectedView = getCookie("selectedView");
        if (selectedView === null || selectedView === "") {
          selectedView = "table";
        }
        show(selectedView);
      });
    </script>
  </div>
</c:if>

<c:if test="${fn:length(files) == 0 && (filter.active || display)}">
  <div class="alert alert-warning mt-3 mb-3">${vi18n['global.no-result']}</div>
</c:if>
<c:if test="${fn:length(files) > 0}">
  <c:if test="${!param.thumb || param.both}">
    <div id="table-file-view" class="${param.both?' hidden-block':''} file-view">
      <table class="table table-striped table-bordered table-sm mb-3" data-toggle="table" data-pagination="true"
             data-locale="${info.language}">
        <thead>
        <tr>
          <c:if test="${param.preview}">
            <th data-field="preview">${vi18n['component.file-finder.title.preview']}</th>
          </c:if>
          <c:if test="${!param.preview && !param.nofilelogo}">
            <th data-field="type"></th>
          </c:if>

          <th data-field="title" data-sortable="true">${vi18n['component.file-finder.title.title']}</th>
          <th data-field="date" data-sortable="true">${vi18n['component.file-finder.title.date']}</th>
          <c:if test="${param.author}">
            <th>${vi18n['component.file-finder.title.author']}</th>
          </c:if>
          <c:if test="${param.size}">
            <th data-field="size" data-sortable="true">${vi18n['component.file-finder.title.size']}</th>
          </c:if>
          <c:if test="${param.description}">
            <th data-field="description">${vi18n['component.file-finder.title.description']}</th>
          </c:if>
          <c:if test="${param.taxonomy}">
            <th data-field="taxonomy">${vi18n['component.file-finder.title.taxonomy']}</th>
          </c:if>
        </tr>
        </thead>

        <tbody>

        <c:forEach var="file" items="${files}">
          <c:if test="${!param.nofilelogo}">
          <td>
            <c:if test="${param.preview}">
              <c:if test="${!file.video}">
                <a href="${file.URL}" target="_blank">
                  <figure>
                    <img class="img-fluid" src="${file.thumbURL}" alt="preview of ${file.name}" lang="en"/>
                  </figure>
                </a>
              </c:if>
              <c:if test="${file.video}">
                <!-- "Video For Everybody" http://camendesign.com/code/video_for_everybody -->
                <video controls="controls">
                  <source src="${file.absoluteURL}" type="video/mp4"/>
                </video>
              </c:if>

            </c:if>
            <c:if test="${!param.preview}">
              <c:set var="fileType" value=""/>
              <c:if test="${file.type == 'pdf'}"><c:set var="fileType" value="-pdf"/></c:if>
              <c:if test="${file.type == 'txt'}"><c:set var="fileType" value="-text"/></c:if>
              <c:if test="${file.type == 'mp3'}"><c:set var="fileType" value="-music"/></c:if>
              <c:if test="${file.type == 'doc' || file.type == 'docx' || file.type == 'odt'}"><c:set var="fileType"
                                                                                                     value="-word"/></c:if>
              <c:if test="${file.type == 'ppt' || file.type == 'pptx'}"><c:set var="fileType" value="-slides"/></c:if>
              <c:if test="${file.type == 'ppt' || file.type == 'pptx' || file.type == 'odp'}"><c:set var="fileType"
                                                                                                     value="-slides"/></c:if>
              <c:if test="${file.type == 'xls' || file.type == 'xlsx' || file.type == 'ods'}"><c:set var="fileType"
                                                                                                     value="-spreadsheet"/></c:if>
              <c:if test="${file.image}"><c:set var="fileType" value="-image"/></c:if>
              <c:if test="${file.video}"><c:set var="fileType" value="-play"/></c:if>
              <div class="d-flex justify-content-center" title="${file.type}"><i
                class="bi bi-file-earmark${fileType}"></i></div>
            </c:if>
          </td>
          </c:if>
          <td class="align-middle"><a href="${file.URL}"
                                      target="_blank">${not empty file.title?file.title:file.name}</a>
          </td>
          <td class="align-middle"><span class="hidden">${file.sortableDate}</span>${file.date}</td>
          <c:if test="${param.author}">
            <td class="align-middle">${file.authors}</td>
          </c:if>
          <c:if test="${param.size}">
            <td class="align-middle"><span class="hidden">${file.sortableSize}</span>${file.size}</td>
          </c:if>
          <c:if test="${param.description}">
            <td class="align-middle"><small>${file.description}</small></td>
          </c:if>
          <c:if test="${param.taxonomy}">
            <td class="align-middle taxonomies">
            <c:forEach var="taxo" items="${file.taxonomyBean}">
                <span class="taxonomy badge bg-secondary">
                  <span class="text">${empty taxo.labels[info.language]?taxo.name:taxo.labels[info.language]}</span>
                </span>
            </c:forEach>
          </c:if>
          </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </c:if>
  <c:if test="${param.thumb || param.both}">
    <div id="thumb-file-view" class="row thumb${param.both?' hidden-block':''} file-view">
      <c:forEach var="file" items="${files}">
        <div class="col-6 col-md-3 col-lg-2">
          <a href="${file.URL}" class="card mb-3">

            <c:if test="${!file.video}">
              <img class="card-img-top" src="${file.thumbURL}" alt="preview of ${file.name}" lang="en"/>
            </c:if>
            <c:if test="${file.video}">
              <video class="card-img-top" controls="controls">
                <source src="${file.absoluteURL}" type="video/mp4"/>
              </video>
            </c:if>

            <div class="card-body">
                ${not empty file.title?file.title:file.name}
              <div class="d-flex justify-content-between">
                <span class="size">${file.size}</span>
                <span class="date">${file.date}</span>
              </div>
            </div>

          </a>
        </div>
      </c:forEach>
    </div>
  </c:if>
</c:if>
