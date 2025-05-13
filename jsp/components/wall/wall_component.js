document.addEventListener("DOMContentLoaded", function(event) {
	Vue.component('posts', {
		props: ['content'],
		template: '<div class="card"><div class="card-header"><a title="delete" lang="en" class="btn-delete" v-on:click="deletePost(content.id)"><i class="far fa-trash-alt"></i></a><div class="author">{{content.author}}</div><div class="time">{{content.creationDateString}}</div></div><div class="card-body"><p class="card-text">{{content.text}}</p></div></div>',
		methods: {
			deletePost: function(id) {
				alert(id);
				$.ajax({
					url: wallURL,
					data: 'webaction=wall.deletepost&id='+id,
					dataType: 'json',
					success: function(json) {
						postListVue.postList = json.posts;
					}
				});
			}
		}
	});

	$.ajax({
		url: wallURL,
		data: 'webaction=wall.getpost',
		dataType: 'json',
		success: function(initialJson) {
			var postListVue = new Vue({
				el: '#post-list',				
				data: { postList: initialJson.posts },
				methods: {
					addPost: function(ev) {
						$.ajax({
							url: $(ev.target.form).attr('action'),
							type: $(ev.target.form).attr('method'),
							data: $(ev.target.form).serialize(),
							success: function(json) {
								postListVue.postList = json.posts;
							} 
						});
						$(ev.target.form).find(".btn-primary").addClass("hidden");
						$(ev.target.form).find("[name=text]").val('');
					}
				}
			});
		}
	});
});