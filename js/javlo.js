// javlo.js - no jquery

var JAVLO_JS_VERSION = "v3.2.7.2 ";

var firstCollaspeTitleOpen = true;

console.log("javlo.js : " + JAVLO_JS_VERSION);

var DEBUG_AJAX_SEARCH = false;

var SCROLL_BODY_LIMIT = 5;

document.addEventListener("DOMContentLoaded", function(event) {
  prepareImageLoadingIfVisible();
  initFixNav();
  staticSearch();
  updateAjaxForms();
  initCollapseBootstrap(".collapse-title");
  searchMark("#content", "mark-text");
  initFixItems();
  testScroll();
  mobileTable('.wysiwyg-paragraph table', 3, 1);
  ajaxNav();
});

function getCurrentAnchor() {
  return window.location.hash ? window.location.hash.substring(1) : null;
}

/*********/
/** FIX **/
/*********/

function getAbsoluteHeight(el) {
  // Get the DOM Node if you pass in a string
  el = (typeof el === 'string') ? document.querySelector(el) : el;

  var styles = window.getComputedStyle(el);
  var margin = parseFloat(styles['marginTop']) +
    parseFloat(styles['marginBottom']);
  return Math.ceil(el.offsetHeight + margin);
}

function initFixNav() {
  let navBar = document.querySelector(".navbar.fixed-top");
  if (navBar != null) {
    var styles = window.getComputedStyle(navBar);
    let sep = getAbsoluteHeight(navBar) - parseFloat(styles['paddingBottom']);
    let main = document.querySelector(".main-container");
    if (main != null) {
      main.style['margin-top'] = sep + "px";
    }
  }
}

function fixItem(item) {
  if (item != null) {

    let top = 0;
    let navBar = document.querySelector(".navbar");
    if (navBar != null && navBar.classList.contains("fixed-top")) {
      top = navBar.offsetHeight;
      if (top < 0) {
        top = 0;
      }
    }
    if (item.classList.contains("fix-item") && window.pageYOffset < item.dataset.scrollLimit) {
      item.classList.remove("fix-item");
      item.style["position"] = "static";
      item.style["width"] = "auto";
      item.removeAttribute("data-scrollLimit");
    }
    if (item.getBoundingClientRect().top <= top) {
      item.style["width"] = item.getBoundingClientRect().width + "px";
      item.style["position"] = "fixed";
      item.style["top"] = top + "px";
      item.classList.add("fix-item");
      if (!item.dataset.scrollLimit) {
        item.dataset.scrollLimit = window.pageYOffset;
      }
    }
  }
}

function initFixItems() {
  if (document.body.classList.contains("fix-sidebar")) {
    fixItem(document.getElementById("sidebar"));
    fixItem(document.getElementById("contextzone"));
    document.onscroll = function(e) {
      fixItem(document.getElementById("sidebar"));
      fixItem(document.getElementById("contextzone"));
    }
  }
}

function startLoading() {
  document.body.classList.add("ajax-loading");
}

function endLoading() {
  document.body.classList.remove("ajax-loading");
}

/**************/
/*** SEARCH ***/
/**************/

