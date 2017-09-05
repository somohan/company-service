<template>
  <div class="add-company card">
    <div class="card-header">
      Add company
    </div>
    <div class="card-body">
      <form>
        <div class="form-group">
          <label class="control-label" for="nameInput">Name</label>
          <input id="nameInput" name="name" v-model.trim="name" class="form-control" placeholder="Company name" v-bind:class="{ 'is-invalid': $v.name.$invalid && submitted }" />
          <p class="text-danger" v-if="$v.name.$invalid && submitted">Please provide a valid name</p>
        </div>

        <div class="form-group">
          <label for="cvrInput">CVR number</label>
          <input type="number" id="cvrInput" v-model.trim="cvr" class="form-control" placeholder="CVR number" v-bind:class="{ 'is-invalid': $v.cvr.$invalid && submitted }" />
          <p class="text-danger" v-if="$v.cvr.$invalid && submitted">Please provide a valid CVR-number</p>
        </div>

        <div class="form-group">
          <label for="addressInput">Address</label>
          <input id="addressInput" v-model.trim="address" class="form-control" placeholder="Address" v-bind:class="{ 'is-invalid': $v.address.$invalid && submitted }" />
          <p class="text-danger" v-if="$v.address.$invalid && submitted">Please provide a valid address</p>
        </div>

        <div class="form-group">
          <label for="cityInput">City</label>
          <input id="cityInput" v-model.trim="city" class="form-control" placeholder="City" v-bind:class="{ 'is-invalid': $v.city.$invalid && submitted }" />
          <p class="text-danger" v-if="$v.city.$invalid && submitted">Please provide a valid city</p>
        </div>

        <div class="form-group">
          <label for="countryInput">Country</label>
          <select v-model="countryCode" id="countryInput" class="form-control" v-bind:class="{ 'is-invalid': $v.countryCode.$invalid && submitted }">
            <option v-for="option in countryCodes" v-bind:value="option.value">
              {{ option.text }}
            </option>
          </select>
          <p class="text-danger" v-if="$v.countryCode.$invalid && submitted">Please provide a valid country</p>
        </div>

        <div class="form-group">
          <label for="phoneNumberInput">Phone number</label>
          <input id="phoneNumberInput" v-model.trim="phoneNumber" class="form-control" placeholder="Phone number" v-bind:class="{ 'is-invalid': $v.phoneNumber.$invalid && submitted }" />
          <p class="text-danger" v-if="$v.phoneNumber.$invalid && submitted">Please provide a valid phone number</p>
        </div>

        <button class="btn btn-primary" @click.prevent="submitForm()" :disabled="submitting">Submit</button>
      </form>
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
  const { required, minLength, maxLength } = require('vuelidate/lib/validators')

  export default {
    name: 'add-company',
    data: () => ({
      submitting: false,
      submitted: false,
      errors: [],
      name: null,
      cvr: null,
      address: null,
      city: null,
      phoneNumber: null,
      countryCode: 'DK',
      countryCodes: [
        { text: 'Denmark', value: 'DK' },
        { text: 'Sweden', value: 'SE' },
        { text: 'Norway', value: 'NO' }
      ],
      async submitForm () {
        this.submitting = true
        this.submitted = true
        if (this.$v.$invalid) {
          this.submitting = false
          return
        }
        try {
          const endpoint = process.env.API_ENDPOINT || 'http://localhost:4567/'
          const response = await axios.post(endpoint + 'company', {
            name: this.name,
            cvr: this.cvr,
            address: this.address,
            city: this.city,
            phoneNumber: this.phoneNumber,
            countryCode: this.countryCode
          })
          // console.log('Company was added. Response: ')
          // console.log(response)
          this.submitting = false
          this.$router.push('/view/' + response.data.id)
        } catch (e) {
          this.errors.push(e)
          this.submitting = false
        }
      }
    }),
    validations: {
      name: {
        required,
        minLength: minLength(4)
      },
      cvr: {
        required: required,
        minLength: minLength(8),
        maxLength: maxLength(8)
      },
      address: {
        required: required
      },
      city: {
        required: required
      },
      countryCode: {
        required: required
      },
      phoneNumber: {
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
