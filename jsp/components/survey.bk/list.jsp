<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form action="${info.currentURL}" method="post">

<input type="hidden" name="webaction" value="list-survey.send" />
<input type="hidden" name="comp-id" value="${compid}" />


<div class="wizard-list">
<c:forEach var="question" items="${questions}" varStatus="status">
	<div class="wizard-list-item card border-left-success h-100 py-2 mb-3 ${status.index==0?'active':''}">
		<div class="card-body">
			<div class="row no-gutters align-items-center">
				<div class="col-sm-auto mr-2 d-flex justify-content-center">
					<i class="undone-item far fa-square text-gray-300"></i>
					<i class="done-item far fa-check-square text-gray-300"></i>
				</div>
				<div class="col-sm mr-2 d-flex">
					<div class="text-xs font-weight-bold text-success text-uppercase mb-1">${question.displayLabel}</div>
				</div>
				<div class="col-sm-auto d-flex">					
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  <c:forEach var="response" items="${question.responses}">
					    <input type="radio" class="btn-check" name="${question.inputName}" id="r${response.number}-${question.number}" autocomplete="off" value="${response.number}">
						<label class="btn btn-outline-secondary" for="r${response.number}-${question.number}">${response.label}</label>
					  </c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>

<div class="d-flex justify-content-end form-btn-group">
<button class="btn btn-primary btn-block mb-3 disabled" aria-disabled="true" id="btn-send" disabled>${sendLabel}</button>
</div>

</form>

<script>
document.addEventListener("DOMContentLoaded", function (event) {
	initListWizard('.wizard-list');	
});

function updateDisplay() {
	var elmnt = document.querySelectorAll(".wizard-list .wizard-list-item.active");	
	if (elmnt.length>0) {
		elmnt[0].scrollIntoView({behavior: "smooth",block: "center", inline: "center"});
	}
}

function initListWizard(cssQuery) {
	let btns = document.querySelectorAll(cssQuery + ' input');
	for (i = 0; i < btns.length; ++i) {
		btns[i].onchange = wlButtonClick;
	}
}

function getWizardFromButton(btn) {
	let prt = btn.parentElement;
	while (prt != null && !prt.classList.contains('wizard-list-item')) {
		prt = prt.parentElement;
	}
	if (prt != null) {
		return prt.parentElement;
	} else {
		return null;
	}
}

function getWizardItemFromButton(btn) {
	let prt = btn.parentElement;
	while (prt != null && !prt.classList.contains('wizard-list-item')) {
		prt = prt.parentElement;
	}
	if (prt != null) {
		return prt;
	} else {
		return null;
	}
}

function done(btn) {
	let wizard = getWizardFromButton(btn);
	getWizardItemFromButton(btn).classList.add("done");
	getWizardItemFromButton(btn).classList.remove("active");
	let itemWzd = wizard.childNodes;
	for (i = 0; i < itemWzd.length; ++i) {
		if (itemWzd[i].classList) {
			itemWzd[i].classList.remove("active");
		}
	}
	let allDone = true;
	for (i = 0; i < itemWzd.length; ++i) {
		if (itemWzd[i].classList && !itemWzd[i].classList.contains("done")) {
			allDone = false;
			itemWzd[i].classList.add("active");
			break;
		}
	};
	if (allDone) {
		if (document.getElementById('btn-send') != null) {
			document.getElementById('btn-send').disabled = false;
			document.getElementById('btn-send').classList.remove('disabled');
			document.getElementById('btn-send').setAttribute('aria-disabled', false);			
		}
	}
}

function wlButtonClick(click) {
	console.log(click);
	done(click.target);
	updateDisplay();
}
</script>