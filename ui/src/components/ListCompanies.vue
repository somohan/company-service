<template>
  <div class="list">
    <h1>Companies</h1>
    <div class="table-response">
      <table class="table table-striped" v-if="companies && companies.length">
        <thead>
        <tr>
          <th>Name</th>
          <th>CVR</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="company of companies">
          <td>{{company.name}}</td>
          <td>{{company.cvr}}</td>
          <td><a :href="company.url" class="btn btn-primary">Show details</a></td>
        </tr>
        </tbody>
      </table>

      <ul v-if="errors && errors.length">
        <h2>There were problems serving your request</h2>
        <li v-for="error of errors">
          {{error.message}}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'list',
    data: () => ({
      companies: [],
      errors: []
    }),
    async created () {
      try {
        const endpoint = process.env.API_ENDPOINT
        const response = await axios.get(endpoint + 'company')
        for (var value of response.data) {
          value.url = '/#/view/' + value.id
          // console.log(value)
        }
        this.companies = response.data
      } catch (e) {
        this.errors.push(e)
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