function staticSearch() {
  try {
    const elements = {
      data: document.getElementById('staticSearchData'),
      button: document.getElementById('staticSearchButton'),
      result: document.getElementById('staticSearchResult')
    };

    if (!elements.data || !elements.button || !elements.result) {
      DEBUG_AJAX_SEARCH && console.log("Ajax search form not found.");
      return;
    }

    let searchData = [];
    let searchDataReady = false;

    const loadSearchData = async () => {
      if (searchDataReady) return;
      try {
        const response = await fetch(elements.data.getAttribute('href'));
        searchData = await response.json();
        searchDataReady = true;
        DEBUG_AJAX_SEARCH && console.log("Search data loaded:", searchData);
      } catch (error) {
        console.error("Error loading search data:", error);
      }
    };

    const updateSearchResults = function() {
      if (!searchDataReady || !this.value || this.value.length <= 1) {
        elements.result.innerHTML = '';
        elements.result.classList.replace("result", "no-result");
        return;
      }

      const results = search(this.value, searchData, 5);
      elements.result.innerHTML = '';

      if (results.length === 0) {
        elements.result.classList.replace("result", "no-result");
      } else {
        elements.result.classList.replace("no-result", "result");
        const query = this.value;
        results.forEach(item => {
          const url = new URL(item.url, window.location.origin);
          url.searchParams.append('mark-text', query);
          elements.result.innerHTML += `
            <a class="search-item" href="${url}">
              <span class="search-title">${item.title}</span>
              ${item.description ? `<p>${item.description}</p>` : ''}
            </a>`;
        });
      }
    };

    elements.button.addEventListener("focus", loadSearchData);
    elements.button.addEventListener("keyup", updateSearchResults);
    elements.button.addEventListener("paste", updateSearchResults);
  } catch (error) {
    console.error("Error in staticSearch:", error);
  }
}

function search(text, data, maxResult) {
  if (!text || !data?.pages) return [];

  text = text.toLowerCase();
  const results = data.pages
    .map(item => {
      let weight = 0;
      if (item.title?.toLowerCase().includes(text)) weight += 3;
      if (item.description?.toLowerCase().includes(text)) weight += 2;
      if (item.content?.toLowerCase().includes(text)) weight += 1;

      return weight > 0 ? {
        url: item.url,
        title: item.title,
        description: item.description,
        weight: weight + (item.weight || 0)
      } : null;
    })
    .filter(Boolean)
    .sort((a, b) => b.weight - a.weight)
    .slice(0, maxResult);

  return results;
}

function ajaxSubmitForm(form, successFunction, json) {
  const params = new URLSearchParams();
  for (const pair of new FormData(form)) {
    params.append(pair[0], pair[1]);
  }
  if (json) {
    fetch(form.action, { body: params, method: 'post', 'Content-Type': 'text/plain; charset=UTF-8' })
      .then(response => {
        return response.json()
      })
      .then(data => {
        try {
          successFunction(data);
        } catch (error) {
          successFunction();
        }
      });
  } else {
    fetch(form.action, { body: params, method: 'post', 'Content-Type': 'text/plain; charset=UTF-8' })
      .then(response => {
        successFunction(response.text());
      })
  }
}

function executeFunctionByName(functionName, context, args) {
  var args = Array.prototype.slice.call(arguments, 2);
  var namespaces = functionName.split(".");
  var func = namespaces.pop();
  for (var i = 0; i < namespaces.length; i++) {
    context = context[namespaces[i]];
  }
  return context[func].apply(context, args);
}

/***********************/
/*** UTILS FONCTIONS ***/
/***********************/

var reloadPage = function() {
  var doc = document.documentElement, body = document.body;
  var topScroll = (doc && doc.scrollTop || body && body.scrollTop || 0);
  var currentURL = window.location.href;
  if (currentURL.indexOf("_scrollTo") >= 1) {
    currentURL = currentURL.substring(0,
      currentURL.indexOf("_scrollTo") - 1);
  }
  if (currentURL.indexOf("?") < 0) {
    currentURL = currentURL + "?" + "_scrollTo=" + topScroll;
  } else {
    currentURL = currentURL + "&" + "_scrollTo=" + topScroll;
  }
  window.location.href = currentURL;
}

function elementInViewport(el) {
  var top = el.offsetTop;
  var left = el.offsetLeft;
  var width = el.offsetWidth;
  var height = el.offsetHeight;

  while (el.offsetParent) {
    el = el.offsetParent;
    top += el.offsetTop;
    left += el.offsetLeft;
  }

  return (
    top < (window.pageYOffset + window.innerHeight) &&
    left < (window.pageXOffset + window.innerWidth) &&
    (top + height) > window.pageYOffset &&
    (left + width) > window.pageXOffset
  );
}

