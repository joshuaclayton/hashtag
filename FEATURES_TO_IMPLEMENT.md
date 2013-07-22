# Features to Implement

* As a guest, I should be able to search twitter for a hash tag from the homepage
* As a guest, I should see a form and be able to change my search term from the search results page
* As a guest, I should see the correct number of results from a Twitter search when searching (defaults to 15)
* As a guest, I should see SEO-friendly URLs when viewing search results (`/searches/rails`, `/searches/ruby`)
* As a guest, when I perform a search without a hashtag on my query, I should have it prepended automatically

## Caveats

* `$ rm public/index.html`
* Don't have the URLs reflect the search term automatically (`/searches/#ruby`)
* **CASE-INSENSITIVE REGULAR EXPRESSION** (results could be `#RAILS`, `#rails`, or `#RaIlS`)
* `SearchesController`
