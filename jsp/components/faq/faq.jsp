<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.faq .filter-wrapper {
		position: relative;
	}
	.faq .reset-filter {
		position: absolute;
		right: 3px;
		top: 3px;
		font-size: 20px;
		opacity: 0.6;
		border: 0;
		background-color: transparent;
	}
	.faq .reset-filter:hover {
		opacity: 1;
	}
</style>

<div class="faq">	
	<c:if test="${not empty firstTitle}">
		<div class="ep_boxheader ep_greyheader">
			<div class="ep_block">
				<div class="ep_title">${firstTitle.text}</div>
			</div>
			<span class="ep_endbox">&nbsp;</span>
		</div>
	</c:if>

	<div class="filter-wrapper">
		<input id="filter-faq" type="text" class="form-control filter mb-3" placeholder="${vi18n['global.filter']}" onkeyup="filter(this.value);"/>
		<button type="button" class="reset-filter"><i class="fa fa-times-circle" aria-hidden="true" onclick="document.getElementById('filter-faq').value = ''; filter('');"></i></button>
	</div>
	
	<script>
		function filter(text) {
			if (text === null || text.length == 0) {
				document.querySelectorAll('.faq_list .card').forEach(item => {
					item.classList.remove('hidden');
				});
				return;
			}
			text = text.toLowerCase();
			document.querySelectorAll('.faq_list .card').forEach(item => {
				if (item.innerHTML.toLowerCase().indexOf(text) < 0) {
					item.classList.add('hidden');
				} else {
					item.classList.remove('hidden');
				}	
			});
		}
	</script>

	<div class="faq_list">
		<c:forEach var="item" items="${items}">
			<c:if test="${item.type eq 'question'}">
				<div class="card mt-3">
					<div class="card-header">${item.question}</div>
					<div class="card-body">
						<p class="card-text">${item.answer}</p>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	
</div>