function askFullscreen() {
  var elem = document.getElementsByTagName("body")[0];
  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.msRequestFullscreen) {
    elem.msRequestFullscreen();
  } else if (elem.mozRequestFullScreen) {
    elem.mozRequestFullScreen();
  } else if (elem.webkitRequestFullscreen) {
    elem.webkitRequestFullscreen();
  }
}

function cancelFullScreen() {
  if (document.cancelFullScreen) {
    document.cancelFullScreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (document.webkitCancelFullScreen) {
    document.webkitCancelFullScreen();
  } else if (document.msCancelFullScreen) {
    document.msCancelFullScreen();
  }
}

function addParam(url, params) {
  var isQuestionMarkPresent = url && url.indexOf('?') !== -1,
    separator = '';
  if (params) {
    separator = isQuestionMarkPresent ? '&' : '?';
    url += separator + params;
  }
  return url;
}

function findGetParameter(parameterName, defaultValue) {
  var result = null,
    tmp = [];
  location.search
    .substr(1)
    .split("&")
    .forEach(function(item) {
      tmp = item.split("=");
      if (tmp[0] === parameterName) {
        result = (tmp[1] + '').replace(/\+/g, '%20');
        result = decodeURIComponent(result);
      }
    });
  if (result == null) {
    return defaultValue;
  } else {
    return result;
  }
}

function getArea(url, area) {
  url = addParam(url, "area-only=" + area);
  fetch(dataItem.getAttribute('href'), opts).then(function(response) {
    return response;
  });
}

function removeParam(sourceURL, key) {
  var rtn = sourceURL.split("?")[0],
    param,
    params_arr = [],
    queryString = (sourceURL.indexOf("?") !== -1) ? sourceURL.split("?")[1] : "";
  if (queryString !== "") {
    params_arr = queryString.split("&");
    for (var i = params_arr.length - 1; i >= 0; i -= 1) {
      param = params_arr[i].split("=")[0];
      if (param === key) {
        params_arr.splice(i, 1);
      }
    }
    rtn = rtn + "?" + params_arr.join("&");
  }
  return rtn;
}

function wrap(el, wrapper) {
  el.parentNode.insertBefore(wrapper, el);
  wrapper.appendChild(el);
}

function getBody(content) {
  var x = content.indexOf("<body");
  x = content.indexOf(">", x);
  var y = content.lastIndexOf("</body>");
  return content.slice(x + 1, y);
}

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/;SameSite=Strict";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function updateAreaById(areaId) {
  // Get current URL
  const url = new URL(window.location.href);

  // Set or update the 'only-area' parameter
  url.searchParams.set('only-area', areaId);

  // Fetch HTML fragment from the server
  fetch(url.toString())
    .then(response => {
      if (!response.ok) throw new Error('Network response was not ok');
      return response.text();
    })
    .then(html => {
      // Replace the content of the element with id = areaId
      const element = document.getElementById(areaId);
      if (element) {
        element.innerHTML = html;
      } else {
        console.warn(`Element with id "${areaId}" not found.`);
      }
    })
    .catch(error => {
      console.error('Fetch error:', error);
    });
}

function searchAreaForItem(item) {
  let current = item;

  console.log("item = ",item);

  while (current) {
    // Check if the element has the class '_area' and an ID
    if (current.classList && current.classList.contains('_area') && current.id) {
      return current.id;
    }
    // Move up to the parent element
    current = current.parentElement;
  }

  // If no matching parent is found, return null
  return null;
}



runScriptInItem = function(i) {
  const scripts = i.querySelectorAll('script');
  scripts.forEach((script) => {
    const newScript = document.createElement('script');
    newScript.textContent = script.textContent;
    document.body.appendChild(newScript);
    script.remove();
  });
}

