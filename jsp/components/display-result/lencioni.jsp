<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
	h1 {
		text-align: center;
	}

	.lencioni {
		--width: 95%;
		--floor-reduction: 134px;
		--backgroundcolor: #777;
		--textcolor: #fff;
		--fontsize: 2.6em;
		max-width: var(--width);
		margin: 30px auto;
	}
	
	.lencioni .floors {
		margin-left: 50px;
	}

	.lencioni .high {
		color: #57b4a1;
	}

	.lencioni .average {
		color: #ffd85b;
	}

	.lencioni .low {
		color: #ff9999;
	}
	
	.lencioni .legend {
		display: flex;
		justify-content: space-around;
		font-size: 2em;
	}
	
	.lencioni .legend .div {
		width: 25%;
		text-align: center;
	}

	@media only screen and (max-width: 1000px) {
		.lencioni {
			--fontsize: 2.4em;
			--floor-reduction: 80px;
		}
	}

	@media only screen and (max-width: 900px) {
		.lencioni {
			--fontsize: 1.4em;
			--floor-reduction: 30px;
		}
		.lencioni .floor {
			flex-direction: column;
		}
	}

	.lencioni .floor {
		height: 100px;
		background-color: var(--backgroundcolor);
		font-size: var(--fontsize);
		display: flex;
		justify-content: space-around;
		align-items: center;
		margin-bottom: 25px;
		color: var(--textcolor);
	}

	.lencioni .floor span {
		font-size: 0.45em;
	}

	.lencioni .floor>div {
		display: flex;
		justify-content: center;
	}

	.lencioni .floor-1 {
		max-width: var(--width);
	}

	.lencioni .floor-2 {
		margin-left: calc(1 * var(--floor-reduction) / 2);
		max-width: calc(var(--width) - var(--floor-reduction));
	}

	.lencioni .floor-3 {
		margin-left: calc(2 * var(--floor-reduction) / 2);
		max-width: calc(var(--width) - 2 *var(--floor-reduction));
	}

	.lencioni .floor-4 {
		margin-left: calc(3 * var(--floor-reduction) / 2);
		max-width: calc(var(--width) - 3 * var(--floor-reduction));
	}

	.lencioni .floor-5 {
		margin-left: calc(4 * var(--floor-reduction) / 2);
		max-width: calc(var(--width) - 4 * var(--floor-reduction));
	}

	.lencioni .text {
		width: 40%;
	}

	.lencioni .floor {
		position: relative;
		z-index: 0;
	}

	.lencioni .floor:before {
		content: " ";
		position: absolute;
		display: block;
		width: 60px;
		height: 100%;
		background-color: var(--backgroundcolor);

		left: -57px;
		z-index: 1;

		border-right: 0px;

		transform-origin: bottom left;
		-ms-transform: skew(-30deg, 0deg);
		-webkit-transform: skew(-30deg, 0deg);
		transform: skew(-30deg, 0deg);
	}

	.lencioni .floor:after {
		content: " ";
		position: absolute;
		display: block;
		width: 60px;
		height: 100%;
		background-color: var(--backgroundcolor);

		top: 0;
		right: -57px;
		z-index: -1;

		border-right: 0px;

		transform-origin: bottom left;
		-ms-transform: skew(-150deg, 0deg);
		-webkit-transform: skew(-150deg, 0deg);
		transform: skew(-150deg, 0deg);
	}

	.lencioni .floors-5 {
		width: var(--width);
	}

	.lencioni .icon {}
</style>

<h1>${title}</h1>

<div class="lencioni">
	<div class="floors">
		<div class="floor floor-5">
			<div class="text text-left"><span>${vi18n['result.lencioni.attention']}</span></div>
			<div class="icon"><i class="bi bi-clipboard-data"></i></div>
			<div class="text text-right ${average['results']>3.75?'high':average['results']<3.25?'low':'average'}"><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${average['results']}" /></div>
		</div>
		<div class="floor floor-4">
			<div class="text text-left"><span>${vi18n['result.lencioni.accountability']}</span></div>
			<div class="icon"><i class="bi bi-award"></i></div>
			<div class="text text-right ${average['accountability']>3.75?'high':average['accountability']<3.25?'low':'average'}">
				<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${average['accountability']}" />
			</div>
		</div>
		<div class="floor floor-3">
			<div class="text text-left"><span>${vi18n['result.lencioni.commitment']}</span></div>
			<div class="icon"><i class="bi bi-pencil"></i></div>
			<div class="text text-right ${average['commitment']>3.75?'high':average['commitment']<3.25?'low':'average'}">
				<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${average['commitment']}" />
			</div>
		</div>
		<div class="floor floor-2">
			<div class="text text-left"><span>${vi18n['result.lencioni.conflict']}</span></div>
			<div class="icon"><i class="bi bi-hammer"></i></div>
			<div class="text text-right ${average['conflicts']>3.75?'high':average['conflicts']<3.25?'low':'average'}">
				<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${average['conflicts']}" />
			</div>
		</div>
		<div class="floor floor-1">
			<div class="text text-left"><span>${vi18n['result.lencioni.trust']}</span></div>
			<div class="icon"><i class="bi bi-shield-check"></i></div>
			<div class="text text-right ${average['trust']>3.75?'high':average['trust']<3.25?'low':'average'}">
				<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${average['trust']}" />
			</div>
		</div>
	</div>
	
	<div class="legend">
		<div class="high"> >= 3.75</div>
		<div class="average"> > 3.25 & < 3.75</div>
		<div class="low"> <= 3.25</div>	
	</div>
	
</div>
