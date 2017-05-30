# Mist

## Useful Information

#### Themes:

- There is only one default theme and it has no CSS.
- The theme used is hardcoded. I will add a feature in the future allowing you change this from the dashboard.
- To create your own theme, add a directory titled the name of the theme under `Resources/Views/Themes/`. Then create `index.leaf`, `page.leaf`, and `post.leaf`. Link to any custom CSS or JS you add to the `Public` folder.

#### Database

- Mist uses PostgreSQL.

#### Admin Panel

- The AdminPanel can be accessed by going to `$PORT/admin/login`
- If you seed the data to the DB, the admin credentials are `admin@admin.com` and `admin`.
