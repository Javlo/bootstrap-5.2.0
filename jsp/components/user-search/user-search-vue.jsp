<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
  var searchUrl = '${searchUrl}';
  var showAll = ${empty showAll?'false':showAll};
</script>
<div id="user-login-registration" class="container">
  <div class="card mb-3 mt-3 card-search">
    <div class="card-body">
      <form action="${info.currentURL}" method="post" v-on:submit.prevent="update">
        <div class="row justify-content-center">
          <div class="col-12 col-sm-10 col-lg-8 col-xl-6">
            <div class="input-group input-group-search">
              <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
              <input id="freetext-${compid}" type="text" name="text" v-model="query" class="form-control"
                     aria-label="${i18n.view['global.search']}"
                     placeholder="${i18n.view['global.placeholder.search']}"/>
              <button type="submit" class="btn btn-primary btn-md">${i18n.view['global.search']}</button>
            </div>
            <div class="row mt-3">
              <div class="col-md-6">
                <label for="organization">${vi18n['form.organization']}</label>
                <select id="organization" name="organization" class="form-select" v-model="organization"
                        @change="update">
                  <option></option>
                  <c:forEach var="c" items="${compagnies}">
                    <option>${c}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-md-6">
                <label for="country">${vi18n['form.address.country']}</label>
                <select name="country" class="form-select" v-model="country" @change="update">
                  <option></option>
                  <c:forEach var="c" items="${countries}">
                    <option>${c}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </div>
        </div>

      </form>
    </div>
  </div>

  <div class="alert alert-warning" v-if="result.length == 0 && query.length > 0">${vi18n['global.no-result']}</div>

  <div class="row">
    <div class="col-md-6 col-lg-4" v-for="item in result">
      <div class="card mb-3">
        <div class="row g-0">
          <div class="col-md-4">
            <figure @click.stop.prevent="openuser[item.userInfo.login] = !openuser[item.userInfo.login];" v-if="item.avatarUrl">
            <img :src="item.avatarUrl" class="img-fluid rounded-start"
                 :alt="item.userInfo.firstName+' '+item.userInfo.lastName">
            </figure>
          </div>
          <div class="col-md-8">
            <ul class="list-group list-group-flush">
              <li class="list-group-item name">
                <h2>{{item.userInfo.firstName}} {{item.userInfo.lastName}}</h2>
                <div class="organization">{{item.userInfo.organization}}
                  <span class="department" v-if="item.userInfo.department && openuser[item.userInfo.login]">
                {{item.userInfo.department}}
              </span>
                  <div class="function" v-if="item.userInfo.function">{{item.userInfo.function}}</div>
                </div>
              </li>
              <li class="list-group-item" v-if="item.userInfo.email"><a
                :href="'mailto:'+item.userInfo.email" class="btn-contact btn-email"><i class="bi bi-envelope"></i>
                {{item.userInfo.email}}</a></li>
              <li class="list-group-item" v-if="item.userInfo.mobile"><a
                :href="'tel:'+item.userInfo.mobile" class="btn-contact btn-mobile"><i class="bi bi-phone"></i>
                {{item.userInfo.mobile}}</a></li>
              <li class="list-group-item" v-if="item.userInfo.phone && openuser[item.userInfo.login]"><a
                :href="'tel:'+item.userInfo.phone" class="btn-contact btn-phone"><i class="bi bi-telephone"></i>
                {{item.userInfo.phone}}</a></li>
              <li class="list-group-item" v-if="item.userInfo.country && openuser[item.userInfo.login]">
                <h5 class="card-title">${vi18n['form.country']}</h5>
                {{item.userInfo.country}}</li>
              <li class="list-group-item" v-if="item.userInfo.health && openuser[item.userInfo.login]">
                <h5 class="card-title">${vi18n['form.health']}</h5>
                {{item.userInfo.health}}</li>
              <li class="list-group-item" v-if="item.userInfo.food && openuser[item.userInfo.login]">
                ${vi18n['form.food']} : {{item.userInfo.food}}</li>
              <li class="list-group-item" v-if="item.userInfo.info && openuser[item.userInfo.login]">
                ${vi18n['form.myinfo']} : {{item.userInfo.info}}</li>
              <div class="btn-more"><a href="#"
                                       @click.stop.prevent="openuser[item.userInfo.login] = !openuser[item.userInfo.login];">
                <i v-if="!openuser[item.userInfo.login] && moreInfo(item.userInfo)"
                   class="bi bi-three-dots-vertical"></i>
                <i v-if="openuser[item.userInfo.login]" class="bi bi-x"></i>
              </a></div>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