ajaxDoneDefaultFunction = function(htmlItem, jsonObj) {

  document.body.classList.remove("ajax-loading");
  if (jsonObj.data != null) {
    if (jsonObj.data["need-refresh"]) {
      reloadPage();
    }
  }

  for (let [xhtmlId, xhtml] of Object.entries(jsonObj.insideZone)) {
    if (xhtmlId.indexOf("#") < 0 && xhtmlId.indexOf(" ") < 0) {
      xhtmlId = "#" + xhtmlId;
    }
    var item = document.querySelector(xhtmlId);
    if (item != null && html) {
      item.innerHTML = xhtml;
      runScriptInItem(item);
    }
  }

  // need to update javascript for replace the item, in place of change content
  for (let [xhtmlId, xhtml] of Object.entries(jsonObj.zone)) {
    if (xhtmlId.indexOf("#") < 0 && xhtmlId.indexOf(" ") < 0) {
      xhtmlId = "#" + xhtmlId;
    }
    var item = document.querySelector(xhtmlId);
    if (item != null) {
      item.innerHTML = xhtml;
      runScriptInItem(item);
    }else {
      console.warn("No item found with id : " + xhtmlId);
    }
  }
}

function submitForm(form) {
  let event = new Event('submit', {
    'bubbles': true,
    'cancelable': true
  });
  form.dispatchEvent(event);
}

function updateAjaxForms() {
  try {
    document.querySelectorAll("form.ajax-form").forEach(function(form) {
      form.onsubmit = function(e) {
        e.preventDefault();
        e.stopPropagation();

        startLoading();

        const messageContainer = document.getElementById('message-container');
        if (messageContainer) {
          messageContainer.innerHTML = "";
        }

        const formData = new FormData(form);
        const requestType = form.dataset.type || "json";
        const action = form.getAttribute("data-ajaxaction") || form.action;

        var globalForm = form;

        fetch(action, {
          method: 'post',
          body: formData
        })
        .then(response => response.json())
        .then(data => {
          try {
            ajaxDoneDefaultFunction(globalForm, data);
          } catch (error) {
            console.error("Error in ajax callback:", error);
          } finally {
            endLoading();
          }
        })
        .catch(error => {
          console.error("Error submitting form:", error);
          endLoading();
        });

        return false;
      };
    });
  } catch (error) {
    console.error("Error in updateAjaxForms:", error);
  }
}

function initCollapseBootstrap(cssQuery) {

  if (document.body.classList.contains("edit-preview")) {
    return;
  }

  document.querySelectorAll(cssQuery).forEach(function(title, index) {
    let id = "_collapse-title-" + (index + 1);
    let link = document.createElement("div");

    let idTitle= title.querySelector(".heading-anchor").getAttribute("id");
    let showCss = " show";
    let anchor = getCurrentAnchor();

    if (anchor != null) {
      firstCollaspeTitleOpen = false;
    }

    if (firstCollaspeTitleOpen && index === 0 || idTitle === anchor) {
      link.setAttribute("class", "collapse-title-action");
      link.setAttribute("aria-expanded", "true");
    } else {
      link.setAttribute("class", "collapse-title-action collapsed");
      link.setAttribute("aria-expanded", "false");
      showCss = "";
    }
    link.setAttribute("data-bs-toggle", "collapse");
    link.setAttribute("href", "#" + id);
    link.setAttribute("role", "button");
    link.setAttribute("aria-controls", id);
    display = document.createElement("span");
    display.setAttribute('class', 'collpase-title-arrow');
    let html = title.innerHTML;
    title.innerHTML = '<i class="collapse-on bi bi-chevron-right"></i><i class="collapse-off bi bi-chevron-down"></i> ' + html;

    let sister = title.nextSibling;
    wrap(title, link);
    wrap(title, display);

    let collapseDiv = document.createElement("div");
    collapseDiv.setAttribute("id", id);
    collapseDiv.setAttribute("class", "collapse collapse-title-target" + showCss);
    let collapseDivInWrapper = document.createElement("div");
    collapseDivInWrapper.setAttribute("class", "collapse-title-target-in-wrapper");

    console.log(title.tagName);
    let titleLevel = parseInt(title.tagName.substring(1));
    let sisterLevel = 99;
    if (sister.tagName && sister.tagName.startsWith("H") && sister.tagName.length === 2) {
      sisterLevel = parseInt(sister.tagName.substring(1));
    }

    let wrappedSister = [];
    while (sister != null && sisterLevel > titleLevel) {
      wrappedSister.push(sister);
      sister = sister.nextSibling;
      if (sister != null && sister.tagName && sister.tagName.startsWith("H") && sister.tagName.length == 2) {
        sisterLevel = parseInt(sister.tagName.substring(1));
      }
    }
    wrappedSister.forEach(s=> {
      wrap(s, collapseDivInWrapper);
      wrap(s.parentNode, collapseDiv);
    });
    collapseDiv.querySelectorAll("form").forEach(f => {
      let action = f.getAttribute("action");
      if (action == null) {
        f.setAttribute("action", "#"+idTitle);
      } else {
        if (action.indexOf("#") >= 0) {
          action = action.substring(0, action.indexOf("#"));
        }
        f.setAttribute("action", action + "#"+idTitle);
      }
    })
  });
}

