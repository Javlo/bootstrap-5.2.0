<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form action="${info.currentURL}" method="post">

<input type="hidden" name="webaction" value="sort-survey.send" />
<input type="hidden" name="comp-id" value="${compid}" />

<div class="result-block">
<c:forEach var="question" items="${questions}" varStatus="status">
	<input id="q${question.number}" type="hidden" name="q${question.number}" value="0" data-number="${question.number}" />
</c:forEach>
</div>


<div class="wizard-list">
<c:forEach var="both" items="${boths}" varStatus="status">
	<div class="wizard-list-item card border-left-success h-100 py-2 mb-3 ${status.index==0?'active':''}">
		<div class="card-body">
			<div class="row no-gutters align-items-center">
				<div class="col-sm-5">
					<button type="button" value="${status.index}" data-question="${both.q1.number}" class="btn btn-secondary btn-block btn-question mb-sm-0 mb-3">${both.q1.label}</button>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-5">
					<button type="button" value="${status.index}" data-question="${both.q2.number}" class="btn btn-secondary btn-block btn-question">${both.q2.label}</button>
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
var selectButton = new Array();

document.addEventListener("DOMContentLoaded", function (event) {
	initListWizard('.wizard-list');	
});

function updateDisplay() {
	var elmnt = document.querySelectorAll(".wizard-list .wizard-list-item.active");	
	if (elmnt.length>0) {
		elmnt[0].scrollIntoView({behavior: "smooth",block: "center", inline: "center"});
	}

	var countQuestion = new Array(${fn:length(boths)+1});
	document.querySelectorAll(".wizard-list .btn-question").forEach(btn => {
		if (selectButton[btn.value] != null && selectButton[btn.value] == btn) {
			btn.classList.add("btn-success");
			btn.classList.remove("btn-secondary");
		} else {
			btn.classList.remove("btn-success");
			btn.classList.add("btn-secondary");
		}
	});

	document.querySelectorAll(".result-block input").forEach(input => {
		input.value=0;
	});

	document.querySelectorAll(".wizard-list .btn-question").forEach(btn => {
		if (btn.classList.contains('btn-success')) {
			if (countQuestion[btn.dataset.question] == null) {
				countQuestion[btn.dataset.question] = 1;
			} else {
				countQuestion[btn.dataset.question]++;
			}
		} 
	});

	document.querySelectorAll(".result-block input").forEach(input => {
		if (countQuestion[input.dataset.number] != null) {
			input.value = countQuestion[input.dataset.number];
		} else {
			input.value = 0;
		}
	});

}

function initListWizard(cssQuery) {
	let btns = document.querySelectorAll(cssQuery + ' .btn-question');
	for (i = 0; i < btns.length; ++i) {
		btns[i].onclick = wlButtonClick;
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

function select(btn) {
	
	console.log("btn.value : ",btn.value);
	
	selectButton[btn.value] = btn;	
	
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

	updateDisplay();
}

function wlButtonClick(click) {
	console.log(click);
	select(click.target);
	updateDisplay();
}
</script>