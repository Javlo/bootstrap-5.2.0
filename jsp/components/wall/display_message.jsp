<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>

<div class="messages hidden">
	<div id="add-reply-message" class="alert alert-info alert-wall">
		${field.msgAddReply}
		<button type="button" class="close" aria-label="Close" onclick="this.parentElement.classList.add('hidden');">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
</div>

<c:if test="${not empty field.title}"><h2>${field.title}</h2></c:if>
<c:if test="${not access}">
<jsp:include page="login.jsp" />
</c:if><c:if test="${access}">
	<c:url var="pageAjaxURL" value="${info.currentAjaxURL}" context="/">
		<c:param name="comp-id" value="${compid}" />
	</c:url>
<div class="social-wall"> 
	<c:if test="${info.admin}">
		<c:if test="${uncheckSize==0}"><div class="alert alert-success" role="alert">${i18n.view['content.wall.all-checked']}</div></c:if>
		<c:if test="${uncheckSize>0}"><div class="alert alert-danger" role="alert">${i18n.view['content.wall.need-checked']}<span class="badge badge-danger float-right">${uncheckSize} / ${countMessages}</span></div></c:if>
	</c:if>

	<script>var wallURL = "${pageAjaxURL}"; var currentUser = '${info.userName}'; var currentPage = 1;</script>
	<div id="post-list" v-cloak>		
		<div class="card create-post">
			<a class="btn-block card-header" data-toggle="collapse" href="#create-post" role="button" aria-expanded="false" aria-controls="filter-fields">
				${i18n.view['content.social.wall.create-post']}
			</a>
			<div class="card-body collapse" id="create-post">
				<form action="${info.currentAjaxURL}" method="post" id="add-post-form" v-on:submit.prevent="addPost">
					<div>
						<input type="hidden" name="webaction" value="wall.createpost" />
						<input type="hidden" name="comp-id" value="${compid}" />
						<input type="hidden" name="page" value="1" />
						<div class="form-group">
							<input type="text" name="title" class="form-control" value="" placeholder="${i18n.view['global.title']}" />
						</div>
						<div class="form-group">
							<textarea id="create-post-${compid}" name="text" class="form-control autosize session-store" placeholder="${i18n.view['global.message']}"></textarea>
						</div>
						<button type="submit" class="btn btn-primary btn-block btn-sm">${i18n.view['content.social.wall.moderation']}</button>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="filter.jsp" />
		<paginate
		:page-count="${pageCount}"
		:page-range=3
		:page-class="'page-item'"
		:prev-class="'page-item'"
		:next-class="'page-item'"
		:page-link-class="'page-link'"
		:prev-link-class="'page-link'"
		:next-link-class="'page-link'"
		:click-handler="changePage"
		:prev-text="'&laquo;'"
		:next-text="'&raquo;'"
		:container-class="'pagination justify-content-center'">
		</paginate>

		<div class="loader"><img src="${info.rootTemplateURL}/img/load.gif" title="loading..." lang="en" /></div>

		<div class="post-list">
			<div v-bind:class="{'mine':currentUser == post.author, 'card':true}" v-for="post in postList">
				<div class="card-header">
					<div class="header-bloc">
					<a title="delete" lang="en" class="btn-delete" data-confirm="${i18n.view['global.mesage.confirm.delete']}" @click.prevent="deletePost(post, $event)" href="#" v-if="currentUser == post.author && post.countReplies == 0 && ${field.post_deletable == 'on'}"><i class="far fa-trash-alt"></i></a>
					<span class="author"><span class="warning" v-if="!post.adminValided"><i class="far fa-eye-slash"></i>&nbsp;</span>{{post.author}}</span> : <span class="title">{{post.title}}</span>
					<div class="time">{{post.creationDateString}}</div>
					<div class="admin-msg" v-if="post.adminMessage">
						<label>${i18n.view['global.admin-message']}</label>
						<p>{{post.adminMessage}}</p>
					</div>
					</div><div class="header-bloc">
						<c:if test="${info.admin}">
							<div v-bind:class="{'valid':post.valid, 'unvalid':!post.valid, 'valided':post.adminValided, 'unvalided':!post.adminValided, 'admin-block':true}">
								<a title="valid post" lang="en" class="btn-valid" @click.prevent="admin(post, true)" href="#"><i class="fas fa-check" aria-hidden="true"></i></a>
								<a title="refuse post" lang="en" class="btn-refuse" @click.prevent="admin(post, false)" href="#"><i class="fas fa-ban" aria-hidden="true"></i></a>
								<a title="delete post" lang="en" @click.prevent="deletePost(post, $event)" data-confirm="${i18n.view['global.mesage.confirm.delete']}" class="btn-delete" href="#"><i class="fa fa-times" aria-hidden="true"></i></a>
							</div>
						</c:if>
						<form action="${info.currentAjaxURL}" method="get" v-bind:id="'form-admin-text-'+post.id" v-on:submit.prevent="adminMessage">
							<input type="hidden" name="webaction" value="wall.admin" />
							<input type="hidden" name="id" v-bind:value="post.id" />
							<input type="hidden" name="valid" value="false" />							
							<div class="admin-msg" v-if="!post.valid">
								<c:if test="${info.admin}">
									<div v-if="!post.valid" class="input-group">		
										<div class="input-group">
											<textarea rows="2" v-bind:id="'admin-text-'+post.id" name="msg" class="form-control session-store autosize" placeholder="${i18n.view['global.admin-message']}" v-bind:value="post.adminMessage"></textarea>
											<div class="input-group-append">
												<button class="btn btn-outline-danger" type="submit" title="admin message" lang="en"><i class="fas fa-angle-double-right" aria-hidden="true"></i></button>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</form>
						<div class="action-block">
							<span class="warning" v-if="post.uncheckedChild"><i class="fas fa-exclamation-triangle" aria-hidden="true"></i>&nbsp;</span>
							<a title="replies list" lang=" en" class="comments-link" data-toggle="collapse" role="button" aria-expanded="false"
								@click.prevent="displayReplies(post)"
								v-bind:href="'#rp-'+post.id" 
								v-bind:aria-controls="'rp-'+post.id">
									 {{post.countReplies}}&nbsp;<i class="far fa-comments" aria-hidden="true"></i> <div class="time"><c:if test="${not empty field.labelLatestMsg}">${field.labelLatestMsg} : </c:if>{{post.latestUpdateString}}</div>
							</a>
						</div>
					</div>						
				</div>
				<div class="card-body">
					<p class="card-text" v-html="post.html"></p>
					<div class="reply-block">
						<div class="reply-zone collapse" v-bind:id="'rp-'+post.id">
							<form action="${info.currentAjaxURL}" method="get" class="add-reply-form" v-on:submit.prevent="addReply(post, post, $event)">
								<input type="hidden" name="webaction" value="wall.createpost" />
								<input type="hidden" name="comp-id" value="${compid}" />
								<input type="hidden" name="parent" v-bind:value="post.id" />
								<input type="hidden" name="main" v-bind:value="post.id" />
								<div class="input-group admin-msn">
									<textarea v-bind:id="'reply-text-'+post.id" name="text" class="form-control autosize session-store"></textarea>
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="submit" title="reply" lang="en"><i class="fas fa-angle-double-right" aria-hidden="true"></i></button>
									</div>
								</div>
							</form>
							<div class="reply-list" v-bind:id="'reply-list-'+post.id">
								<ul class="list-group list-group-flush" v-for="reply in post.replyList">
									<li class="list-group-item" v-bind:id="'reply-'+reply.id">
										<div class="reply-source"><i class="fas fa-long-arrow-right" aria-hidden="true"></i> <span class="author"><span class="warning" v-if="!post.adminValided"><i class="far fa-eye-slash"></i>&nbsp;</span>{{reply.parentPost.author}}</span>{{reply.parentPost.text}}</div>
										<div class="info"><span class="author"><span v-if="!reply.adminValided" class="warning"><i class="far fa-eye-slash" aria-hidden="true"></i>&nbsp;</span>{{reply.author}}</span><span class="date">{{reply.creationDateString}}</span></div>
										<p class="text" v-html="reply.html"></p>
										<c:if test="${info.admin}">
											<div v-bind:class="{'valid':reply.valid, 'unvalid':!reply.valid, 'valided':reply.adminValided, 'unvalided':!reply.adminValided, 'admin-block':true}">
												<a title="valid post btn-valid" lang="en" class="btn-valid" @click.prevent="adminReply(post, reply, true)" href="#"><i class="fas fa-check" aria-hidden="true"></i></a>
												<a title="refuse post btn-unvalid" lang="en" class="btn-refuse" @click.prevent="adminReply(post,reply, false)" href="#"><i class="fas fa-ban" aria-hidden="true"></i></a>
												<a title="delete post" land="en" data-confirm="${i18n.view['global.mesage.confirm.delete']}" @click.prevent="deleteReply(post, reply, $event)" class="btn-delete" href="#"><i class="fas fa-times" aria-hidden="true"></i></a>
											</div>
										</c:if>
										<div class="admin-msg" v-if="!reply.valid">
											<form action="${info.currentAjaxURL}" method="get" v-bind:id="'form-reply-admin-text-'+post.id" v-on:submit.prevent="adminReplyMessage(post, $event)">
													<input type="hidden" name="webaction" value="wall.admin" />
													<input type="hidden" name="id" v-bind:value="reply.id" />
													<input type="hidden" name="valid" value="false" />
													<c:if test="${info.admin}">
														<div v-if="!reply.valid" class="input-group">		
															<div class="input-group">
																<textarea v-bind:id="'admin-reply-'+post.id" name="msg" class="form-control autosize session-store" placeholder="${i18n.view['global.admin-message']}" v-bind:value="reply.adminMessage"></textarea>
																<div class="input-group-append">
																	<button class="btn btn-outline-danger" type="submit" title="admin message" lang="en"><i class="fas fa-angle-double-right" aria-hidden="true"></i></button>
																</div>
															</div>
														</div>
													</c:if>
													<label>${i18n.view['global.admin-message']}</label>
													<p>{{reply.adminMessage}}</p>
												</form>
										</div>
										<a class="btn-reply" title="reply" lang="en" v-bind:href="'#re-form-'+reply.id" role="button" aria-expanded="false" data-toggle="collapse"><i class="fas fa-reply" aria-hidden="true"></i></a>
										<div class="collapse reply" v-bind:id="'re-form-'+reply.id">
											<form action="${info.currentAjaxURL}" method="get" id="add-reply-reply-form" v-on:submit.prevent="addReply(post, reply, $event)">
													<input type="hidden" name="webaction" value="wall.createpost" />
													<input type="hidden" name="parent" v-bind:value="reply.id" />
													<input type="hidden" name="main" v-bind:value="post.id" />
													<input type="hidden" name="comp-id" value="${compid}" />
												<div class="input-group">
												<textarea v-bind:id="'reply-text-'+reply.id" name="text" class="form-control autosize session-store"></textarea>
												<div class="input-group-append">
													<button class="btn btn-outline-secondary" type="submit" title="reply" lang="en"><i class="fas fa-angle-double-right" aria-hidden="true"></i></button>
												</div>
												</div>										
											</form>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</div>
</c:if>