function searchMark(container, cssClass) {
  let query = findGetParameter("mark-text", "");
  if (query != null && query.length > 0) {
    document.querySelectorAll(container).forEach(item => {
      replaceQuery(item, query, cssClass);
    });
  }
}

function replaceQuery(item, query, cssClass) {
  item.childNodes.forEach(child => {
    if (typeof child.innerHTML !== 'undefined') {
      replaceQuery(child, query, cssClass);
    }
  });
  if (item.innerText == item.innerHTML) {
    regEx = new RegExp('(' + query + ')', "ig");
    item.innerHTML = item.innerHTML.replace(regEx, "<span class='" + cssClass + "'>$1</span>");
  }
}

/************/
/** SCROLL **/
/************/

// Function to check if the user has scrolled to the bottom of the page
function isAtBottomOfPage() {
  // Get the total height of the page
  const pageHeight = Math.max(
    document.body.scrollHeight,
    document.body.offsetHeight,
    document.documentElement.clientHeight,
    document.documentElement.scrollHeight,
    document.documentElement.offsetHeight
  );

  // Get the vertical position of the top of the window
  const windowPosition = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

  // Compare the window position with the page height
  return (windowPosition + window.innerHeight) >= pageHeight;
}

function testScroll() {
  var scroll = document.documentElement.scrollTop;
  if (scroll > SCROLL_BODY_LIMIT) {
    document.body.classList.add("scrolled");
    document.body.classList.remove("unscrolled");
  } else {
    document.body.classList.remove("scrolled");
    document.body.classList.add("unscrolled");
  }

  if (isAtBottomOfPage()) {
    document.body.classList.add("scrolled_bottom");
  } else {
    document.body.classList.remove("scrolled_bottom");
  }

}

window.onscroll = function() {
  testScroll();
};

function resetRadio(name) {
  document.querySelectorAll('input[type="radio"][name="' + name + '"]').forEach(b => {
    b.checked = false;
  })
}

function getFormFieldValue(field) {
  if (!field) return null;

  if (field.type === "checkbox") {
    return field.checked; // true si coché, false sinon
  }

  if (field.type === "radio") {
    const checkedRadio = document.querySelector(`input[name="${field.name}"]:checked`);
    return checkedRadio ? checkedRadio.value : null;
  }

  return field.value;
}

