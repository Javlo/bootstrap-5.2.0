<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form action="${info.currentURL}" method="post">

	<input type="hidden" name="webaction" value="sort-survey.send" />
	<input type="hidden" name="comp-id" value="${compid}" />

	<div class="result-block">
		<c:forEach var="question" items="${questions}" varStatus="status">
			<input class="question" id="q${question.number}" type="hidden" name="q${question.number}" value="0" data-number="${question.number}" />
		</c:forEach>
		<c:forEach var="both" items="${boths}" varStatus="status">
			<input class="both" id="b${both.q1.number}-${both.q2.number}" type="hidden" name="b${both.q1.number}-${both.q2.number}" value="0" />
		</c:forEach>
	</div>

	<div class="wizard-list">
		<c:set var="activeClass" value="" />
		<c:set var="activeClassSetted" value="false" />
		<c:forEach var="both" items="${boths}" varStatus="status">
			<c:if test="${empty both.selectQuestion && !activeClassSetted}">
				<c:set var="activeClass" value="active" />
			</c:if>
			<div class="wizard-list-item border-left-success h-100 py-2 mb-3 ${!activeClassSetted?activeClass:''}${not empty both.selectQuestion?' done':''}">
				<c:if test="${empty both.selectQuestion && !activeClassSetted}">
					<c:set var="activeClassSetted" value="true" />
				</c:if>
				
					<div class="row no-gutters align-items-center">
						<div class="col-sm-5">
							<c:set var="clazz" value="${(both.selectQuestion==both.q1.number?'btn-success':'btn-secondary')}" />
							<button type="button" value="${status.index}" data-question="${both.q1.number}" data-otherquestion="${both.q2.number}" class="btn ${clazz} btn-block btn-question mb-sm-0 mb-3">${both.q1.label}</button>
						</div>
						<div class="col-sm-2">
							<div class="d-flex justify-content-around arrow">
								<i class="bi bi-caret-left-fill"></i>
								<i class="bi bi-caret-right-fill"></i>
							</div>
						</div>
						<div class="col-sm-5">
							<c:set var="clazz" value="${both.selectQuestion==both.q2.number?'btn-success':'btn-secondary'}" />
							<button type="button" value="${status.index}" data-question="${both.q2.number}" data-otherquestion="${both.q1.number}" class="btn ${clazz} btn-block btn-question">${both.q2.label}</button>
						</div>
					</div>
				
			</div>
		</c:forEach>
	</div>

	<div class="commands">
	<div class="row">
		<div class="col-3">
			<a href="${previousLink}" class="btn btn-secondary btn-block mb-3" aria-disabled="true" id="btn-back">${vi18n['global.previous']}</a>
		</div>
		<div class="col-9">
			<button class="btn btn-primary btn-block mb-3 disabled" aria-disabled="true" id="btn-send" disabled>${sendLabel}</button>
		</div>
	</div>
	</div>

</form>

<script>
var selectButton = new Array();

document.addEventListener("DOMContentLoaded", function (event) {
	initListWizard('.wizard-list');	
});

function updateDisplay() {
	
	let allDone = true;
	
	let wizard = getWizard();
	
	let itemWzd = wizard.childNodes;
	for (i = 0; i < itemWzd.length; ++i) {
		if (itemWzd[i].classList) {
			itemWzd[i].classList.remove("active");
		}
	}	

	for (i = 0; i < itemWzd.length; ++i) {
		if (itemWzd[i].classList && !itemWzd[i].classList.contains("done")) {
			console.log("not done : "+i);
			allDone = false;
			itemWzd[i].classList.add("active");
			break;
		}
	}

	if (allDone) {
		if (document.getElementById('btn-send') != null) {
			document.getElementById('btn-send').disabled = false;
			document.getElementById('btn-send').classList.remove('disabled');
			document.getElementById('btn-send').setAttribute('aria-disabled', false);
		}
	}

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
			var inputLink = document.getElementById("b"+btn.dataset.question+'-'+btn.dataset.otherquestion);
			if (inputLink == null) {
				var inputLink = document.getElementById("b"+btn.dataset.otherquestion+'-'+btn.dataset.question);
			}
			inputLink.value=btn.dataset.question;
			if (countQuestion[btn.dataset.question] == null) {
				countQuestion[btn.dataset.question] = 1;
			} else {
				countQuestion[btn.dataset.question]++;
			}
		} 
	});

	document.querySelectorAll(".result-block input.question").forEach(input => {
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

function getWizard() {
	return document.querySelector(".wizard-list");
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
	selectButton[btn.value] = btn;	
	
	let wizard = getWizardItemFromButton(btn);
	wizard.classList.add("done");
	wizard.classList.remove("active");
	
	updateDisplay();
}

function wlButtonClick(click) {
	console.log(click);
	select(click.target);
	updateDisplay();
}

document.querySelectorAll(".wizard-list .btn-success").forEach(input => {
	selectButton[input.value] = input;
});

updateDisplay();
</script>