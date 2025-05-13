document.addEventListener("DOMContentLoaded", function(event) {
	Vue.component('paginate', VuejsPaginate);
	$(".post-list").hide();
	$.ajax({
		url: wallURL,
		data: 'webaction=wall.getpost&page='+currentPage,
		dataType: 'json',
		success: function(initialJson) {
			var postListVue = new Vue({
				el: '#post-list',				
				data: { postList: [], currentUser : currentUser },
				created() {
					for (var i=0; i<initialJson.posts.length; i++) {
						initialJson.posts[i].html = text2html(initialJson.posts[i].text);
					}
					this.postList=initialJson.posts;
				},
				updated() {
					autosize(document.querySelectorAll('textarea.autosize'));
					sessionStoreItem();
				},
				methods: {
					updatePost: function() {
						$.ajax({
							url: wallURL,
							data: 'webaction=wall.getpost&page='+currentPage,
							dataType: 'json',	
							success: function(initialJson) {
								for (var i=0; i<initialJson.posts.length; i++) {
									initialJson.posts[i].html = text2html(initialJson.posts[i].text);
								}
								postListVue.postList=initialJson.posts;
							}
						})
					},					
					addPost: function(ev) {
						var valid = true;
						$(ev.target).find("input, textarea").removeClass("is-invalid");
						if ($(ev.target).find("[name=title]").val().length==0) {
							$(ev.target).find("[name=title]").addClass("is-invalid");
							valid=false;
						}
						if ($(ev.target).find("[name=text]").val().length==0) {
							$(ev.target).find("[name=text]").addClass("is-invalid");
							valid=false;
						}
						if (valid) {
							$.ajax({
								url: $(ev.target).attr('action'),
								type: $(ev.target).attr('method'),
								data: $(ev.target).serialize(),
								success: function(json) {
									if (json.messageText == null) {
										for (var i=0; i<json.posts.length; i++) {
											json.posts[i].html = text2html(json.posts[i].text);
										}
										$("#create-post").collapse('hide');
										$(ev.target).find("[name=title]").val('');
										$(ev.target).find("[name=text]").val('');
										postListVue.postList = json.posts;
										
									} else {
										alert(json.messageText);
									}
								} 
							});
						}
					}, 
					addReply: function(post, reply, ev) {
						$.ajax({
							url: $(ev.target).attr('action'),
							type: $(ev.target).attr('method'),
							data: $(ev.target).serialize()+"&page="+currentPage,
							success: function(json) {
								if (json.messageText == null) {
									var e = document.getElementById('add-reply-message');
									if (e.classList.contains("hidden")) {
										e.classList.remove("hidden");
									}
									ev.srcElement.appendChild(e);
									for (var i=0; i<json.posts.length; i++) {
										json.posts[i].html = text2html(json.posts[i].text);
									}
									postListVue.displayReplies(post, false, ev);
									$(ev.target).find("[name=title]").val('');
									$(ev.target).find("[name=text]").val('');
								} else {
									alert(json.messageText);
								}
							} 
						});
					},
					deletePost: function(post, ev) {
						if ($(ev.currentTarget).data('confirm') != null) {
							if (!confirm($(ev.currentTarget).data('confirm'))) {
								return false;
							}
						}
						$.ajax({
							url: wallURL,
							data: 'webaction=wall.deletepost&id='+post.id,
							dataType: 'json',
							success: function(json) {
								for (var i=0; i<json.posts.length; i++) {
									json.posts[i].html = text2html(json.posts[i].text);
								}
								postListVue.postList = json.posts;
							}
						});
					},
					deleteReply: function(post, reply, ev) {
						if ($(ev.currentTarget).data('confirm') != null) {
							if (!confirm($(ev.currentTarget).data('confirm'))) {
								return false;
							}
						}
						$.ajax({
							url: wallURL,
							data: 'webaction=wall.deletepost&id='+reply.id+"&master="+post.id,
							dataType: 'json',
							success: function(json) {
								for (var i=0; i<json.posts.length; i++) {
									json.posts[i].html = text2html(json.posts[i].text);
								}
								post.replyList = json.posts;
								updateList(postListVue.postList, post);
							}
						});
					},
					admin: function(post, valid) {						
						$.ajax({
							url: wallURL,
							data: 'webaction=wall.admin&id='+post.id+'&valid='+valid+'&page='+currentPage,
							dataType: 'json',
							success: function(json) {								
								json.html = text2html(json.text);
								updateList(postListVue.postList, json);
							}
						});
					},
					adminReply: function(post, reply, valid) {						
						$.ajax({
							url: wallURL,
							data: 'webaction=wall.admin&id='+reply.id+'&valid='+valid+'&page='+currentPage,
							dataType: 'json',
							success: function(json) {
								if (json.messageText == null) {
									json.parentPost = post;
									json.html = text2html(json.text);								
									updateList(post.replyList, json);
									updateList(postListVue.postList, post);
								} else {
									alert(json.messageText);
								}
							}
						});
					},
					adminMessage: function(ev) {						
						$.ajax({
							url: $(ev.target).attr('action'),
							type: $(ev.target).attr('method'),
							data: $(ev.target).serialize(),
							dataType: 'json',
							success: function(json) {
								if (json.messageText == null) {
									json.html = text2html(json.text);
									updateList(postListVue.postList, json);
								} else {
									alert(json.messageText);
								}
							}
						});
					},
					adminReplyMessage: function(post,ev) {						
						$.ajax({
							url: $(ev.target).attr('action'),
							type: $(ev.target).attr('method'),
							data: $(ev.target).serialize(),
							dataType: 'json',
							success: function(json) {
								if (json.messageText == null) {
									json.parentPost = post;
									json.html = text2html(json.text);								
									updateList(post.replyList, json);
									updateList(postListVue.postList, post);
								} else {
									alert(json.messageText);
								}
							}
						});
					},
					displayReplies : function(post, changeVisibilityOfReplies, ev) {
						if (changeVisibilityOfReplies) {
							var card = ev.target.closest(".card");
							var openCards = document.getElementsByClassName("card-open");
							if (openCards.length>0) {
								for (var i=0; i<openCards.length; i++) {
									if (openCards[i] != card) {									
										openCards[i].classList.add("card-close");
										openCards[i].classList.remove("card-open");
									}
								}
							}						
							if (card != null) {
								if (!card.classList.contains("card-open")) {
									card.classList.remove("card-close");
									card.classList.add("card-open");
								} else {
									card.classList.remove("card-open");
									card.classList.add("card-close");
								}
								card.classList.add("card-loading");
							}
						}
						$.ajax({
							url: wallURL,
							data: 'webaction=wall.getpost&master='+post.id+'&page='+currentPage,
							dataType: 'json',
							success: function(json) { 
								for (var i=0; i<json.posts.length; i++) {
									json.posts[i].html = text2html(json.posts[i].text);
								}
								post.replyList = json.posts;
								updateList(postListVue.postList, post);
								if (card != null) {
									card.classList.remove("card-loading");
								}
								/** todo remove jquery **/
								if (changeVisibilityOfReplies) {
									if (jQuery("#card-header-"+post.id).length > 0) {
										jQuery('html, body').animate({
											scrollTop: jQuery("#card-header-"+post.id).offset().top-100
											}, 500);
									}
								}
							}
						});
					},
					changePage: function(page) {
						currentPage = page;
						this.updatePost();
					},
					updateFilter: function(ev) {
						$.ajax({
							url: wallURL,
							data: $(ev.target).serialize(),
							dataType: 'json',
							success: function(json) { 
								for (var i=0; i<json.posts.length; i++) {
									json.posts[i].html = text2html(json.posts[i].text);
								}								
								postListVue.postList=json.posts;
							}
						});
					},
					scroolTo: function(post, ev) {
						/** todo remove jquery **/
						if (jQuery(ev.target.getAttribute("href")).length > 0) {
							jQuery('html, body').animate({
								scrollTop: jQuery(ev.target.getAttribute("href")).offset().top-100
								}, 500);
						}
					}					
				}
			});
			$(".post-list").show();
			$(".loader").hide();
		}	
	});
});

function updateList(array, value) {
	for (var i=0; i<array.length; i++) {
		if (array[i].id == value.id) {
			Vue.set(array, i, value);
		}
	}
}

function text2html(text) {
	return text.replace(/(?:\r\n|\r|\n)/g, '<br />');
}