function mobileTable(selector, maxCol, finalCol) {
  const tables = document.querySelectorAll(selector);

  tables.forEach(table => {
    const rows = table.querySelectorAll('tr');
    const totalColumns = rows[0].querySelectorAll('th, td').length;

    const hasTD = [...table.querySelectorAll('td')].length > 0;

    if (!hasTD) {
      return;
    }

    let tableGenerated = [];

    if (totalColumns > maxCol) {
      let currentIndex = 0;

      while (currentIndex < totalColumns) {
        const newTable = document.createElement('table');
        newTable.classList.add('splitted-table', 'd-block', 'd-sm-none');

        // Pour chaque rangée...
        for (const row of rows) {
          const newRow = document.createElement('tr');

          // Ajoute la colonne de <th> à chaque nouvelle table
          if (currentIndex !== 0) {
            const thColumn = row.querySelector('th');
            if (thColumn) {
              newRow.appendChild(thColumn.cloneNode(true));
            }
          }

          const columns = row.querySelectorAll('th, td');
          for (let i = currentIndex; i < currentIndex + finalCol && i < totalColumns; i++) {
            newRow.appendChild(columns[i].cloneNode(true));
          }

          newTable.appendChild(newRow);
        }

        // remove table with only th
        if (newTable.querySelectorAll('td').length>0) {
          tableGenerated.unshift(newTable);
        }

        currentIndex += finalCol;
      }

      tableGenerated.forEach(t => {
        table.parentNode.insertBefore(t, table.nextSibling);
      })

      table.classList.add('d-none', 'd-sm-block');
    }
  });
}

function prepareImageLoadingIfVisible() {
  try {
    const images = document.querySelectorAll('img[data-src-on-visible]');
    if (!images.length) return;

    const imageObserver = new IntersectionObserver((entries, observer) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const image = entry.target;
          const src = image.getAttribute('data-src-on-visible');
          if (src) {
            image.src = src;
            image.removeAttribute('data-src-on-visible');
            observer.unobserve(image);
          }
        }
      });
    });

    images.forEach(image => {
      image.classList.add("_lazy_loading_image");
      imageObserver.observe(image);
    });
  } catch (error) {
    console.error("Error in prepareImageLoadingIfVisible:", error);
  }
}

/** POPUP **/

const POPUPURLNAME = "_popupurl";

// Fonction pour trouver un paramètre GET dans l'URL
function findGetParameter(parameterName) {
  let result = null;
  let tmp = [];
  location.search
    .substr(1)
    .split("&")
    .forEach(function (item) {
      tmp = item.split("=");
      if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
    });
  return result;
}

// Fonction pour ajouter un paramètre à l'URL
function addParam(url, param) {
  const separator = (url.indexOf('?') !== -1) ? '&' : '?';
  return url + separator + param;
}

// Fonction pour supprimer un paramètre de l'URL
function removeParam(url, parameter) {
  const urlParts = url.split('?');
  if (urlParts.length >= 2) {
    const urlBase = urlParts.shift();
    const queryString = urlParts.join('?');

    const prefix = encodeURIComponent(parameter) + '=';
    const parts = queryString.split(/[&;]/g);
    for (let i = parts.length; i-- > 0;) {
      if (parts[i].lastIndexOf(prefix, 0) !== -1) {
        parts.splice(i, 1);
      }
    }
    return urlBase + (parts.length > 0 ? '?' + parts.join('&') : '');
  }
  return url;
}

// Fonction pour ouvrir le popup
function openPopup(title, url) {
  const popup = document.createElement('div');
  popup.className = 'main-popup loader';
  popup.innerHTML = '<div class="wrapper">...</div>';
  document.body.appendChild(popup);

  popup.addEventListener('click', () => {
    popup.remove();
  });

  fetch(addParam(url, "only-area=content"), {
    method: 'GET'
  }).then(response => response.text()).then(html => {
    popup.remove();
    const newPopup = document.createElement('div');
    newPopup.className = 'main-popup';
    newPopup.innerHTML = `<div class="wrapper"><button class="close-popup" aria-label="Close" lang="en">x</button>${html}</div>`;
    document.body.appendChild(newPopup);

    const closeButton = newPopup.querySelector('.close-popup');
    closeButton.addEventListener('click', closePopup);
  });
}

// Fonction pour fermer le popup
function closePopup() {
  const popups = document.querySelectorAll('.main-popup');
  if (popups.length === 0) {
    return true;
  } else {
    popups.forEach(popup => popup.remove());
    const newUrl = removeParam(window.location.href, POPUPURLNAME);
    if (newUrl !== window.location.href) {
      window.history.pushState(null, null, newUrl);
    }
    return false;
  }
}

