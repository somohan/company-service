import Vue from 'vue'
import Router from 'vue-router'
import ListCompanies from '@/components/ListCompanies'
import AddCompany from '@/components/AddCompany'
import ViewCompany from '@/components/ViewCompany'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'listCompanies',
      component: ListCompanies
    },
    {
      path: '/add-company',
      name: 'addCompany',
      component: AddCompany
    },
    {
      path: '/view/:companyId',
      name: 'viewCompany',
      component: ViewCompany
    }
  ]
})
