<template>
  <div class="view card">
    <div class="card-header">
      {{company.name}}
    </div>
    <div class="card-body">
      <div class="card-subtitle">
        <span class="badge badge-pill badge-info">CVR</span>
        {{company.cvr}}</div>

      <p>
        <span class="badge badge-pill badge-info">Address</span>
        {{company.address}}<br/>
        {{company.city}}<br/>
        {{company.countryCode}}
      </p>

      <div v-if="company.phoneNumber != null">
        <span class="badge badge-pill badge-info">Phone number</span>
        {{company.phoneNumber}}
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import router from '../router'

  export default {
    name: 'view',
    data: () => ({
      companyId: null,
      company: {
        companyId: null
      },
      name: '',
      errors: []
    }),
    async created () {
      try {
        let id = router.currentRoute.params.companyId
        const endpoint = process.env.API_ENDPOINT || 'http://localhost:4567/'
        const response = await axios.get(endpoint + 'company/' + id)
        this.company = response.data
      } catch (e) {
        this.errors.push(e)
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .card {
    width: 20rem;
  }
</style>
