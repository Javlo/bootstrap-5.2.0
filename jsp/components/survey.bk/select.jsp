<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form id="form-survey-${compid}" action="${info.currentURL}" method="post">

<input type="hidden" name="webaction" value="select-survey.send" />
<input type="hidden" name="comp-id" value="${compid}" />
<input id="select-value" type="hidden" name="selected" value="" />

<div id="wizard-list" class="wizard-list">

<div id="survey-counter" class="counter">
	<span id="selected-items">0</span> / ${field.select}
</div>	

<div class="row">
<c:forEach var="question" items="${questions}" varStatus="status">
<div class="col-md-6 mb-3">
	<a href="#" class="wizard-list-item card border-left-success h-100 py-2 active" onclick="selectClick(this); return false;">
		<div class="card-body">
			<div class="row no-gutters align-items-center">
				<div class="col-sm-auto mr-2 d-flex justify-content-center">
					<i class="undone-item far fa-square text-gray-300"></i>
					<i class="done-item far fa-check-square text-gray-300"></i>
				</div>
				<div class="col-sm mr-2 d-flex justify-content-center">
					<div class="text-xs font-weight-bold text-success text-uppercase text-center">
						<span class="number"><span class="value hidden">${question.number}</span><span class="display">${status.index+1}</span>.</span>
						${question.label}
					</div>
				</div>
			</div>
		</div>
	</a>
</div>
</c:forEach>
</div>
</div>

<div class="d-flex justify-content-end form-btn-group">
<button class="btn btn-primary btn-block mb-3 disabled" aria-disabled="true" id="btn-send" disabled>${sendLabel}</button>
</div>

</form>

<script>
document.addEventListener("DOMContentLoaded", function (event) {	
});

function updateDisplay() {
	let selectItem = document.querySelectorAll(".wizard-list .wizard-list-item.done .number .value");
	document.getElementById("selected-items").innerHTML = selectItem.length;

	let selected = "";
	let sep="";
	selectItem.forEach(item => {
		selected += sep+item.innerHTML;
		sep=",";
	});
	document.getElementById("select-value").value=selected;

	if (document.querySelectorAll(".wizard-list .wizard-list-item.done").length == ${field.select})	{
		document.getElementById("wizard-list").classList.add("max");
		if (document.getElementById('btn-send') != null) {
			document.getElementById('btn-send').disabled = false;
			document.getElementById('btn-send').classList.remove('disabled');
			document.getElementById('btn-send').setAttribute('aria-disabled', false);			
		}
	} else {
		document.getElementById("wizard-list").classList.remove("max");		
		if (document.getElementById('btn-send') != null) {
			document.getElementById('btn-send').disabled = true;
			document.getElementById('btn-send').classList.add('disabled');
			document.getElementById('btn-send').setAttribute('aria-disabled', true);
		}
	}
	
	if (document.querySelectorAll(".wizard-list .wizard-list-item.done").length > ${field.select})	{
		document.getElementById("wizard-list").classList.add("toomuch");
		document.getElementById("wizard-list").classList.add("max");
	} else {
		document.getElementById("wizard-list").classList.remove("toomuch");
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

function done(link) {	
	if (link.classList.contains('done')) {
		link.classList.add("active");
		link.classList.remove("done");		
	} else {
		link.classList.add("done");
		link.classList.remove("active");
	}	
}

function selectClick(link) {
	console.log(link);
	done(link);
	updateDisplay();
}

// When the user scrolls the page, execute myFunction
window.onscroll = function() {onScroolCounter()};

// Get the header
var counter = document.getElementById("survey-counter");

// Get the offset position of the navbar
var sticky = counter.offsetTop;

// Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
function onScroolCounter() {
  if (window.pageYOffset > sticky) {
	document.body.style.paddingTop = counter.offsetHeight+"px";
    counter.classList.add("sticky");
  } else {
	  document.body.style.paddingTop = "0";
    counter.classList.remove("sticky");
  }
} 
</script>