var AJAX_LOADER = '<div class="d-flex justify-content-center" style="margin: 60px;"><div class="spinner-border spinner-grow-sm" role="status"><span class="sr-only" lang="en">Loading...</span></div></div></div>';

const {createApp} = Vue;

var vueApp = createApp({
  data() {
    return {
      query: '',
      country: '',
      organization: '',
      openuser: {},
      result: []
    }
  },
  created: function (e) {

  },
  mounted: function () {
    if (showAll) {
      this.update();
    }
  },
  methods: {
    update: function () {
      var self = this;
      startSearch();
      let url = searchUrl + "?text=" + this.query + "&organization=" + this.organization + "&country=" + this.country;
      console.log("url = " + url);
      fetch(url).then(function (response) {
        return response.json().then(function (json) {
          console.log("json : ", json);
          self.result = json;
          endSearch();
        });
      })
    },
    moreInfo: function (user) {
      if (user.country) {
        return true;
      }
      if (user.health) {
        return true;
      }
      if (user.food) {
        return true;
      }
      if (user.info) {
        return true;
      }
      if (user.phone) {
        return true;
      }
      return false;
    }
  }
}).mount('#user-login-registration');

function formatTime(number) {
  str = "" + number;
  if (str.length == 1) {
    str = "0" + str;
  }
  return str;
}

var startLoadingCount = 0;

function startSearch() {
  document.body.classList.add("ajax-loading");
  startLoadingCount++;
}

function endSearch() {
  startLoadingCount--;
  if (startLoadingCount < 0) {
    startLoadingCount = 0;
  }
  console.log("end search startLoadingCount = " + startLoadingCount);
  if (startLoadingCount == 0) {
    document.body.classList.remove("ajax-loading");
  }
}

