document.addEventListener("DOMContentLoaded", function(event) {	
	document.querySelectorAll(".card-chat .form-add-msg").forEach(function(item) {
		item.addEventListener("submit", function(ev) {
			xhr = createXhrObject();
			var input = ev.target.querySelector(".input-reply");
			xhr.open('GET', server+"/ajax?webaction=chat.addmessage&msg="+input.value+"&comp-id="+ev.target.querySelector("[name=comp-id]").value);
			xhr.addEventListener('readystatechange', function() {
				refreshMessage(ev.target.querySelector("[name=comp-id]").value);
				input.value="";	
			});
			xhr.send(null);	
			ev.preventDefault();			
			return false;
		});
		refreshMessage(item.querySelector("[name=comp-id]").value);
	});
	
});

function refreshMessage(compid) {
	xhr = createXhrObject();
	xhr.open('GET', server+"/ajax?webaction=chat.getmessages&comp-id="+compid);		
	xhr.addEventListener('readystatechange', function() {
		if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
			var json = JSON.parse(this.responseText);			
			if (json.messages != null) {
				document.querySelectorAll(".card-chat .discution").forEach(function(item) {
					var newHTML = ""; 
					json.messages.forEach(function(item) {				
						messageType=item.mine?'my-msg':'their-msg';
						newHTML+='<div class="'+messageType+' msg"><div class="text">'+item.body+"</div></div>";
					});	
					item.innerHTML=newHTML;
					item.scrollTop = item.scrollHeight;
				});
			}
		}
	});
	xhr.send(null);	
}

function createXhrObject() {
	if (window.XMLHttpRequest)
		return new XMLHttpRequest();
	if (window.ActiveXObject) {
		var names = [ "Msxml2.XMLHTTP.6.0", "Msxml2.XMLHTTP.3.0", "Msxml2.XMLHTTP", "Microsoft.XMLHTTP" ];
		for ( var i in names) {
			try {
				return new ActiveXObject(names[i]);
			} catch (e) {
			}
		}
	}
	window.alert("Error: no XMLHTTPRequest implementation found.");
	return null; // non supporté
}