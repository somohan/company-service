const NotFound = { template: '<p>Page not found</p>' };
const Home = { template: '<p>home page</p>' };
const AddCompany = { template: '<p>Add company</p>' };

const routes = {
    '/': Home,
    '/add-company': AddCompany
};

new Vue({
    el: '#app',
    data: {
        currentRoute: window.location.pathname
    },
    computed: {
        ViewComponent () {
            return routes[this.currentRoute] || NotFound
        }
    },
    render (h) { return h(this.ViewComponent) }
})