// Gestion de l'ouverture du popup
function initPopupLinks() {
  const popupLinks = document.querySelectorAll('a.popup');
  popupLinks.forEach(link => {
    link.addEventListener('click', function (event) {
      event.preventDefault();
      const url = this.getAttribute('href');
      const updatedUrl = addParam(window.location.href, POPUPURLNAME + '=' + url);
      window.history.pushState("popup", this.getAttribute('title'), updatedUrl);
      openPopup(this.getAttribute('title'), url);
    });
  });
}

// Initialisation au chargement de la page
document.addEventListener('DOMContentLoaded', function () {
  popup();
  initPopupLinks();
});

// Gestion de l'événement "Escape" pour fermer le popup
document.addEventListener('keydown', function (e) {
  if (e.key === "Escape") {
    return closePopup();
  }
});

// Gestion du changement d'état de l'historique
window.addEventListener('popstate', function (event) {
  // Remplacer "ajaxNavDone" par la logique appropriée si nécessaire
  if (typeof ajaxNavDone !== 'undefined' && ajaxNavDone) {
    updateAreas(window.location.href);
  }
  return closePopup();
});

// Fonction principale pour gérer le popup
function popup() {
  const popupParaUrl = findGetParameter(POPUPURLNAME);
  if (popupParaUrl != null) {
    openPopup(popupParaUrl, popupParaUrl);
  }
}

function formatJsonDate(input) {
  let year, month, day;

  // Vérifier si l'input est un objet avec les propriétés year, month, day
  if (input.hasOwnProperty('year') && input.hasOwnProperty('month') && input.hasOwnProperty('day')) {
    year = input.year;
    month = input.month;
    day = input.day;
  }
  // Sinon, vérifier si c'est un tableau avec les indices 0, 1, 2
  else if (Array.isArray(input) && input.length === 3) {
    [year, month, day] = input;
  }
  // Si l'input n'est ni un objet valide ni un tableau valide, retourner une chaîne vide
  else {
    return '';
  }

  // Formatage de la date en 'DD/MM/YYYY'
  return `${day.toString().padStart(2, '0')}/${month.toString().padStart(2, '0')}/${year}`;
}

function formatJsonTime(input) {
  let hours, minutes;

  // Vérifier si l'input est un objet avec les propriétés hours et minutes
  if (input.hasOwnProperty('hours') && input.hasOwnProperty('minutes')) {
    hours = input.hours;
    minutes = input.minutes;
  }
  // Sinon, vérifier si c'est un tableau avec les indices 0 et 1
  else if (Array.isArray(input) && input.length === 2) {
    [hours, minutes] = input;
  }
  // Si l'input n'est ni un objet valide ni un tableau valide, retourner une chaîne vide
  else {
    return '';
  }

  // Formatage de l'heure en 'HH:MM'
  return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
}

function updateAreas(url, item) {
  // Fermer la navigation ajax
  document.querySelectorAll('.ajax-nav.collapse').forEach(collapse => {
    collapse.classList.remove('show');
  });

  if (item != null) {
    // Supprimer la classe "active" de tous les éléments
    document.querySelectorAll('.ajax-nav .nav-item').forEach(navItem => {
      navItem.classList.remove('active');
    });

    // Ajouter la classe "active" à l'élément parent de l'item
    item.parentNode.classList.add('active');

    // Mettre à jour l'historique de navigation
    window.history.pushState(
      item.getAttribute("name"),
      item.getAttribute("title"),
      item.getAttribute("href")
    );

  }

  url = addParam(url, "ajax=true");

  // Effectuer une requête AJAX
  fetch(url, { method: 'GET' })
    .then(response => response.text())
    .then(html => {
      const newHTML = document.createElement('html');
      newHTML.innerHTML = html;

      // Mettre à jour les classes du body
      const bodyClass = newHTML.querySelector('body').className;
      document.body.className = bodyClass;

      document.title = newHTML.querySelector('title').innerText;

      // Mettre à jour les zones dynamiques
      const areasData = document.body.dataset.areas;

      if (areasData) {
        const areas = areasData.split(',');
        areas.forEach(areaId => {
          const newArea = newHTML.querySelector(`#${areaId}`);
          const currentArea = document.getElementById(areaId);

          if (newArea && currentArea) {
            currentArea.outerHTML = newArea.outerHTML;
            executeScriptsFromHTML(newArea.outerHTML);
          } else if (currentArea) {
            currentArea.innerHTML = "";
          }
        });
      } else {
        document.querySelectorAll('._area').forEach(area => {
          const newArea = newHTML.querySelector(`#${area.id}`);
          if (newArea) {
            area.outerHTML = newArea.outerHTML;
            executeScriptsFromHTML(newArea.outerHTML);
          } else {
            area.innerHTML = "";
          }
        });
      }
      ajaxNav();
      handleRefresh(item);
    })
    .catch(error => {
      console.error("Error fetching content:", error);
    });

  return false;
}

