<template>
  <div id="app" class="container-fluid">
    <div class="row">
      <div class="col-10"><router-view></router-view></div>
      <div class="col-2"><img src="./assets/logo.png" id="logo"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin-top: 20px;
}
#logo {
  float: right;
}
</style>
