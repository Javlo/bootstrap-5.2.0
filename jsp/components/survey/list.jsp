<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="result" value="${comp.style=='result'}" />
<form action="${info.currentURL}" method="post">

	<input type="hidden" name="webaction" value="list-survey.send" />
	<input type="hidden" name="comp-id" value="${compid}" />

	<c:if test="${not empty resultPdfLink}">
		<div class="d-flex justify-content-center hide-pdf mb-3">
			<a href="${resultPdfLink}" class="btn btn-primary">${vi18n['global.download']} (PDF)</a>
		</div>
	</c:if>

	<div class="wizard-list">
		<c:forEach var="question" items="${questions}" varStatus="status">
			<div class="wizard-list-item card border-left-success h-100 py-2 mb-3 ${status.index==0 && !result?'active':''}">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col-sm-auto mr-2 d-flex justify-content-center wrapper-status">
							<i class="undone-item far fa-square text-gray-300"></i> <i class="done-item far fa-check-square text-gray-300"></i>
						</div>
						<div class="col-sm mr-2 d-flex justify-content-center wrapper-label">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1 text-center">${question.displayLabel}</div>
						</div>
						<div class="col-sm-auto d-flex justify-content-center wrapper-${result?'result':'input'}">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<c:if test="${!result}">
								<c:forEach var="response" items="${question.responses}">
									<input type="radio" class="btn-check" name="${question.inputName}" id="q${question.number}r${response.number}" value="${response.label}" ${response.number==question.response.number?' checked="checked"':''}>
									<label for="q${question.number}r${response.number}" class="btn btn-outline-primary">${response.label}</label>
								</c:forEach>
								</c:if><c:if test="${result}">
									<div class="response">${question.response.label}</div>
								</c:if>
							</div>
						</div>
						<c:if test="${info.device.pdf}"><div style="clear: both;"></div></c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<c:if test="${!result}">
	<div class="row">
		<div class="col-3">
			<a href="${previousLink}" class="btn btn-secondary btn-block mb-3" aria-disabled="true" id="btn-back">${vi18n['global.previous']}</a>
		</div>
		<div class="col-9">
			<button class="btn btn-primary btn-block mb-3 disabled" aria-disabled="true" id="btn-send" disabled>${sendLabel}</button>
		</div>
	</div>
	</c:if>

</form>

<c:if test="${!result}">
<script>
	document.addEventListener("DOMContentLoaded", function(event) {
		initListWizard('.wizard-list');
	});

	function updateDisplay() {

		let wizard = getWizard();
		wizard.classList.add("done");
		wizard.classList.remove("active");
		let itemWzd = wizard.childNodes;
		for (i = 0; i < itemWzd.length; ++i) {
			if (itemWzd[i].classList) {
				itemWzd[i].classList.remove("active");
				if (itemWzd[i].querySelectorAll("input[type=radio]:checked").length>0) {
					itemWzd[i].classList.add("done");
				}
			}
		}
		let allDone = true;
		for (i = 0; i < itemWzd.length; ++i) {
			if (itemWzd[i].classList && !itemWzd[i].classList.contains("done")) {
				allDone = false;
				itemWzd[i].classList.add("active");
				break;
			}
		}

		if (allDone) {
			if (document.getElementById('btn-send') != null) {
				document.getElementById('btn-send').disabled = false;
				document.getElementById('btn-send').classList
						.remove('disabled');
				document.getElementById('btn-send').setAttribute(
						'aria-disabled', false);
			}
		}

		var elmnt = document.querySelectorAll(".wizard-list .wizard-list-item.active");
		if (elmnt.length > 0) {
			elmnt[0].scrollIntoView({
				behavior : "smooth",
				block : "center",
				inline : "center"
			});
		}
	}

	function getWizard() {
		return document.querySelector(".wizard-list");
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

	function wlButtonClick(click) {
		console.log("click");
		updateDisplay();
	}
	updateDisplay();
</script>
</c:if>