function isPreview() {
  return document.body.classList.contains('preview-logged');
}

function ajaxNav() {
  if (isPreview()) {
    return;
  }

  // Gestion des liens dans .ajax-nav
  document.querySelectorAll('.ajax-nav a').forEach(link => {
    if (
      !link.classList.contains("ajax-nav-done") &&
      !link.getAttribute("href").startsWith("http") &&
      (link.getAttribute("href").endsWith(".html") || link.getAttribute("href").endsWith("/"))
    ) {
      link.classList.add("ajax-nav-done");

      link.addEventListener("click", function (event) {
        event.preventDefault(); // Empêcher le comportement par défaut
        document.getElementById('wrapper').classList.add('toggled');
        ajaxNavDone = true;
        return updateAreas(link.getAttribute("href"), link);
      });
    }
  });

  // Gestion des liens avec .content-area-only
  document.querySelectorAll('a.content-area-only').forEach(link => {
    link.addEventListener("click", function (event) {
      event.preventDefault(); // Empêcher le comportement par défaut

      // Supprimer la classe "active" de tous les liens
      document.querySelectorAll('a.content-area-only').forEach(otherLink => {
        otherLink.classList.remove("active");
      });

      // Ajouter la classe "active" au lien cliqué
      link.classList.add("active");

      // Mettre à jour l'historique de navigation
      window.history.pushState(
        link.getAttribute("data-name"),
        link.getAttribute("title"),
        link.getAttribute("href")
      );

      updateAreas(link.getAttribute("href"), link);

      // Effectuer une requête AJAX pour mettre à jour le contenu
      /*fetch(link.getAttribute("href"), {
              method: 'GET',
              headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
              .then(response => response.text())
              .then(html => {
                const contentElement = document.getElementById('content');
                if (contentElement) {
                  contentElement.outerHTML = html; // Remplace le contenu
                }
              })
              .catch(error => {
                console.error("Error fetching content:", error);
              });*/

      return false;
    });
  });
}

function handleRefresh(item) {
  const methodName = item.getAttribute('data-refresh');
  if (methodName) {
    const method = window[methodName];
    if (typeof method === 'function') {
      method(item);
    } else {
      console.warn(`La méthode "${methodName}" n'existe pas.`);
    }
  }
}

function executeScriptsFromHTML(html) {
  // Créer un conteneur temporaire pour analyser le HTML
  const tempDiv = document.createElement('div');
  tempDiv.innerHTML = html;

  // Trouver toutes les balises <script>
  const scripts = tempDiv.querySelectorAll('script');

  // Parcourir chaque balise <script> trouvée
  scripts.forEach(script => {
    if (script.src) {
      // Si le script a un attribut src, le charger dynamiquement
      const newScript = document.createElement('script');
      newScript.src = script.src;
      document.body.appendChild(newScript);
    } else {
      // Si le script contient du code inline, l'exécuter
      const inlineScript = script.textContent || script.innerText;
      if (inlineScript) {
        (new Function(inlineScript))();
      }
    }
  });
}
