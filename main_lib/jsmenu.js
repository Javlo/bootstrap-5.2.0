document.addEventListener("DOMContentLoaded", function (event) {
	let jsMenu = new  JsMenu();
	jsMenu.initJsMenu('#jsmenu');
});

class JsMenu {

	minDepth = 2;
	maxDepth = 4;
	mainClass = "jsmenu";
	ulClass = "";
	liClass = "";
	aClass = "";

	jsMenuIdNum = 1;

	initJsMenu = function (query) {
		let menu = document.querySelector(query);
		if (menu != null) {
			let content = document.querySelector(menu.dataset.content);
			if (content == null) {
				console.error("jsmenu : content item not found : " + menu.dataset.content);
			} else {
				let html = '<div class="'+this.mainClass+'">';				
				let depth = this.minDepth-1;
				let hd = 0;
				let selector = '';
				for (let i = this.minDepth; i < this.maxDepth; i++) {
					selector += 'h'+i+',';
				}
				content.querySelectorAll(selector.substring(0, selector.length-1)).forEach(h => {
					hd = parseInt(h.tagName.substring(1));
					if (hd == depth) {
						html += '</li><li class="'+this.liClass+' _jsmenu_depth_'+hd+'">';
					} else {
						for (let i = 0; i < (depth - hd); i++) {
							html += "</li></ul>";
						}
						for (let i = 0; i < (hd - depth); i++) {
							html += '<ul class="'+this.ulClass+'"><li class="'+this.liClass+' _jsmenu_depth_'+hd+'">';
						}
					}
					html += '<a class="'+this.aClass+(hd==this.minDepth?' _jsmenu_depth_first':' _jsmenu_depth')+'" href="#' + this.getIdAndCreate(h) + '">' + h.innerHTML + '</a>';
					depth = hd;					
				});
				for (hd; hd > 0; hd--) {
					html += "</li>";
				}
				html += '</ul></div>';
				menu.innerHTML = html;
			}
		}
	}

	getIdAndCreate = function (item) {
		let id = item.id;
		if (id === null || id.length == 0) {
			id = "_jsmenu_id_" + this.jsMenuIdNum;
			item.id = id;
			this.jsMenuIdNum++;
		}
		return id;
	}

}